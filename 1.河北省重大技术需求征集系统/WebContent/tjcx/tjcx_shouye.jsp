<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>统计查询首页</title>
<link href="../css1/style.css" rel="stylesheet" type="text/css" />
<link href="../css1/select.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js1/jquery.js"></script>
<script type="text/javascript" src="../js1/jquery.idTabs.min.js"></script>
<script type="text/javascript" src="../js1/select-ui.min.js"></script>
<script type="text/javascript" src="../js1/jsapi.js"></script>
<script type="text/javascript" src="../js1/format+zh_CN,default,corechart.I.js"></script>		
<script type="text/javascript" src="../js1/jquery.gvChart-1.0.1.min.js"></script>
<script type="text/javascript" src="../js1/jquery.ba-resize.min.js"></script>
<script type="text/javascript" src="../editor/kindeditor.js"></script>

<script type="text/javascript">
    KE.show({
        id : 'content7',
        cssPath : './index.css'
    });
  </script>
  
<script type="text/javascript">
$(document).ready(function(e) {
    $(".select1").uedSelect({
		width : 345			  
	});
	$(".select2").uedSelect({
		width : 167  
	});
	$(".select3").uedSelect({
		width : 100
	});
});
</script>

<script type="text/javascript">
		gvChartInit();
		jQuery(document).ready(function(){

		jQuery('#myTable5').gvChart({
				chartType: 'PieChart',
				gvSettings: {
					vAxis: {title: 'No of players'},
					hAxis: {title: 'Month'},
					width: 1015,
					height: 253
					}
			});
		});
		</script>

