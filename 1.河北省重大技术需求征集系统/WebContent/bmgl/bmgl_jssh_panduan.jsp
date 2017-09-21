<%@ page contentType="text/html; charset=UTF-8" language="java"
	import="java.sql.*"  pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; utf-8">
<title>技术审核结果判断</title>
</head>
<body>
    <jsp:useBean id="db" class="bean.DBbean" scope="page" />
	<%
	request.setCharacterEncoding("UTF-8");
	String submit = request.getParameter("submit");
	String tech_no = request.getParameter("tech");
	String no = request.getParameter("no");
	String s ="";
	if(submit.equals("同意"))
	{
		s="update basis_information set state=4 where no='"+no+"'and tech_no='"+tech_no+"'";
	}
	else
	{
		s="update basis_information set state=3 where no='"+no+"'and tech_no='"+tech_no+"'";
	}
	int i = db.executeUpdate(s);
	if (i == 1) {
		out.println("<script language='javaScript'> alert('审核完成,点击确定继续审核!');</script>");
		response.setHeader("refresh", "0;url=../tjcx/tjcx_shouye.jsp");
	} else {
		out.println("<script language='javaScript'> alert('出错了！');</script>");
		response.setHeader("refresh", "1;url=../tjcx/tjcx_shouye.jsp.jsp");
	}
	db.close();
	%>
</body>
</html>