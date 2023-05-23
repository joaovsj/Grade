<?php

namespace App\Models;

class Teacher
{

    private static $table = "teacher_tb";

    public static function insert($data)
    {

        /* Data must have [teacher_name] */
        $connPDO = new \PDO(DBDRIVE . ':host=' . DBHOST . ';dbname=' . DBNAME, DBUSER, DBPASS);
        $sql = 'INSERT INTO ' . self::$table . ' VALUES (0,:name, :email, :password)';
        $stmt = $connPDO->prepare($sql);
        $stmt->bindValue(":name", $data['teacher_name']);
        $stmt->bindValue(":email", $data['teacher_email']);
        $stmt->bindValue(":password", $data['teacher_password']);

        $stmt->execute();

        if ($stmt->rowCount() > 0) {
            return "Success to register teacher!";
        } 
        return "Something got wrong...";
    }
}
