<?php
	$host = "localhost";
	$username = "root";
	$password = "";
	$databasename = "schooldb";
	$connect = @mysql_connect($host, $username, $password) or die("Cannot Connect to database");
	@mysql_select_db($databasename, $connect) or die ("Cannot find database");
?>