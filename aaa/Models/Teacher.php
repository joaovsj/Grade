<?php

namespace App\Models;

class Teacher
{

    private static $table = "teacher_tb";

    public static function insert($data)
    {
        /* Data must have [teacher_name] */
        $connPDO = new \PDO(DBDRIVE . ':host=' . DBHOST . ';dbname=' . DBNAME, DBUSER, DBPASS);
        $sql = 'INSERT INTO ' . self::$table . ' VALUES (0,:name)';
        $stmt = $connPDO->prepare($sql);
        $stmt->bindValue(":name", $data['teacher_name']);
        $stmt->execute();

        if ($stmt->rowCount() > 0) {
            return "Success to register teacher!";
        } 
        return "Something got wrong...";
    }
}
