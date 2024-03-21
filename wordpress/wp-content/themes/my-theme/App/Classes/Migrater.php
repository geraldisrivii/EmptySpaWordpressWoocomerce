<?php


namespace App\Classes;

class Migrater
{

    private static $instance; // Singleton

    private static $namespace = 'App\\Migrations\\';
    private static $pathToMigrations = '/App/migrations/';
    private static $pathToTemplates = '/App/templates/';
    private static $pathToSql = '/App/sql/';

    private static $pathToOrderFile = '/App/migrationOrder.json';

    private static $tableName = 'wp_migrations';

    private array $paths = [];

    public function __construct()
    {
        global $wpdb;

        $db_name = $wpdb->dbname;

        $tableName = Migrater::$tableName;

        if ($wpdb->get_row("SHOW TABLES FROM $db_name LIKE '$tableName'")) {
            Migrater::$instance = $this;
            return;
        }

        $wpdb->query("CREATE TABLE `$db_name`.`$tableName` 
        (
            `id` INT NOT NULL AUTO_INCREMENT ,
            `migration_name` VARCHAR(40) NOT NULL ,
            `table_name` VARCHAR(40) NOT NULL ,
            `is_migrated` BOOLEAN NOT NULL ,
         PRIMARY KEY (`id`)) ENGINE = InnoDB");

        $classNames = $this->get_class_names();

        foreach ($classNames as $className) {
            $wpdb->insert($tableName, ['id' => null, 'migration_name' => $className, 'is_migrated' => false]);
        }

        Migrater::$instance = $this;
        return;
    }

    public static function getInstance() // Singleton
    {
        if (is_null(self::$instance)) {
            self::$instance = new self;
        }
        return self::$instance;
    }

    private function dir_open()
    {
        $dirHandle = opendir(get_template_directory() . Migrater::$pathToMigrations);

        return $dirHandle ? $dirHandle : false;
    }

    private function check_migrations_order_file()
    {
        if (!file_exists(get_template_directory() . Migrater::$pathToOrderFile)) {
            file_put_contents(get_template_directory() . Migrater::$pathToOrderFile, json_encode([]));
            // Устанавливаем права для возможности редактирования файла
            chmod(get_template_directory() . Migrater::$pathToOrderFile, 0777);
        }
    }

    private function get_class_names()
    {
        $this->check_migrations_order_file();
        return json_decode(file_get_contents(get_template_directory() . Migrater::$pathToOrderFile), true);
    }

    private function require_all_migrations()
    {
        $dirHandle = $this->dir_open();

        while (false !== ($file = readdir($dirHandle))) {
            if ($file !== '.' && $file !== '..' && $file != 'Migration.php') {
                require_once get_template_directory() . Migrater::$pathToMigrations . $file;
            }
        }
    }

    public function migrate_one($className)
    {
        $this->require_all_migrations();

        $classPath = Migrater::$namespace . $className;

        $instance = new $classPath();

        $instance->up();

        return $className;
    }

    public function rollback_one($className)
    {
        $this->require_all_migrations();

        if($this->check_migration_in_db($className) === false) {
            return false;
        }

        if($this->check_migration_status_in_db($className) === false) {
            return false;
        }

        $classPath = Migrater::$namespace . $className;

        $instance = new $classPath();

        $result = $instance->rollback();

        $this->update_migration_status_in_db($className, false);

        return $result;
    }
    private function update_migration_status_in_db($className, $status = true)
    {
        global $wpdb;

        $id = $wpdb->update(Migrater::$tableName, [
            'is_migrated' => $status
        ], [
            'migration_name' => $className
        ]);

        return $id;
    }

    private function check_migration_status_in_db($className)
    {
        global $wpdb;

        $object = $wpdb->get_row("SELECT * FROM `wp_migrations` WHERE `migration_name` = '$className'");

        return $object->is_migrated ? true : false;
    }
    private function insert_migration_in_db($className)
    {
        global $wpdb;

        $id = $wpdb->insert(Migrater::$tableName, [
            'id' => null,
            'migration_name' => $className,
            'is_migrated' => false
        ]);

        return $id;
    }

    private function check_migration_in_db($className)
    {
        global $wpdb;

        return $wpdb->get_row("SELECT * FROM `wp_migrations` WHERE `migration_name` = '$className'")
            ? true : false;
    }

    public function migrate_all()
    {
        $migratedFiles = [];

        $classNames = $this->get_class_names();

        $this->require_all_migrations();

        foreach ($classNames as $className) {
            $classPath = Migrater::$namespace . $className;

            $isInDataBase = $this->check_migration_in_db($className);

            if (!$isInDataBase) {
                $this->insert_migration_in_db($className);
            }

            $status = $this->check_migration_status_in_db($className);
            
            if($status === true) {
                continue;
            }

            if(){

            }
            
            $instance = new $classPath();
            
            $instance->up();

            $this->update_migration_status_in_db($className, true);

            $migratedFiles[] = $classPath;
        }

        return $migratedFiles;
    }

    public function rollback_all()
    {
        $rolled_back_files = [];

        $classNames = $this->get_class_names();

        $this->require_all_migrations();

        $resultOfAll = [];

        foreach ($classNames as $className) {
            if($this->check_migration_in_db($className) === false) {
                $this->insert_migration_in_db($className); 
            }

            if($this->check_migration_status_in_db($className) === false) {
                continue;
            }

            $classPath = Migrater::$namespace . $className;

            $instance = new $classPath();

            $resultOfAll[] = $instance->rollback();

            $this->update_migration_status_in_db($className, false);

            $rolled_back_files[] = $classPath;
        }

        if (in_array(false, $resultOfAll) && !empty($resultOfAll)) {
            return false;
        }

        return $rolled_back_files;
    }
    public function create_migration($migrationName, $templateName = 'MigrationTemplate')
    {
        $fileName = date('Y_m_d') . ':' . $migrationName;

        $filePathPhp = get_template_directory() . Migrater::$pathToMigrations . $fileName . '.php';

        $filePathSql = get_template_directory() . Migrater::$pathToSql . $fileName . '.sql';

        $templateContent = file_get_contents(get_template_directory() . Migrater::$pathToTemplates . $templateName . '.php');

        $templateContent = str_replace(['ReplacedClass', 'wp_my_table'], $migrationName, $templateContent);

        file_put_contents($filePathPhp, $templateContent);

        chmod($filePathPhp, 0777);

        file_put_contents($filePathSql, '');

        chmod($filePathSql, 0777);

        // Добавление миграции в файл с порядком миграций

        $classNames = $this->get_class_names();
        $classNames[] = $migrationName;

        $this->insert_migration_in_db($migrationName);

        file_put_contents(get_template_directory() . Migrater::$pathToOrderFile, json_encode($classNames));

        return $fileName;
    }
}