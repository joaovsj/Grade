<?php

namespace App\Controllers;
use App\Models\Login;

class loginController{
    public static function post(){
        return Login::check($_POST);
    }
}