<?php

$host = "localhost";
$username = "root";        
$password = "YOUR_DATABASE_PASSWORD_HERE"; 
$dbname = "animalfarmdb"; 

try {
    $conn = new mysqli($host, $username, $password, $dbname);
    $conn->set_charset("utf8mb4");
} catch (Exception $e) {
    die("Database connection error: " . $e->getMessage());
}
?>