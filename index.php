<?php

$rota = $_GET['url'] ?? 'index';

if(file_exists("public_html/pages/$rota.html"))
    include "public_html/pages/$rota.html";
else 
    include "public_html/pages/error.html";
?>