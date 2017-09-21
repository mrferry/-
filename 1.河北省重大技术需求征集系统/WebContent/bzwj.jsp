<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>帮助文件</title>
<link href="css1/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js1/jquery.js"></script>

<script type="text/javascript">
$(document).ready(function(){
  $(".click").click(function(){
  $(".tip").fadeIn(200);
  });
  
  $(".tiptop a").click(function(){
  $(".tip").fadeOut(200);
});

  $(".sure").click(function(){
  $(".tip").fadeOut(100);
});

  $(".cancel").click(function(){
  $(".tip").fadeOut(100);
});

});
</script>

</head>
<body>

    <div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li>帮助文件</li>
    </ul>
    </div>
    <h1>登录网址:http://localhost:8080/河北省重大技术需求征集系统/login.html</h1>
</body>
</html>