<?php

namespace App\Models;

class Login
{
    public static function check($data){
        $connPDO = new \PDO(DBDRIVE . ':host=' . DBHOST . ';dbname=' . DBNAME, DBUSER, DBPASS);

        // Generic name to use with different controllers
        $email = $_POST["email"];
        $password = $_POST["password"];

        // Controller is the type of user who will login
        // http://localhost/grade/public_html/api/login?controller=teacher
        $controller = $_GET["controller"];

        $sql = "SELECT * FROM ".$controller."_tb WHERE ".$controller."_email = :email AND ".$controller."_password = :password";
        $stmt = $connPDO->prepare($sql);
        $stmt->bindValue(":email", $email);
        $stmt->bindValue(":password", sha1($password));
        $stmt->execute();
        $data = $stmt->fetch(\PDO::FETCH_OBJ);

        if ($data) {
            return $data;

        } else{

            return false;
        }
    }
}
