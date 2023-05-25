<?php

$rota = $_GET['url'] ?? 'index';

if(file_exists("public_html/resources/views/$rota.html"))
    include "public_html/resources/views/$rota.html";
else 
    include "public_html/resources/views/error.html";
    
?>