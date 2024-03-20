<?php
namespace App;

require_once get_template_directory() . '/vendor/autoload.php';

require_once (ABSPATH . 'wp-load.php');
require_once (ABSPATH . 'wp-admin/includes/file.php');
require_once (ABSPATH . 'wp-admin/includes/upgrade.php');



// carbon_fields

require_once __DIR__ . '/CustomFields/productFields.php';
require_once __DIR__ . '/CustomFields/themeFields.php';



require_once __DIR__ . '/helpers.php';

require_once __DIR__ . '/scripts.php';

require_once __DIR__ . '/routes.php';

require_once __DIR__ . '/filters.php';

require_once __DIR__ . '/actions.php';

require_once __DIR__ . '/CPT.php';


add_action('init', function () {

    \WP_CLI::add_command('dbi migrate', function ($args) {

        $className = $args[0] ?? null;

        if ($className) {
            try {
                $migratedClassName = migrations()->migrate_one($className);
            } catch (\Throwable $th) {
                \WP_CLI::error($th->getMessage());
                return;
            }

            \WP_CLI::success('Migration with class name: ' . $migratedClassName . ' was migrated');

            return;
        }

        try {
            $migratedFiles = migrations()->migrate_all();
        } catch (\Throwable $th) {
            \WP_CLI::error($th->getMessage());
            return;
        }

        foreach ($migratedFiles as $file) {
            \WP_CLI::success('Migration: ' . $file . ' was migrated');
        }

    });

    \WP_CLI::add_command('dbi rollback', function ($args) {

        $className = $args[0] ?? null;

        if ($className) {
            try {
                $result = migrations()->rollback_one($className);
            } catch (\Throwable $th) {
                \WP_CLI::error($th->getMessage());
            }
            if ($result) {
                \WP_CLI::success('Migration with class name: ' . $className . ' was rolled back');
            } else {
                \WP_CLI::error('Migration with class name: ' . $className . ' inst migrated');
            }
            return;
        }


        try {
            $rolled_back_files = migrations()->rollback_all();
        } catch (\Throwable $th) {
            \WP_CLI::error($th->getMessage());
            return;
        }

        if(!$rolled_back_files) {
            \WP_CLI::warning('No migrations were rolled back');
            return;
        }

        foreach ($rolled_back_files as $file) {
            \WP_CLI::success('Migration: ' . $file . ' was rolled back');
        }
    });

    \WP_CLI::add_command('dbi create:migration', function ($args) {

        [$fileName] = $args;

        try {
            $fileName = migrations()->create_migration($fileName);
        } catch (\Throwable $th) {
            \WP_CLI::error($th->getMessage());
            return;
        }
    });
});
