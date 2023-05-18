<?php

namespace App\Controllers;
use App\Models\Teacher;

class teacherController{
    public static function post(){
        return Teacher::insert($_POST);
    }
}