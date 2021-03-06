<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%request.setCharacterEncoding("gb2312");%> 
<%response.setContentType("text/html;charset=UTF-8"); %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>成绩统计</title>
    <meta charset="utf-8" />
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<!-- Bootstrap Styles-->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FontAwesome Styles-->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
    <!-- Morris Chart Styles-->
    <link href="assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
    <!-- Custom Styles-->
    <link href="assets/css/custom-styles.css" rel="stylesheet" />
    <!-- Google Fonts-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    <!-- TABLE STYLES-->
    <link href="assets/js/dataTables/dataTables.bootstrap.css" rel="stylesheet" />
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
      <div id="wrapper">
    
        <nav class="navbar navbar-default top-navbar" role="navigation">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html"><i class="fa fa-comments"></i> <strong>班级管理系统</strong></a>
            </div>

            <!-- headtop最高的mune栏 -->
            <ul class="nav navbar-top-links navbar-right">
                
                <!-- 第四个 -->
                <!-- /.dropdown -->
                <li class="dropdown">
                
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                        <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    
                    <ul class="dropdown-menu dropdown-user">
                    
                        <li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a></li>
                        <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a></li>
                        <li class="divider"></li>
                        <li><a href="#"><i class="fa fa-sign-out fa-fw"></i> Logout</a></li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
        </nav>
        <!--/. NAV TOP  -->
        
        <!-- 左侧菜单栏 -->
        <nav class="navbar-default navbar-side" role="navigation">
        <div id="sideNav" href=""><i class="fa fa-caret-right"></i></div>
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
                    
                    <li>
                        <a href="index.html"><i class="fa fa-sitemap"></i> 班级管理<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                            <li>
                                <a href="classAdd.jsp">新建班级</a>
                            </li>
                            <li>
                                <a href="ClassInformationAction.action">班级信息</a>
                            </li>
                            </ul>
                    </li>
                    <li>
                        <a href="ui-elements.html"><i class="fa fa-desktop"></i>学生管理<span class="fa arrow"></a>
                            <ul class="nav nav-second-level">
                            <li>
                                <a href="studentAdd.jsp">添加学生</a>
                            </li>
                            <li>
                                <a href="StudentInformationAction.action">学生信息</a>
                            </li>
                            </ul>
                    </li>
					<li>
                        <a href="chart.html"><i class="fa fa-table"></i>课程管理<span class="fa arrow"></a>
                            <ul class="nav nav-second-level">
                            <li>
                                <a href="courseAdd.jsp">添加课程</a>
                            </li>
                            <li>
                                <a href="CourseInformationAction.action">课程信息</a>
                            </li>
                            </ul>
                    </li>
                    <li>
                        <a href="tab-panel.html" class="active-menu"><i class="fa fa-bar-chart-o"></i>成绩管理<span class="fa arrow"></a>
                            <ul class="nav nav-second-level">
                            <li>
                                <a href="FindgradeAction.action">成绩录入</a>
                            </li>
                            <li>
                                <a href="GradeQueryAction.action">查询成绩</a>
                            </li>
                            <li>
                                <a href="GradeCourseAction.action">成绩统计</a>
                            </li>
                            </ul>
                    </li>
                    
                </ul>

            </div>

        </nav>
        <!-- /. NAV SIDE  -->
        
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper">
            <div id="page-inner">


                <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-header">成绩管理<small> > 课程成绩统计</small></h1>
                    </div>
                </div>
				
                <!-- /. ROW  -->
                <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                                           请选择:
                        </div>
                        <div class="panel-body">
                            <div class="row">
                            
                            <div class="form-group">
                                <div class="col-lg-6">
                                    <label>选择班级</label>
                                    <select class="form-control" id="classChoose" name="classChoose" >
                                        <option value="全部">全部</option>
                                        <s:iterator value="classno" id="id">
  			                            <option value="<s:property value="classNumber"/>"><s:property value="className"/></option>
  		                                </s:iterator>
                                    </select>
                                </div>
                                <div class="col-lg-6">
                                    <label>选择课程</label>
                                    <select class="form-control" id="courseChoose" name="courseChoose" >
                                        <option value="全部">全部</option>
                                        <s:iterator value="course" id="id">
  			                            <option value="<s:property value="courseNumber"/>"><s:property value="courseName"/></option>
  		                                </s:iterator>
                                    </select>
                                </div>
                            </div>
                            
                            
                        </div>
                        </div>
                            
                        </div>
                    </div>
                </div>
                
                <!-- /.col-lg-12 -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                                  课程成绩如下:
                            </div>
                            <div class="panel-body">
                            <div class="row">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover">
                                    <thead>
                                        <thead>
   		<tr>
   			<th><div align="center">学号</div></th>
        	<th><div align="center">姓名</div></th>
        	<th><div align="center">班级</div></th>
        	<th><div align="center">课程</div></th>
        	<th><div align="center">成绩</div></th>
        </tr>
   	</thead>
   	<tbody>
		   								<s:bean name="com.gkt.dao.StudentDAO" id="helper" />
                                        <s:bean name="com.gkt.dao.CourseDAO" id="helper1" />
                                        <s:iterator value="grade" id="id" status="status">
                                        <tr class="odd gradeX">
                                            <th><div align='center'><s:property value="Student.studentNumber"/></th>
			                                <th><div align='center'><s:property value="#helper.findById(Student.studentNumber).studentName"/></div></th>		
			                                <th><div align='center'><s:property value="#helper.findById(Student.studentNumber).classunit.classNumber"/></div></th>
			                                <th><div align='center'><s:property value="#helper1.findById(course.courseNumber).courseName"/></div></th>
			                                
			                                <s:if test="gradeGrade>=0&&gradeGrade<60">
											<th><div align="center"><font color='red'><s:property value="gradeGrade"/></font></div></th>
											</s:if>
											<s:else>
											<th><div align="center"><s:property value="gradeGrade"/></div></th>
											</s:else>
		                                </tr>
                                        </s:iterator>
	</tbody>
	
	</table>
	<br><br>
      <table>
		<tr>
		<th width=150px>最高分:<s:property value="MAX"/></th>
		<th width=150px>最低分:<s:property value="MIN"/></th>
		<th width=400px>平均分:<s:property value="AVGE"/></th>
		<th width=150px>考试人数:<s:property value="studentNum"/></th>
		</tr>
	</table>
                            </div>
                            </div>
                            </div>
                    </div>
                </div>
                
            </div>
                
				<footer><p>Copyright &copy; 石家庄铁道大学软件工程系</p></footer>
            </div>
            <!-- /. PAGE INNER  -->
        </div>
        <!-- /. PAGE WRAPPER  -->
    </div>
        
    </div>
    
    
    <!-- /. WRAPPER  -->
    <!-- JS Scripts-->
    <!-- jQuery Js -->
    <script src="assets/js/jquery-1.10.2.js"></script>
    <!-- Bootstrap Js -->
    <script src="assets/js/bootstrap.min.js"></script>
    <!-- Metis Menu Js -->
    <script src="assets/js/jquery.metisMenu.js"></script>
    <script src="assets/js/dataTables/jquery.dataTables.js"></script>
    <script src="assets/js/dataTables/dataTables.bootstrap.js"></script>
        <script>
            $(document).ready(function () {
               $('#classChoo').change(function(){ 
			var classStr=document.getElementById("classChoose").value;
			var courseStr=document.getElementById("courseChoose").value;
			window.location.href ="Find_course_grade.action?classStr="+classStr+"&courseStr="+courseStr;
		
		});
		
		$('#courseChoose').change(function(){ 
			var classStr=document.getElementById("classChoose").value;
			var courseStr=document.getElementById("courseChoose").value;
			window.location.href ="Find_course_grade.action?classStr="+classStr+"&courseStr="+courseStr;
		});
            });
    </script>
    <script>
	$(document).ready(function() {
		$('#example').dataTable( {
			"sPaginationType": "full_numbers"
		});
	});
	
</script>
    <!-- Morris Chart Js -->
    <script src="assets/js/morris/raphael-2.1.0.min.js"></script>
    <script src="assets/js/morris/morris.js"></script>
	
	
	<script src="assets/js/easypiechart.js"></script>
	<script src="assets/js/easypiechart-data.js"></script>
	
	
    <!-- Custom Js -->
    <script src="assets/js/custom-scripts.js"></script>
    
  </body>
</html>
