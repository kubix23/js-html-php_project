<?php
$link = mysqli_connect('127.0.0.1:3306','root','','sklep');
$query = mysqli_query($link,'SELECT * FROM produkty');
$wynik = mysqli_fetch_all($query);
$tabela = [];

$strona = intval($_POST['strona']);

for($i=($strona*10)-10;$i < (($strona*10));$i++){
    $simple = [];
    $simple[0] = $wynik[$i];
    
    $tabela = array_merge($tabela,$simple);
}

print_r(json_encode([$tabela,count($wynik)]));
?>