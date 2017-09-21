<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户信息</title>
<style type="text/css">
html,body,div,li,form,input,th,td{font-family:楷体; font-size:100%;}
ul,ol,li{ list-style:none;}

table {
	border-collapse: collapse;
	border: none;
	margin: 0px auto;
	width: 100%;
}

th, td {
	border: Groove #000000 1px;
	height: 20px;
	margin-bottom: 12px; line-height: 25px;  opacity: 1.0;
}

div{
	text-align: center;
}
</style>
</head>
<body>
    <jsp:useBean id="db" class="bean.DBbean" scope="page" />
	<%
	request.setCharacterEncoding("UTF-8");
	String no = request.getParameter("no");
	String s = "select * from info where no='"+no+"';";
	System.out.println(s);
	ResultSet rs = db.executeQuery(s);
	rs.next();
	
	%>
	<center>
	<h1>您的信息</h1>
	</center>
	<table>
		<tr>
			<th width="15%" colspan=1>机构名称</th>
			<td width="85%" colspan=3 align="left"><%=rs.getString(1)%></td>
		</tr>
		
		<tr>
			<th width="15%" colspan=1>机构编码</th>
			<td width="85%" colspan=3 align="left"><%=rs.getString(2)%></td>
		</tr>
	</table>
	<table>	
		<tr>
		    <th width="15%" colspan=1>通讯地址</th>
			<td width="30%" colspan=1 align="left"><%=rs.getString(4)%></td>
			<th width="15%" colspan=1>网址</th>
			<td width="30%" colspan=1 align="left"><%=rs.getString(5)%></td>
		</tr>
		
		<tr>
		    <th width="15%">法人代表</th>
			<td width="40%" align="left"><%=rs.getString(6)%></td>
			<th width="15%">电子邮箱</th>
			<td width="30%" align="left"><%=rs.getString(7)%></td>
		</tr>
		
		<tr>
		    <th width="15%">邮政编码</th>
			<td width="40%" align="left"><%=rs.getString(8)%></td>
			<th width="15%">所在地域</th>
			<td width="30%" align="left"><%=rs.getString(16)%></td>
		</tr>
		
		<tr>
		    <th width="15%">机构属性</th>
			<td width="40%" align="left"><%=rs.getString(13)%></td>
			<th width="15%">归口管理部门</th>
			<td width="30%" align="left"><%=rs.getString(14)%></td>
		</tr>
		
		<tr>
			<th width="15%">联系人</th>
			<td width="85%" colspan=3 align="left"><%=rs.getString(9)%></td>
		</tr>
		
		<tr>
		    <th width="15%">固话</th>
			<td width="40%" align="left"><%=rs.getString(10)%></td>
			<th width="15%">手机</th>
			<td width="30%" align="left"><%=rs.getString(11)%></td>
		</tr>

	</table>
	<table>
		<tr>
		    <th colspan=4>技术需求概述</th>
		</tr>
		
		<tr>
		    <td colspan=4 rowspan=4><%=rs.getString(15)%></td>
		</tr>
	</table><br><br>
</body>
</html>