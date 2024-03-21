<?php


namespace App\Migrations;


require_once __DIR__ . '/Migration.php';


class wp_options_insering extends Migration
{
    protected $table = 'wp_options';

    public function up()
    {
        global $wpdb;

        $sql = file_get_contents(get_template_directory() . '/App/sql/' . basename(__FILE__, '.php') . '.sql');

        $sqlQuerries = explode(';', $sql);

        foreach ($sqlQuerries as $query) {
            dbDelta($query);
        }
    }

    public function rollback()
    {
        global $wpdb;
        
        return $wpdb->query('TRUNCATE TABLE `wp_options`');
    }
}