</head>
<body>

    <div class="place">
        <span>位置：</span>
        <ul class="placeul">
        <li>统计查询</li>
        </ul>
    </div>
    
    <div class="formbody">
        <div id="usual1" class="usual"> 
        
            <div class="itab">
  	            <ul> 
                <li><a href="#tab1" class="selected">需求信息</a></li>
                <li><a href="#tab2">数据统计</a></li>
  	            </ul>
            </div> 
    
            <div id="tab1" class="tabson">
                <form action="tjcx_shouye.jsp" method="post">
                <ul class="seachform">
                <li><label>机构编码</label><input name="jgbm" type="text" id="jgbm" class="scinput" /></li>
                <li><label>机构名称</label><input name="jgmc" type="text" id="jgmc" class="scinput" /></li>
                <li><label>所在地域</label><input name="szdy" type="text" id="szdy" class="scinput" /></li>
                <li><label>归口管理部门</label><input name="gkglbm" type="text" id="gkglbm" class="scinput" /></li>
                <li><label>机构属性</label><input name="jgsx" type="text" id="jgsx" class="scinput" /><br><br></li>
                <li><label>需求编码</label><input name="xqbm" type="text" id="xqbm" class="scinput" /><br><br></li>
                <li><label>需求名称</label><input name="xqmc" type="text" id="xqmc" class="scinput" /><br><br></li>
                <li><label>关键字</label><input name="gjz" type="text" id="gjz" class="scinput" /></li>
                <li><label>科技活动类型</label><input name="kjhdlx" type="text" id="kjhdlx" class="scinput" /><br><br></li>
                <li><label>学科分类</label><input name="xkfl" type="text" id="xkfl" class="scinput" /><br><br></li>
                <li><label>应用行业</label><input name="yyhy" type="text" id="yyhy" class="scinput" /><br><br></li>
                <li><label>需求技术领域</label><input name="xqjsly" type="text" id="xqjsly" class="scinput" style="margin-right:620px;"/></li>
                <li><label>&nbsp;</label><input name="submit" type="submit" class="scbtn" value="查询"/></li>
                </ul>
                </form>
                
                <table class="tablelist">
        
    	        <thead>
    	        <tr>
                    <th>序号</th>
                    <th>需求编码</th>
                    <th>需求名称</th>
                    <th>机构编码</th>
                    <th>机构名称</th>
                    <th>是否审核</th>
                    <th>操作</th>
                </tr>
                </thead>
            
                <tbody>
                <tr>
                <jsp:useBean id="db" class="bean.DBbean" scope="page" />
                <jsp:useBean id="db1" class="bean.DBbean" scope="page" />
                <%
                
                
		        request.setCharacterEncoding("UTF-8");
		        String submit=request.getParameter("submit");
		        if (submit != null && !submit.equals(""))
		        {
		        String no = request.getParameter("jgbm");
	            String name = request.getParameter("jgmc");
	            String szdy = request.getParameter("szdy");
	            String belong = request.getParameter("gkglbm");
	            String pro = request.getParameter("jgsx");
		
	            String tech_no = request.getParameter("xqbm");
	            String tech_name = request.getParameter("xqmc");
	            String keyword = request.getParameter("gjz");
	            String action_type = request.getParameter("kjhdlx");
	            String suject_specific = request.getParameter("xkfl");
	            String application_industry = request.getParameter("yyhy");
	            String field = request.getParameter("xqjsly");
		        
		        if(!no.equals("") || !name.equals("") || !szdy.equals("") || !belong.equals("") || !pro.equals("") || !tech_no.equals("") || !tech_name.equals("") || !keyword.equals("") || !action_type.equals("") || !suject_specific.equals("") || !application_industry.equals("") || !field.equals(""))
		        {
		            
		            String s1 = "select no from info where ";
		            if(no!=""){s1 += "no like'%" + no +"%' and ";}
		            if(name!=""){s1 += "name like'%" + name +"%' and ";}
		            if(szdy!=""){s1 += "szdy like'%" + szdy +"%' and ";}
		            if(belong!=""){s1 += "belong like'%" + belong +"%' and ";}
		            if(pro!=""){s1 += "pro like'%" + pro +"%' and ";}
		            s1.substring(0, s1.length()-4);
		            ResultSet rs1 = db.executeQuery(s1.substring(0, s1.length()-4));
		            
		            while(rs1.next()){
		            	int x=1;
		                String s2 = "select no,name,tech_no,tech_name,state from basis_information where no='"+ rs1.getString(1) +"'and ";
		                if(tech_no!=""){s2 += "tech_no like'%" + tech_no +"%' and ";}
		                if(tech_name!=""){s2 += "tech_name like'%" + tech_name +"%' and ";}
		                if(keyword!=""){s2 += "keyword like'%" + keyword +"%' and ";}
		                if(action_type!=""){s2 += "action_type like'%" + action_type +"%' and ";}
		                if(suject_specific!=""){s2 += "suject_specific like'%" + suject_specific +"%' and ";}
		                if(application_industry!=""){s2 += "application_industry like'%" + application_industry +"%' and ";}
		                if(field!=""){s2 += "field like'%" + field +"%' and ";}
		                ResultSet rs2 = db1.executeQuery(s2.substring(0, s2.length()-4));
		                while (rs2.next()) {
		                	String state="";
							if(rs2.getString(5).equals("0"))
							{
								state="保存未提交";
							}
							else if(rs2.getString(5).equals("1"))
							{
								state="未进行形式审核";
							}
							else if(rs2.getString(5).equals("2"))
							{
								state="未进行技术审核";
							}
							else if(rs2.getString(5).equals("3"))
							{
								state="已退回";
							}
							else
								state="已进入汇总";
		        	        out.println("<tr><td>" + x + "</td><td>" + rs2.getString(3) + "</td><td>" + rs2.getString(4) + "</td><td>" + rs2.getString(1) + "</td><td>"+ rs2.getString(2) + "</td><td>" + state + "</td><td><a href='#'>查看</a></td></tr>");
			                x++;
		                }
		                rs2.close();
		                db1.close();
		            }
		            rs1.close();
		            db.close();
				}
		        }
		        else
		        {
		        	request.setCharacterEncoding("UTF-8");
	                String allbd = "select * from basis_information where state=4;";
	            	ResultSet rs4 = db1.executeQuery(allbd);
	            	int y=1;
	            	while(rs4.next()){
	            		String state="";
						if(rs4.getString(17).equals("0"))
						{
							state="保存未提交";
						}
						else if(rs4.getString(17).equals("1"))
						{
							state="未进行形式审核";
						}
						else if(rs4.getString(17).equals("2"))
						{
							state="未进行技术审核";
						}
						else if(rs4.getString(17).equals("3"))
						{
							state="已退回";
						}
						else
							state="已进入汇总";
	            		out.println("<tr><td>" + y + "</td><td>" + rs4.getString(2) + "</td><td>" + rs4.getString(3) + "</td><td>" + rs4.getString(1) + "</td><td>"+ rs4.getString(18) + "</td><td>" + state + "</td><td><a href='#'>查看</a></td></tr>");
		                y++;
	            	}
		        }
		        %>
                </tr> 
            </tbody>
            </table>
                
            </div>
            
    
            <div id="tab2" class="tabson">
                <div class="mainbox">
                    <div class="mainleft">
                    <div class="leftinfo">
                    <div class="listtitle"><a href="#" class="more1">更多</a>数据统计</div>
        
                    <div class="maintj">  
                    <table id='myTable5'>
				    <caption>扇形分部:</caption>
				    <thead>
				    <jsp:useBean id="db2" class="bean.DBbean" scope="page" />
				    <jsp:useBean id="db3" class="bean.DBbean" scope="page" />
				    <%
				    String all="";
				    int k1=0,k2=0,k3=0,k4=0,k5=0,k6=0;
				    String s = "select count(*) from basis_information where state=4;";
				    ResultSet rs = db2.executeQuery(s);
				    while (rs.next())
				    {
				    	all=rs.getString(1);
				    }
				    String c = "select * from basis_information where state=4;";
				    ResultSet rs1 = db3.executeQuery(c);
				    while (rs1.next())
				    {
				    	if(rs1.getString(13).equals("基础研究"))
				    	{
				    		k1++;
				    	}
				    	else if(rs1.getString(13).equals("应用研究"))
				    	{
				    		k2++;
				    	}
				    	else if(rs1.getString(13).equals("试验发展"))
				    	{
				    		k3++;
				    	}
				    	else if(rs1.getString(13).equals("研究发展与成果应用"))
				    	{
				    		k4++;
				    	}
				    	else if(rs1.getString(13).equals("技术推广与科技服务"))
				    	{
				    		k5++;
				    	}
				    	else
				    	{
				    		k6++;
				    	}
				    }
				    rs.close();
					db2.close();
				    rs1.close();
					db3.close();
				    %>
					    <tr>
						    <th></th>
						    <th>基础研究</th>
						    <th>应用研究</th>
						    <th>试验发展</th>
						    <th>研究发展与成果应用</th>
						    <th>技术推广与科技服务</th>
						    <th>生产性活动</th>
					    </tr>
				    </thead>
					<tbody>
					    <tr>
						    <th><%=all %></th>
						    <td><%=k1 %></td>
						    <td><%=k2 %></td>
						    <td><%=k3 %></td>
						    <td><%=k4 %></td>
						    <td><%=k5 %></td>
						    <td><%=k6 %></td>
					    </tr>
				    </tbody>
			        </table>  
                    </div>
    
                    </div>
                
                    </div>
                </div>
        <br><br>
        
    
    </div>
    
  </div>
</div>
    <script type="text/javascript"> 
      $("#usual1 ul").idTabs(); 
    </script>
    
    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>
    
    
</body>
</html>