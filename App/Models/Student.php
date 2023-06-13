<?php

namespace App\Models;

class Student
{

    private static $table = "student_tb";

    /* Post Method*/
    public static function insert($data)
    {
    /* Data must have [student_name] */
        $connPDO = new \PDO(DBDRIVE . ':host=' . DBHOST . ';dbname=' . DBNAME, DBUSER, DBPASS);
        $sql = 'INSERT INTO ' . self::$table . ' VALUES (0,:name, :age)';

        $stmt = $connPDO->prepare($sql);
        $stmt->bindValue(":name", $data['student_name']);
        $stmt->bindValue(":age", $data['student_age']);
        $stmt->execute();

        if ($stmt->rowCount() > 0) {
            return "Success to register student!";
        } 
        return "Something got wrong...";
    }

    /* Get Method*/
    public static function select($data = null){
        /* if you don't send the id by GET, it'll list all of students*/
        /* To send the ID, put it on after the class name, for example: http://localhost/grades/public_html/api/classname/1 */

        $id = substr($data["url"],-1);
        $id = is_numeric($id)  ? " WHERE student_id = $id" : "";

        $connPDO = new \PDO(DBDRIVE . ':host=' . DBHOST . ';dbname=' . DBNAME, DBUSER, DBPASS);
        $sql = "SELECT * FROM ".self::$table.$id;

        $stmt= $connPDO->query($sql);
        $students = $stmt->fetchAll(\PDO::FETCH_OBJ);
        return $students;
    }
}
