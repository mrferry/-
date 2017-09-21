<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
  <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  <title>登陆</title>
 </head>
 <body>
 <center>
		<h1>河北省重大需求征集系统</h1>
	<form action="judge.jsp" method="post">
    <br>机构编码
    <input type ="text" name = "user"size=16/>
    <br>
    <br>登录密码 
    <input type="password" name="passwd" size=16/>
    <br>
    <br>
    <input type ="submit"name = sm value="确定"/> 
    <input type="reset" name="reset"value="重置">
    </form>
    <br>
    <a href="zhuce.jsp">点击注册单位账号</a>
 </center>
 </body>
</html>