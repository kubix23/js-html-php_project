<?php
session_start();
$_SESSION['czas'] ??= time()+(61*5);

if(!isset($_COOKIE['rejestracja']) && $_SESSION['czas'] - time() <= 0){
    if($_POST['captch'] == $_SESSION['captchstr']){
        $login = trim($_POST['login']);
        $password = trim($_POST['password']);
        $imienazwisko = trim($_POST['imienazwisko']);
        $ulica = trim($_POST['ulica']);
        $miasto = trim($_POST['miasto']);
    
        $A = preg_match('/\w{5,}/',$login);
        $B = preg_match('/(?=^.{8,}$)((?=.*\d)|(?=.*[a-zA-zęóąśłżźćńĘÓĄŚŁŻŹĆŃ]+))(?![.\n])(?=.*[A-ZĘÓĄŚŁŻŹĆŃ])(?=.*[a-zęóąśłżźćń]).*$/',$password);
        $C = preg_match('/(\w|\s)*/',$imienazwisko);
        $D = preg_match('/.*(?:\d)/',$ulica);
        $E = preg_match('/[a-zA-zęóąśłżźćńĘÓĄŚŁŻŹĆŃ]*/',$miasto);
    
        if($A && $B && $C && $D && $E){
            $link = mysqli_connect('127.0.0.1:3306','root','','sklep');
            $sql = mysqli_query($link,"INSERT INTO klienci(ImięNazwisko,Login,Hasło,Ulica,Miasto) VALUES ('$imienazwisko','$login','$password','$ulica','$miasto')");
    
            if($sql){
                echo('ok');
                setcookie('rejestracja','tak',time()+60*5);
                $_SESSION['czas'] = time();
            }
        }else{
            echo('cheater');
        }
    }else{
        echo('noCaptch');
    }
}else{
    echo('double');
}