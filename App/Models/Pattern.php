<?php

namespace App\Models;

class Pattern
{

    private static $table = "pattern_tb";

    /* Post Method*/
    public static function insert($data)
    {
        $connPDO = new \PDO(DBDRIVE . ':host=' . DBHOST . ';dbname=' . DBNAME, DBUSER, DBPASS);


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

        $sql = 'SELECT * FROM ' . self::$table . ' WHERE teacher_fk = :teacher_fk';
        $stmt = $connPDO->prepare($sql);
        $stmt->bindValue(":teacher_fk", $teacher_id);
        $stmt->execute();

        // verificando se padrao já foi cadastrado
        if($stmt->rowCount() > 0){
            $allData = $stmt->fetchAll(\PDO::FETCH_OBJ);

            foreach($allData as $data){
                if($data->pattern_formula == $pattern){
                    return false;
                }
            }
        }

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

        $connPDO = new \PDO(DBDRIVE . ':host=' . DBHOST . ';dbname=' . DBNAME, DBUSER, DBPASS);
        $sql = "SELECT * FROM ".self::$table;

        $stmt= $connPDO->query($sql);
        $patterns = $stmt->fetchAll(\PDO::FETCH_OBJ);

        return $patterns;
    }

    public static function delete($data){

        
        $connPDO = new \PDO(DBDRIVE . ':host=' . DBHOST . ';dbname=' . DBNAME, DBUSER, DBPASS); 
        
        $sql = 'DELETE FROM ' . self::$table . ' WHERE pattern_id = :id';

        $stmt = $connPDO->prepare($sql);
        $stmt->bindValue(":id", $data['id']);
        $stmt->execute();

        if($stmt->rowCount() > 0 ){
            
            return true;
        }

        return false;
    }

}
