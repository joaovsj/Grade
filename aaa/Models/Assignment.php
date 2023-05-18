<?php

namespace App\Models;

class Assignment
{

    private static $table = "assignment_tb";

    /* Post Method*/
    public static function insert($data)
    {

    /* Data must have [assignment_name] */
        $connPDO = new \PDO(DBDRIVE . ':host=' . DBHOST . ';dbname=' . DBNAME, DBUSER, DBPASS);
        $sql = 'INSERT INTO ' . self::$table . ' VALUES (0,:name)';
        
        $stmt = $connPDO->prepare($sql);
        $stmt->bindValue(":name", $data['assignment_name']);
        $stmt->execute();

        if ($stmt->rowCount() > 0) {
            return "Success to register assignment!";
        } 
        return "Something got wrong...";
    }

    /* Get Method*/
    public static function select($data = null){
        /* if you don't send the id by GET, it'll list all of students*/
        /* To send the ID, put it on after the class name, for example: http://localhost/grades/public_html/api/classname/1 */

        $id = substr($data["url"],-1);
        $id = is_numeric($id)  ? " WHERE assignment_id = $id" : "";

        $connPDO = new \PDO(DBDRIVE . ':host=' . DBHOST . ';dbname=' . DBNAME, DBUSER, DBPASS);
        $sql = "SELECT * FROM ".self::$table.$id;

        $stmt= $connPDO->query($sql);
        $assignment = $stmt->fetchAll(\PDO::FETCH_OBJ);
        return $assignment;
    }
}