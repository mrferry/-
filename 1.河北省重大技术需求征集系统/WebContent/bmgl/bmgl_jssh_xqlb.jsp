<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>部门审核需求列表</title>
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
    <li>技术审核需求列表
    </li>
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
            <th>机构名称</th>
	        <th>需求名称</th>
	        <th>关键字</th>
	        <th>拟投资金额</th>
	        <th>需求解决方式</th>
	        <th>科技活动类型</th>
	        <th>审核状态</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <tr>
	        <jsp:useBean id="db" class="bean.DBbean" scope="page" />
	        <jsp:useBean id="db1" class="bean.DBbean" scope="page" />
		    <%
		    request.setCharacterEncoding("UTF-8");
		    int x=1;
	        String no1 = request.getParameter("no");
		    String s1="select subm from info where no='"+no1+"'";
		    ResultSet rs1 = db.executeQuery(s1);
		    rs1.next();
			String s = "select * from basis_information where state=2 and glbm='"+rs1.getString(1)+"';";
			ResultSet rs = db.executeQuery(s);
				while (rs.next()) {
					String state="";
					if(rs.getString(17).equals("0"))
					{
						state="保存未提交";
					}
					else if(rs.getString(17).equals("1"))
					{
						state="未进行形式审核";
					}
					else if(rs.getString(17).equals("2"))
					{
						state="未进行技术审核";
					}
					else if(rs.getString(17).equals("3"))
					{
						state="已退回";
					}
					else if(rs.getString(17).equals("4"))
					{
						state="已进入汇总";
					}
				String no = rs.getString(1);
				String tech_no = rs.getString(2);
				out.println("<tr><td>" + x + "</td><td>" + rs.getString(18) + "</td><td>" + rs.getString(3) + "</td><td>" + rs.getString(9) + "</td><td>"+ rs.getString(10) + "万元" + "</td><td>"+ rs.getString(11) + "</td><td>" + rs.getString(13)+ "</td><td>" + state + "</td><td><a href='bmgl_jssh_xqbd.jsp?no=" + no+"&&tech="+tech_no+"'>审核</a></td></tr>");
			    x++;
				}
			rs1.close();
			db1.close();
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