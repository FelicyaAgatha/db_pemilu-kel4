<?php
session_start();

// hancurin semua session
session_unset();
session_destroy();

// lempar balik ke login
header("Location: ../view/login.php");
exit;
?>