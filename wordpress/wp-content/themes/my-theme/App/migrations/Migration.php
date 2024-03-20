<?php

namespace App\Migrations;

abstract class Migration
{
    public abstract function up();
    public abstract function rollback();
}