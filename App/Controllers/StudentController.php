<?php

namespace App\Controllers;
use App\Models\Student;

class studentController{
    public static function post(){
        return Student::insert($_POST);
    }
    public static function get(){
        return Student::select($_GET);
    }

}