<?php


namespace App\Migrations;


require_once __DIR__ . '/Migration.php';


class test_insert extends Migration
{
    protected $table = 'wp_posts';

    public function up()
    {
        global $wpdb;

        $sql = file_get_contents(get_template_directory() . '/App/sql/' . basename(__FILE__, '.php') . '.sql');

        dbDelta($sql);
    }

    public function rollback()
    {
        global $wpdb;
        
        return $wpdb->query('TRUNCATE TABLE `wp_posts`');
    }
}