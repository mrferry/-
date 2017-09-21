<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>注册</title>
<style type="text/css">
html,body,div,li,form,input,th,td{margin:0;padding:0;font-family:楷体; font-size:100%;}
ul,ol,li{ list-style:none;}
a:link, a:visited{ color:#FF00FF; text-decoration:none;}
a:hover{ color:#12b7f5;}

table {
	border-collapse: collapse;
	border: none;
	margin: 0px auto;
	width: 500px;
}

th, td {
	border: Groove #000000 0px;
	height: 20px;
	margin-bottom: 12px; line-height: 25px;  opacity: 0.6;
}

div {
	text-align: center;
}
</style>
</head>
<body>
	<form action="zhuce.jsp" method="post">
	<center>
	<br>
	<h1>用户信息注册</h1>
	<table>
		<tr>
			<th width="20%" align="right"><font color="red">*</font>机构编码:</th>
			<td colspan =3><input name="no" style="width:99%;height:90%"></td>
		</tr>
		<tr>
			<th width="20%" align="right"><font color="red">*</font>密码:</th>
			<td colspan =3><input name="pwd" style="width:99%;height:90%"></td>
		</tr>
		<tr>
			<th width="20%" align="right"><font color="red">*</font>机构名称:</th>
			<td colspan =3><input name="name" style="width:99%;height:90%"></td>
		</tr>
		<tr>
			<th width="20%" align="right"><font color="red">*</font>通讯地址:</th>
			<td width="60%" colspan=3><input name="address" style="width:99%;height:90%"></td>
		</tr>
		<tr>
			<th width="20%" align="right">单位网址:</th>
			<td colspan=3><input name="web" style="width:99%;height:90%"></td>
		</tr>
		<tr>
			<th width="20%" align="right"><font color="red">*</font>电子邮箱:</th>
			<td colspan=3><input name="email" style="width:99%;height:90%"></td>
		</tr>
		<tr>
			<th align="right"><font color="red">*</font>法人代表:</th>
			<td colspan=3><input name="faren" style="width:99%;height:90%"></td>
		</tr>
		<tr>
			<th align="right">邮政编码:</th>
			<td colspan=3><input name="pcode" style="width:99%;height:90%"></td>
		</tr>
		<tr>
			<th align="right"><font color="red">*</font>联系人:</th>
			<td colspan=3><input name="contact" style="width:99%;height:90%"></td>
		<tr>
			<th align="right"><font color="red">*</font>电话:</th>
			<td colspan=3><input name="phone" style="width:99%;height:90%"></td>
		</tr>
		<tr>
			<th align="right">传真:</th>
			<td colspan=3><input name="chuan" style="width:99%;height:90%"></td>
		</tr>
		<tr>
			<th align="right">归口管理部门:</th>
			<td colspan=3><input name="belong" style="width:99%;height:90%"></td>
		</tr>
		<tr>
			<th align="right" colspan =4><font color="red">*</font>为必填项</th>
		</tr>
		<tr>
				<th colspan="2"><input type="submit" name="submit" value="注册">
				          <input type="reset" value="重置"></th>
		</tr>
	</table>
	
	</center>
	</form>
	<jsp:useBean id="db" class="bean.DBbean" scope="page" />
	<%
		request.setCharacterEncoding("UTF-8");
		String submit = request.getParameter("submit");
		if (submit != null && !submit.equals("")) {
			String no = request.getParameter("no");
			String name = request.getParameter("name");
			String pwd = request.getParameter("pwd");
			String address = request.getParameter("address");
			String url = request.getParameter("url");
			String email = request.getParameter("email");
			String fr = request.getParameter("fr");
			String pcode = request.getParameter("pcode");
			String contact = request.getParameter("contact");
			String mphone = request.getParameter("mphone");
			String cz = request.getParameter("cz");
			String belong = request.getParameter("belong");
			if(!no.equals("")&&!name.equals("")&&!address.equals("")&&!belong.equals(""))
			{
				String sql = "insert into info(name,no,pwd,address,url,email,fr,pcode,contact,mphone,cz,belong) values('" + name + "','"
						+ no + "','"+pwd+"','"+address+"','"+url+"','"+email+"','"+fr+"','"+pcode+"','"+contact+"','"+mphone+"','"+cz+"','"+belong+"')";
				int i = db.executeUpdate(sql);
				if (i == 1) {
					out.println("<script language='javaScript'> alert('添加成功,点击确定跳转到登录!');</script>");
					response.setHeader("refresh", "0;url=login.html");
				} else {
					out.println("<script language='javaScript'> alert('添加失败，点击确定返回注册页面！');</script>");
					response.setHeader("refresh", "1;url=zhuce.jsp");
				}
				db.close();
			}
			else
			{
				
				out.println("<script language='javaScript'> alert('注册信息不能为空!');</script>");
				response.setHeader("refresh", "0;url=zhuce.jsp");
				
			}
		}
	%>
</body>
</html>