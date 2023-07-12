<?php

namespace App\Models;

class Grade
{

    private static $table = "grade_tb";

    /* Post Method*/
    public static function insert($data)
    {
        // die(print_r($data));
        /* Data must have the [assignment_id], the [student_id] and the [grade] (MB, B, R or I)*/

        $connPDO = new \PDO(DBDRIVE . ':host=' . DBHOST . ';dbname=' . DBNAME, DBUSER, DBPASS);
        $sql = 'INSERT INTO ' . self::$table . ' VALUES (0, :grade, :assignment, :student)';

        $stmt = $connPDO->prepare($sql);
        $stmt->bindValue(":grade", $data['assignment_grade']);
        $stmt->bindValue(":assignment", $data['assignment_fk']);
        $stmt->bindValue(":student", $data['student_fk']);
        $stmt->execute();

        if ($stmt->rowCount() > 0) {
            return true;
        } 
        return false;
    }

    /* Get Method*/
    public static function select($data = null){
        /* if you don't send the id by GET, it'll list all of students*/
        /* To send the ID, put it on after the class name, for example: http://localhost/grades/public_html/api/classname/1 */

        $id = substr($data["url"],-1);
        $id = is_numeric($id)  ? " WHERE student_fk = $id" : "";

        $connPDO = new \PDO(DBDRIVE . ':host=' . DBHOST . ';dbname=' . DBNAME, DBUSER, DBPASS);
        $sql = "SELECT student_name, assingment_name, assignment_grade FROM ".self::$table." 
        INNER JOIN student_tb 
        ON  student_id = student_fk 
        INNER JOIN assignment_tb
        ON assignment_id = assignment_fk".$id;

        $stmt= $connPDO->query($sql);
        $assignment = $stmt->fetchAll(\PDO::FETCH_OBJ);
        return $assignment;
    }
}
