<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>我的需求</title>
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
    <li>需求管理</li>
    </ul>
    </div>
            
    
    <div class="rightinfo">
    
    <div class="tools">
    
    	<ul class="toolbar">
        <li class="click"><span><img src="../images/t01.png" /></span>添加</li>
        <li class="click"><span><img src="../images/t02.png" /></span>修改</li>
        </ul>
    
    </div>
    
    
    <table class="tablelist">
    	<thead>
    	<tr>
            <th>序列</th>
            <th>需求编号</th>
	        <th>需求名称</th>
	        <th>关键字</th>
	        <th>拟投资金额</th>
	        <th>审核状态</th>
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
			String s = "select * from basis_information where no='"+no+"';";
			ResultSet rs = db.executeQuery(s);
			while (rs.next()) {
				String state="";
				if(rs.getString(17).equals("0"))
				{
					state="保存未提交";
				}
				else if(rs.getString(17).equals("1"))
				{
					state="正在进行形式审核";
				}
				else if(rs.getString(17).equals("2"))
				{
					state="正在进行技术审核";
				}
				else if(rs.getString(17).equals("3"))
				{
					state="已退回";
				}
				else
					state="已纳入汇总";
				String tech_no = rs.getString(2);
				out.println("<tr><td>" + x + "</td><td>" + rs.getString(2) + "</td><td>" + rs.getString(3) + "</td><td>" + rs.getString(9) + "</td><td>" + rs.getString(10)+"万元" + "</td><td>" + state + "</td><td><a href='yonghu_xqbd.jsp?no=" + no+"&&tech="+tech_no+"'>查看");
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