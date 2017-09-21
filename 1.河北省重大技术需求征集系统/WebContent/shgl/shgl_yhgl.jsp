<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户管理</title>
<link href="../css1/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js1/jquery.js"></script>

<script type="text/javascript">
$(document).ready(function(){
  $(".click").click(function(){
  $(".tip").fadeIn(200);
  });
  
  $(".tiptop a").click(function(){
  $(".tip").fadeOut(200);
});

  $(".sure").click(function(){
  $(".tip").fadeOut(100);
});

  $(".cancel").click(function(){
  $(".tip").fadeOut(100);
});

});
</script>

</head>
<body>

    <div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li>用户管理</li>
    </ul>
    </div>
    
    <div class="rightinfo">
    
    <div class="tools">
    
    	<ul class="toolbar">
        <li class="click"><span><img src="../images/t01.png" /></span>添加</li>
        <li class="click"><span><img src="../images/t02.png" /></span>修改</li>
        <li><span><img src="../images/t03.png" /></span>删除</li>
        <li><span><img src="../images/t04.png" /></span>统计</li>
        </ul>
        
        
        <ul class="toolbar1">
        <li><span><img src="../images/t05.png" /></span>设置</li>
        </ul>
    
    </div>
    
    
    <table class="tablelist">
    	<thead>
    	<tr>
            <th>序列</th>
            <th>机构编号</th>
	        <th>机构名称</th>
	        <th>电话</th>
	        <th>归口管理部门</th>
	        <th>所在地域</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <tr>
	        <jsp:useBean id="db" class="bean.DBbean" scope="page" />
		    <%
		    int x=1;
		    request.setCharacterEncoding("UTF-8");
			String no = request.getParameter("no");
			String s = "select * from info where no!='123';";
			ResultSet rs = db.executeQuery(s);
			while (rs.next()) {
				out.println("<tr><td>" +x+ "</td><td>" + rs.getString(2) + "</td><td>" + rs.getString(1) + "</td><td>" + rs.getString(11) + "</td><td>" + rs.getString(14) + "</td><td>" + rs.getString(16) + "</td><td><a href='#'>删除</a></td></tr>");
			    x++;
			}
			rs.close();
			db.close();
		    %>
	    </tr> 
               
        </tbody>
    </table>
        
    <div class="pagin">
    	<div class="message">共<i class="blue"><%=x-1%></i>条记录</div>
    </div> 
    
    </div>
    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>

</body>
</html>