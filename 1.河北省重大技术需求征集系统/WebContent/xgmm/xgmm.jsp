<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style type="text/css">
/*按钮美化*/
.demo_con{
width: 960px;
margin:40px auto 0;
}
.button{
width: 70px;
line-height: 21px;
text-align: center;
font-weight: bold;
color: #fff;
text-shadow:1px 1px 1px #333;
border-radius: 5px;
margin:0 20px 20px 0;
position: relative;
overflow: hidden;
}
.button:nth-child(6n){
margin-right: 0;
}
.button.blue{
border:1px solid #1e7db9;
box-shadow: 0 1px 2px #8fcaee inset,0 -1px 0 #497897 inset,0 -2px 3px #8fcaee inset;
background: -webkit-linear-gradient(top,#42a4e0,#2e88c0);
background: -moz-linear-gradient(top,#42a4e0,#2e88c0);
background: linear-gradient(top,#42a4e0,#2e88c0);
}
</style>
<title>修改密码</title>
      <script type="text/javascript"> 
function test()
{
	var a = document.getElementById('newpwd').value; 
	var b = document.getElementById('repwd').value; 
	if(a.lenght()<6)
		{
		 	document.getElementById("pwd1").innerHTML="<font color='red'>新密码必须大于6位!</font>";
		}
}
</script>
</head>
<body>
<center>
<form name="form1" method="post" action="xgmm.jsp">
  <p><strong>修改密码</strong> </p>
  <table width="279" border="0">
    <tbody>
        <%
        request.setCharacterEncoding("UTF-8");
        String no = request.getParameter("no");
        session.setAttribute("no", no);
		%>
      <tr>
        <td width="96">机构编码：</td>
        <td width="173"><input name="no" id="jgbm" value="<%=no%>" readOnly="true"></td>
      </tr>
      <tr>
        <td>原密码：</td>
        <td><input type="password" name="oldpwd" id="textfield2"></td>
      </tr>
      <tr>
        <td>新密码：</td>
        <td><input type="password" name="newpwd" id="newpwd" required></td>
      </tr>
      <tr>
        <td>重复新密码：</td>
        <td><input  type="password" name="repwd" id="repwd" required></td>
      </tr>
    </tbody>
</table>
  <p><div class="demo_con">
    <input type="Submit"  class="button blue" name="submit" value="确认">
    <input type="Reset"  class="button blue" value="重置">
    </div>	
  </p>
</form>
</center>
<jsp:useBean id="db" class="bean.DBbean" scope="page" />
<%
	request.setCharacterEncoding("UTF-8");
	String submit = request.getParameter("submit");
	if(submit != null && !submit.equals(""))
	{
		String no1 = request.getParameter("no");
		System.out.println(no1);
		String oldpwd = request.getParameter("oldpwd");
		String newpwd = request.getParameter("newpwd");
		System.out.println("用户输入的原密码为："+oldpwd);
		String ss = "select pwd   from info  where no='"+no1+"'";
		System.out.println(ss);
		ResultSet rs = db.executeQuery(ss);
		String p=new String();
		p="0";
		while (rs.next()) {
			 p=rs.getString(1);
		}
		System.out.println("正确密码为："+p);
		System.out.println("正确密码长度为："+p.length());
		if(p.equals(oldpwd)&&newpwd.length()>5){
			String updatesql="update info set pwd='"+newpwd+"'where no='"+no1+"'";
			System.out.println(updatesql);
			int flag=db.executeUpdate(updatesql);
			if(flag==1)
			{
				out.println("<script language='javaScript'> alert('成功更改密码!');</script>");
				response.setHeader("refresh", "0;url=xgmm.jsp?no="+no1+"");
			}
		}
		else if(!p.equals(oldpwd))
		{
			out.println("<script language='javaScript'> alert('原密码输入错误，请重新输入!');</script>");
			response.setHeader("refresh", "0;url=xgmm.jsp?no="+no1+"");
		}
		else
		{
			out.println("<script language='javaScript'> alert('修改失败！新密码长度至少为6位!');</script>");
			response.setHeader("refresh", "0;url=xgmm.jsp?no="+no1+"");
		}
	}
	%>
</body>
</html>