<?php
session_start();
 unset($_SESSION['login']);
 echo($_SESSION['login']);
session_destroy();