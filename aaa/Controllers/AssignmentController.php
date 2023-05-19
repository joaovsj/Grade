<?php

namespace App\Controllers;
use App\Models\Assignment;

class assignmentController{
    public static function post(){
        return Assignment::insert($_POST);
    }
    public static function get(){
        return Assignment::select($_GET);
    }
}