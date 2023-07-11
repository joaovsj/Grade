<?php

namespace App\Controllers;
use App\Models\Pattern;

class patternController{
    public static function post(){
        return Pattern::insert($_POST);
    }

    public static function get(){
        return Pattern::select($_GET);
    }

    public static function delete(){
        $_DELETE = json_decode(file_get_contents("php://input"), true);
        return Pattern::delete($_DELETE);
    }

    
}