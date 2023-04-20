<?php
 session_start();

//openssl_decrypt(file_get_contents('php://input'),)

 if(isset($_POST['captch'])){
    $_SESSION['captchstr'] = $_POST['captch'];

 }else{
    $login = $_POST['login'];
    $password = $_POST['password'];
    $capatch = $_POST['capatch'];

    if($_SESSION['captchstr'] == @$capatch){
        $link = mysqli_connect('127.0.0.1:3306','root','','sklep');
        $query1 = mysqli_query($link,'SELECT * FROM klienci');
        $wynik1 = mysqli_fetch_all($query1);

        $match = array_map(function($all) use($login,$password){
            if($all[2] == $login && $all[3] == $password){
                return true;
            }
        },$wynik1);

        $index = array_search('1',$match);
        $_SESSION['userId'] = $index;

        if($index >= 0){
            $_SESSION['login'] = true;
        }

        echo($index);
        //zwracało true

    }else{
        echo('noCaptch');
    }
}
    



 