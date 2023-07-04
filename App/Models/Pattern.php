<?php

namespace App\Models;

class Pattern
{

    private static $table = "pattern_tb";

    /* Post Method*/
    public static function insert($data)
    {
        

        $teacher_id = $data["id"];
        unset($data["id"]);

        $pattern = "";
        foreach ($data as $key => $value) {
            if($key == "primeira"){
                $pattern .= $value;

            }else if($key != "final"){
                $pattern .= " + ".$value;    

            }else{
                $pattern .= " = ".$value;
            }
        }
        
        $connPDO = new \PDO(DBDRIVE . ':host=' . DBHOST . ';dbname=' . DBNAME, DBUSER, DBPASS);
        $sql = 'INSERT INTO ' . self::$table . ' VALUES (0, :pattern_formula, :teacher_fk)';
        
        $stmt = $connPDO->prepare($sql);
        $stmt->bindValue(":pattern_formula",  $pattern);
        $stmt->bindValue(":teacher_fk", $teacher_id);
        $stmt->execute();

        if ($stmt->rowCount() > 0) {
            return true;
        } 
        return false;
    }

    /* Get Method*/
    public static function select($data = null){

    }
}
