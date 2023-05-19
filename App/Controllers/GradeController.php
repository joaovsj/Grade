<?php

namespace App\Controllers;
use App\Models\Grade;

class gradeController{
    public static function post(){
        return Grade::insert($_POST);
    }
    public static function get(){
        return Grade::select($_GET);
    }
}