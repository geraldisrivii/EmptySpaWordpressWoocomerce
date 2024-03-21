<?php

namespace App\Migrations;

abstract class Migration
{
    protected $table = 'wp_actionscheduler_actions';

    public function table()
    {
        return $this->table;
    }
    public abstract function up();
    public abstract function rollback();
}