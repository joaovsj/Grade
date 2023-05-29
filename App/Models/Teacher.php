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
        $stmt->bindValue(":password", sha1($data['teacher_password']));

        try {
            $stmt->execute();
            return "Success to register teacher!";
        
        // If email isn't registered, it was aready registered.
        
        } catch (\Throwable $th) {
            return [
                "error" => 1,
                "message" => "Email was aready registered"
            ];
        }
        
    }
}
