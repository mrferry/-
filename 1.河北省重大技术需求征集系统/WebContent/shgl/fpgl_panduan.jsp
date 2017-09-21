<%@ page contentType="text/html; charset=UTF-8" language="java"
	import="java.sql.*"  pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; utf-8">
<title>分配管理结果判断</title>
</head>
<body>
    <jsp:useBean id="db" class="bean.DBbean" scope="page" />
	<%
	request.setCharacterEncoding("UTF-8");
	String submit = request.getParameter("submit");
	String tech_no = request.getParameter("tech");
	String no = request.getParameter("no");
	String gl = request.getParameter("xzglbm");
	String s ="";
	if(!submit.equals("")&&submit!=null)
	{
		if(submit.equals("确认"))
		{
			s="update basis_information set state=2,glbm='"+gl+"' where no='"+no+"'and tech_no='"+tech_no+"'";
			System.out.println(s);
			int i = db.executeUpdate(s);
			if (i == 1) {
				out.println("<script language='javaScript'> alert('审核完成,点击确定继续审核!');</script>");
				response.setHeader("refresh", "0;url=shgl_xssh_xqlb.jsp");
			} else {
				out.println("<script language='javaScript'> alert('出错了！');</script>");
				response.setHeader("refresh", "1;url=shgl_xssh_xqlb.jsp");
			}
		}
		else if(submit.equals("返回"))
		{
			out.println("<script language='javaScript'> alert('请重新选择审核!');</script>");
			response.setHeader("refresh", "0;url=shgl_xssh_xqlb.jsp");
		}
		
	}
	
	db.close();
	%>
</body>
</html>