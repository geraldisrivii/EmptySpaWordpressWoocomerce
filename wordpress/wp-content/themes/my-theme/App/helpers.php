<?php

use App\Classes\Migrater;
use App\Classes\Session;
use App\Classes\YookassaServise;

function session(){
    $session = Session::getInstance();

    return  $session;
}
function yookassa(){
    $yookassa = YookassaServise::getInstance();

    return  $yookassa;
}

function migrations(){
    $migrations = Migrater::getInstance();

    return  $migrations;
}