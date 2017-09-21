<%@ page contentType="text/html; charset=UTF-8" language="java"
	import="java.sql.*"  pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; utf-8">
<title>判断</title>
</head>
<body>
    <jsp:useBean id="db" class="bean.DBbean" scope="page" />
    <script>
	<%
	request.setCharacterEncoding("UTF-8");
	String submit = request.getParameter("submit");
	String tech_no = request.getParameter("tech");
	String no = request.getParameter("no");
	String s ="";
	int k=0;
	if(submit.equals("确定"))
	{
		k++;
	}
	
	if (k ==1) {
		out.println("<script language='javaScript'> alert('成功！');</script>");
		response.setHeader("refresh", "0;url=../yonghu/xqgl.jsp?no="+no+"");
	} else {
		out.println("<script language='javaScript'> alert('出错了！');</script>");
		response.setHeader("refresh", "1;url=../yonghu/xqgl.jsp?no="+no+"");
	}
	db.close();
	%>
	</script>
</body>
</html>