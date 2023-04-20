<?php
session_start();
$link = mysqli_connect('127.0.0.1:3306','root','','sklep');
$zamówienie = $_POST['zamow'];
$userID = $_SESSION['userId'] + 1;

mysqli_query($link,"INSERT INTO zamówienia(ImięNazwisko,Przedmioty) VALUES ('$userID','$zamówienie')");