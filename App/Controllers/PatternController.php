<?php

namespace App\Controllers;
use App\Models\Pattern;

class patternController{
    public static function post(){
        return Pattern::insert($_POST);
    }

    public static function get(){
        return Pattern::select($_POST);
    }
}