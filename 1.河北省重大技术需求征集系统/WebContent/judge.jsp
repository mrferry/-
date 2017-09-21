<%@ page contentType="text/html; charset=UTF-8" language="java"
	import="java.sql.*"  pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; utf-8">
<title>判断</title>
</head>
<body>
      <center>
		<jsp:useBean id="db" class="bean.DBbean" scope="page" />
		<%
			request.setCharacterEncoding("UTF-8");
			String no = request.getParameter("user");
			String pwd = request.getParameter("passwd");
			if (!no.equals("") && !pwd.equals("") ) 
			{
				
				String s = "select * from info where no='"+no+"'";
				ResultSet rs = db.executeQuery(s);
				while (rs.next()) {
				
				if(rs.getString(3).equals(pwd))
				{
						response.sendRedirect("main.jsp?no="+no+"");
				}
				else
				{
					out.println("<script language='javaScript'> alert('账户不存在或密码有误 !');</script>");
					response.setHeader("refresh", "0;url=login.html");
				}
				}
				rs.close();
				
			} 
				
			else 
			{
				out.println("<script language='javaScript'> alert('账号或密码不能为空!');</script>");
				response.setHeader("refresh", "0;url=login.jsp");
		
			}
			
			db.close();
			
		%>
	   </center>
</body>
</html>