<?php
    include_once "connection.php";
    
    if(isset($_POST['btnAdminLogin'])) 
    {
        $admin_username = $_POST['adminusername'];
        $admin_pwd = $_POST['adminpassword'];
		
        $query = mysql_query("select * from admin WHERE username = '$admin_username'");
        $result = mysql_fetch_object($query);
	
        if($result)
        {
            $storedUsername = $result->username;
            $storedPwd = $result->password;
        }
        
        if((null == $_POST['adminusername']) || (null == $_POST['adminpassword']))
        {
            header("Location: login.php");
        }
        else if($storedUsername == $_POST['adminusername']
        &&
        $storedPwd == $_POST['adminpassword'])
        {
            header("Location: index.php");
        }
        else
        {
            $auth = "fail";
            header("Location: login.php");
        }
    }
?>