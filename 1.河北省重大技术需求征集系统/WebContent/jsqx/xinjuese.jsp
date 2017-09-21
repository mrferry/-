<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>角色管理</title>
<style type="text/css">
html,body,div,li,form,input,th,td{font-family:楷体; font-size:100%;}
ul,ol,li{ list-style:none;}

table {
	border-collapse: collapse;
	border: none;
	margin: 3px auto;
	width: 500px;
}

th, td {
	font-family:粗体; font-size:100%;
	border: Groove #000000 1px;
	height: 20px;
	margin-bottom: 12px; line-height: 25px;
}
input{
	font-family:粗体; font-size:100%;
	bgcolor:#FFFFFF;
}

div ,td{
	text-align: center;
}
</style>
</head>
<body>
	<jsp:useBean id="db" class="bean.DBbean" scope="page" />
	<form action="xinjuese.jsp" method="post">
	<center>
	<h1>新建角色</h1>
	<br>角色名：<input type="text"name="xinjuese">
	<br>
	<table style="width:700px;">
		<tr>
			<th width="20%">权限名称</th><th width="60%">权限说明</th><th width="20%">是否授予</th>
		</tr>
		<tr>
			<td>填报权限</td><td>可以填报需求问卷</td><td><input type="checkbox"name="tbqx"value="1"></td>
		</tr>
		<tr>
			<td>需求管理权限</td><td>可以对所提交的需求问卷进行管理</td><td><input type="checkbox"name="xqgl"value="1"></td>
		</tr>
		<tr>
			<td>用户信息权限</td><td>可以查看用户基础信息</td><td><input type="checkbox"name="yhxx"value="1"></td>
		</tr>
		<tr>
			<td>修改密码权限</td><td>可以修改用户自己的密码</td><td><input type="checkbox"name="xgmm"value="1"></td>
		</tr>
		<tr>
			<td>形式审核权限</td><td>可以对于需求进行形式审核</td><td><input type="checkbox"name="xssh"value="1"></td>
		</tr>
		<tr>
			<td>技术审核权限</td><td>可以对需求进行技术审核</td><td><input type="checkbox"name="jssh"value="1"></td>
		</tr>
		<tr>
			<td>统计查询权限</td><td>可以对需求进行统计查询</td><td><input type="checkbox"name="tjcx"value="1"></td>
		</tr>
	</table>
		<input type="submit" name="submit" value="新建">        <input type="button" value="取消" onclick="window.location.href='jsgl.jsp'">
		<%
		request.setCharacterEncoding("UTF-8");
		String submit = request.getParameter("submit");
		if (submit != null && !submit.equals("")) {
			String shenfen = request.getParameter("xinjuese");
			String tbqx = request.getParameter("tbqx");
			String xqgl = request.getParameter("xqgl");
			String yhxx = request.getParameter("yhxx");
			String xgmm = request.getParameter("xgmm");
			String xssh = request.getParameter("xssh");
			String jssh = request.getParameter("jssh");
			String tjcx = request.getParameter("tjcx");
			if(!shenfen.equals(""))
			{
				String sql = "insert into qx(shenfen,power,tbqx,xqgl,yhxx,xgmm,xsshqx,jssh,tjcx) values('"+shenfen+"',0,"+tbqx+","+xqgl+","+yhxx+","+xgmm+","+xssh+","+jssh+","+tjcx+")";
				int i = db.executeUpdate(sql);

				if (i == 1) {
					out.println("<script language='javaScript'> alert('创建成功,点击确定跳转到角色管理!');</script>");
					response.setHeader("refresh", "0;url=jsgl.jsp");
				} else {
					out.println("<script language='javaScript'> alert('角色已存在，点击确定返回！');</script>");
					response.setHeader("refresh", "1;url=xinjuese.jsp");
				}
				db.close();
			}
			else
			{
				
				out.println("<script language='javaScript'> alert('角色名不能为空!');</script>");
				response.setHeader("refresh", "0;url=xinjuese.jsp");
				
			}
		}
	%>
	</center>
	</form>
</body>
</html>