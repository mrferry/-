<%@ page contentType="text/html; charset=UTF-8" language="java"
	import="java.sql.*"  pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; utf-8">
<title>形式审核结果判断</title>
</head>
<body>
    <jsp:useBean id="db" class="bean.DBbean" scope="page" />
	<%
	request.setCharacterEncoding("UTF-8");
	String submit = request.getParameter("submit");
	String tech_no = request.getParameter("tech");
	String no = request.getParameter("no");
	String s ="";
	if(!submit.equals("")&&submit!=null)
	{
		if(submit.equals("同意"))
		{
			out.println("<script language='javaScript'> alert('请分配要发往的管理部门!');</script>");
			response.setHeader("refresh", "0;url=fpgl.jsp?no=" + no+"&&tech="+tech_no+"");
		}
		else if(submit.equals("不同意"))
		{
			out.println("<script language='javaScript'> alert('请填写不同意意见!');</script>");
			response.setHeader("refresh", "0;url=shgl_xqgl_yijian.jsp?no=" + no+"&&tech="+tech_no+"");
		}
		
	}
	
	db.close();
	%>
</body>
</html>