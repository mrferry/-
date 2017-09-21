<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.*"%>
	<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<Script Language="JavaScript">
   var whichText;
    function selectStation(obj) {
   var objSelStation = obj;
        if (obj.selectedIndex != -1) {
            var stationName = obj.options[obj.selectedIndex].text;
            whichText.value = stationName;
        }
        showDivStation(this, false,'selStation')//鼠标单击某一选项选定后关闭下拉框
    }
  //邮箱验证
    function verifyAddress()    
    {    
     var email = document.getElementById('email').value;    
     var pattern = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;    
     flag = pattern.test(email);    
     if(flag)    
     {    
    	 document.getElementById("mes").innerHTML="<font color='red'></font>";
       	 return true;    
     }    
     else    
     {    
      document.getElementById("mes").innerHTML="<font color='red'>邮箱格式有误!</font>";
      document.getElementById("email").focus();
      return false;    
     }    
    }
  //终止年限大于起始年限
  function bigfirstT()
  {
	  var LastT = document.getElementById('LastT').value;
	  var FirstT=document.getElementById('FirstT').value;
	  if(LastT<FirstT)
		  {
		  	document.getElementById('LastT').value="2017";
		  	alert("终止年限大于起始年限！");
		  }
  }
  //文本域计数及限制字数
    function textCounter(field, countfield, maxlimit) {
    // 函数，3个参数，表单名字，表单域元素名，限制字符；
    if (field.value.length > maxlimit)
    //如果元素区字符数大于最大字符数，按照最大字符数截断；
    {
    	field.value = field.value.substring(0, maxlimit);
    	alert("最多可输入500个字！");
    }
    else
    //在记数区文本框内显示剩余的字符数；
    countfield.value = maxlimit - field.value.length;
    }
  //关键字只能按照顺序输入
  function secondOn()
  {
	  var keyword = document.getElementById('keyword1').value;
	  if(keyword!="")
	  {
		  document.getElementById('keyword2').disabled=false;
		  document.getElementById('keyword2').focus();
	  }
	  else
	  {
		  document.getElementById('keyword2').value="";
		  document.getElementById('keyword2').disabled=true;
		  document.getElementById('keyword3').value="";
		  document.getElementById('keyword3').disabled=true;
		  document.getElementById('keyword4').value="";
		  document.getElementById('keyword4').disabled=true;
		  document.getElementById('keyword5').value="";
		  document.getElementById('keyword5').disabled=true;
	  }
  }
  function thirdOn()
  {
	  var keyword = document.getElementById('keyword2').value;
	  if(keyword!="")
	  {
		  document.getElementById('keyword3').disabled=false;
		  document.getElementById('keyword3').focus();
	  }
	  else
	  {
		  document.getElementById('keyword3').value="";
		  document.getElementById('keyword3').disabled=true;
		  document.getElementById('keyword4').value="";
		  document.getElementById('keyword4').disabled=true;
		  document.getElementById('keyword5').value="";
		  document.getElementById('keyword5').disabled=true;
	  }
  }
  function fourthOn()
  {
	  var keyword = document.getElementById('keyword3').value;
	  if(keyword!="")
	  {
		  document.getElementById('keyword4').disabled=false;
		  document.getElementById('keyword4').focus();
	  }
	  else
	  {
		  document.getElementById('keyword4').value="";
		  document.getElementById('keyword4').disabled=true;
		  document.getElementById('keyword5').value="";
		  document.getElementById('keyword5').disabled=true;
	  }
  }
  function fifthOn()
  {
	  var keyword = document.getElementById('keyword4').value;
	  if(keyword!="")
	  {
		  document.getElementById('keyword5').disabled=false;
		  document.getElementById('keyword5').focus();
	  }
	  else
	  {
		  document.getElementById('keyword5').value="";
		  document.getElementById('keyword5').disabled=true; 
	  }
  }
  //对基础研究类型和非基础部门隐藏
  function NoBasic()
  {
	  e  =  event.srcElement;
	  if(e.type=="radio"  &&  e.name=="yanjiuLX")  
	  {
		if(e.value=="基础研究")
			{
				document.getElementById("Nobasic1").style.display = 'none';
				document.getElementById("Nobasic2").style.display = 'none';
				document.getElementById("basic").style.display = '';
			}
		else
			{
				document.getElementById("Nobasic1").style.display = '';
				document.getElementById("Nobasic2").style.display = '';
				document.getElementById("basic").style.display = 'none';
			}
	  }

  }
</Script>

<script type="text/javascript" src="js/InputSelect.js"></script>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style type="text/css">
table{border-collapse:collapse;}
textarea{width:99.2%;height:100px;}
</style>
<title>测试</title>
</head>
<body onload="init()">
<center>
<h1>河北省重大技术需求征集表</h1>

<!-- 表格 -->
<form name="myform"  method="post" action="geshiSH.jsp"  id="form1">
<table width="830" border="">
	<!-- 第一行 -->
	<tr>
		<td colspan="1"><font color='red'>*</font>机构全称</td>
		<td colspan="2"><input type="text"  style="width:99%" tabindex="1" required name="Name" id="text1"></td>
		<td colspan="1">&nbsp;&nbsp;归口管理部门</td>
		<td colspan="1"> 
			<select name="selStation" id="ss"  onclick="selectStation(this)">
        		<option> </option> <!--默认为空，从下拉菜单中选择-->
        		<jsp:useBean id="db" class="bean.DBbean" scope="page" />
        		
        	</select> 
       </td>
	</tr>
	<!-- 第二行 -->
	<tr>
		<td colspan="1"><font color='red'>*</font>通讯地址</td>
        <td colspan="2" width="300"><input type="text" style="width:99%" tabindex="2" name="adress" id="text2" required></td>
        <td colspan="1"><font color='red'>*</font>所在地域</td>
		<td colspan="1"><input type="text" style="width:99%" tabindex="3" name="area" id="text3" required></td>
	</tr>
	<!-- 第三行 -->
	<tr>
		<td colspan="1">&nbsp;&nbsp;网址</td>
		<td colspan="2"><input type="text" style="width:99%" tabindex="3" name="wangzhi" id="text4"></td>
		<td colspan="1"><font color='red'>*</font>电子信箱</td>
		<td colspan="1">
		  <input type="text" onblur="verifyAddress()" tabindex="4" name="email" id="email" size="18" title="请输入正确格式的邮编号" required>
		  <label><div id="mes" nowrap></div></label>
		</td>
	</tr>
	<!-- 第四行 -->
	<tr>
		<td colspan="1"><font color='red'>*</font>法人代表</td>
        <td colspan="2"><input  type="text" style="width:99%" name="faren" id="text5" required></td>
        <td colspan="1">&nbsp;&nbsp;邮政编码</td>
        <td colspan="1"><input type="text" onblur="youbiantest()" name="youbian" id="youbian" size="18"></td>
	</tr>
	<!-- 第五行 （横跨两行）-->
	<tr>
		<td rowspan="2" colspan="1"><font color='red'>*</font>联系人</td>
		<td rowspan="2" colspan="1"><input type="text" style="width:99%" name="lianxiren" id="text6" required></td>
		<td colspan="1"><font color='red'>*</font>电话</td>
        <td colspan="2">1.固定<input type="text" name="dianhua" id="text6" size="18">
        	2.手机<input type="text" name="phone" id="text7" size="18" pattern="1[0-9]{10}" title="请输入正确格式的手机号" required></td>
	</tr>
	<!-- 第六行 -->
	<tr>
		<td colspan="1">&nbsp;&nbsp;传真</td>
        <td colspan="2"><input type="text" style="width:99%" name="chuanzhen" id="text8" size="18"></td>
	</tr>
	<!-- 第七行 -->
	<tr height="40">
		<td colspan="1"><font color='red'>*</font>机构属性</td>
        <td colspan="4">
        	<input type="radio" name="JGshuxing" value=" 企业" id="CheckboxGroup1_0" required>企业
        	<input type="radio" name="JGshuxing" value="高等院校" id="CheckboxGroup1_1" required>高等院校
        	<input type="radio" name="JGshuxing" value="研究机构" id="CheckboxGroup1_2" required>研究机构
        	<input type="radio" name="JGshuxing" value="其他" id="CheckboxGroup1_3" required>其他
        </td>
	</tr>
	<!-- 第八行 -->
	<tr>
		<td colspan="5"><font color='red'>*</font>机构简介（主要包括基本情况、现有研究基础等，限500字以内）		
		</td>
	</tr>
	<!-- 第九行 -->
	<tr>
		<td colspan="5">
			<textarea name="jianjie" rows="5" maxlength="501" title="您已超过字数限制（500）" onKeyDown="textCounter(jianjie,remLen,500);" onKeyUp="textCounter(jianjie,remLen,500);" required></textarea>
		</td>
	</tr>
	<!-- 第十行 -->
	<tr>
		<td colspan="5">
			您还可以输入:<input name="remLen" type="text" value="500" size="5" readonly>个字符
		</td>
	</tr>
	<!-- 第十一行 -->
	<tr height="40">
		<td colspan="1"><font color='red'>*</font>技术需求名称</td>
		<td colspan="2"><input type="text" name="xuqiuname" id="text9" style="width:99%" required></td>
		<td colspan="1"><font color='red'>*</font>需求年限</td>
		<td colspan="1">
			<input type="text" name="firstLogTime" id="FirstT" value="2016" size="3" pattern="201[6-9]{1}" required>年至
			<input type="text" name="lastLogTime" id="LastT" size="4" pattern="2[0-9]{3}" onblur="bigfirstT()" required>年
		</td>
	</tr>
	<!-- 第十二行 -->
	<tr>
		<td colspan="5">
			<font color='red'>*</font>科技需求概述<br>
			
			1、主要问题<br><label>
			<textarea name="mainproblem" rows="5" onKeyDown="textCounter(mainproblem,state1,500);" onKeyUp="textCounter(mainproblem,state1,500);" required></textarea>
			<input name="state1" type="text" value="500" style="border-style:none;text-align:right" size="1" readonly>/500</label><br>
			
			2、技术关键<br><label>
			<textarea name="techkey" rows="5" onKeyDown="textCounter(techkey,state2,500);" onKeyUp="textCounter(techkey,state2,500);" required></textarea>
			<input name="state2" type="text" value="500" style="border-style:none;text-align:right" size="1" readonly>/500</label><br>
			
			3、预期目标<br><label>
			<textarea name="target" rows="5" onKeyDown="textCounter(target,state3,500);" onKeyUp="textCounter(target,state3,500);" required></textarea>
			<input name="state3" type="text" value="500" style="border-style:none;text-align:right" size="1" readonly>/500</label><br>
		</td>
	</tr>
	<!-- 第十三行 -->
	<tr height="40">
		<td colspan="1"><font color='red'>*</font>关键字:</td>
		<td colspan="4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="text" name="keyword1" id="keyword1" size="7" maxlength="5" onblur="secondOn()" required>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="text" name="keyword2" id="keyword2" size="7" maxlength="5" onblur="thirdOn()" disabled>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="text" name="keyword3" id="keyword3" size="7" maxlength="5" onblur="fourthOn()" disabled>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="text" name="keyword4" id="keyword4" size="7" maxlength="5" onblur="fifthOn()" disabled>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="text" name="keyword5" id="keyword5" size="7" maxlength="5" disabled>
		</td>
	</tr>
	<!-- 第十四行 -->
	<tr height="40">
		<td colspan="2">拟投入资金总额</td>
		<td colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="amount" id="amount" pattern="[0-9]*">&nbsp;&nbsp;&nbsp;&nbsp;万元</td>
	</tr>
	<!-- 第十五行 （横跨2行）-->
	<tr height="40">
		<td rowspan="2" colspan="2"><font color='red'>*</font>技术需求解决方式</td>
		<td colspan="3">
			<input type="radio" name="Solution" id="checkbox1" value="独立开发" required>独立开发
			<input type="radio" name="Solution" id="checkbox2" value="委托研发 " required>委托研发 
			<input type="radio" name="Solution" id="checkbox3" value="合作研发 " required>合作研发 
			<input type="radio" name="Solution" id="checkbox4" value="其他" required>其他
		</td>
	</tr>
	<!-- 第十六行 -->
	<tr height="40">
		<td colspan="3">&nbsp;&nbsp;&nbsp;合作意向单位&nbsp;&nbsp;&nbsp;<input type="text" style="width:60%" name="intention" id="text11">（选填）</td>
	</tr>
	<!-- 第十七行（横跨2行） -->
	<tr height="80">
		<td colspan="2"><font color='red'>*</font>科技活动类型</td>
		<td colspan="5">
			<input type="radio" name="yanjiuLX" id="checkbox5" value="基础研究" onclick="NoBasic()" required>基础研究
			<input type="radio" name="yanjiuLX" id="checkbox6" value="应用研究" onclick="NoBasic()" required>应用研究 
          	<input type="radio" name="yanjiuLX" id="checkbox7" value="试验发展" onclick="NoBasic()" required>试验发展<br><br>
       	 	<input type="radio" name="yanjiuLX" id="checkbox8" value="研究发展与成果应用" onclick="NoBasic()" required>研究发展与成果应用
        	<input type="radio" name="yanjiuLX" id="checkbox9" value="技术推广与科技服务" onclick="NoBasic()" required>技术推广与科技服务
        </td>
	</tr>
	<!-- 第十八行 -->
	<tr height="40" id="basic" style="display :none">		
        <td colspan="2">学科分类(限基础研究填写)</td>
        <td colspan="3">&nbsp;&nbsp;&nbsp;
        
        	<select name="subject1" id="subject1">
            	<option></option> <!--默认为空，从下拉菜单中选择-->
        		<option value="数学">数学</option>
        		<option value="逻辑学">逻辑学</option>
        		<option value="天文学与天体物理学">天文学与天体物理学</option>
        		<option value="地球科学及空间科学">地球科学及空间科学</option>
        		<option value="物理学">物理学</option>
        		<option value="化学">化学</option>
          		<option value="生命科学">生命科学</option>
     		</select>
     		
     		<select name="subject2" id="subject2">
            	<option></option> <!--默认为空，从下拉菜单中选择-->
        		<option value="数学">数学</option>
        		<option value="逻辑学">逻辑学</option>
        		<option value="天文学与天体物理学">天文学与天体物理学</option>
        		<option value="地球科学及空间科学">地球科学及空间科学</option>
        		<option value="物理学">物理学</option>
        		<option value="化学">化学</option>
          		<option value="生命科学">生命科学</option>
     		</select>
     		
     		<select name="subject3" id="subject3">
            	<option></option> <!--默认为空，从下拉菜单中选择-->
        		<option value="数学">数学</option>
        		<option value="逻辑学">逻辑学</option>
        		<option value="天文学与天体物理学">天文学与天体物理学</option>
        		<option value="地球科学及空间科学">地球科学及空间科学</option>
        		<option value="物理学">物理学</option>
        		<option value="化学">化学</option>
          		<option value="生命科学">生命科学</option>
     		</select>
     	</td>
	</tr>
	<!-- 第十九行 -->
	<tr height="120" id="Nobasic1" style="display :none">
		<td colspan="2">需求技术所属领域(非基础研究填写)</td>
		<td colspan="4">
			<input type="checkbox" name="lingyu" id="checkbox6">电子信息
      		<input type="checkbox" name="lingyu" id="checkbox7">光机电一体化
      		<input type="checkbox" name="lingyu" id="checkbox9">生物技术与制药 
      		<input type="checkbox" name="lingyu" id="checkbox10">新材料及应用  <br><br>
      		<input type="checkbox" name="lingyu" id="checkbox12">现代农业
      		<input type="checkbox" name="lingyu" id="checkbox13">新能源与高效节能
      		<input type="checkbox" name="lingyu" id="checkbox14">资源与环境 
      		<input type="checkbox" name="lingyu" id="checkbox8">高技术服务业<br><br>  		      		
      		<input type="checkbox" name="lingyu" id="checkbox11">海洋   
      		<input type="checkbox" name="lingyu" id="checkbox12">社会公共事业     		
      		<input type="checkbox" name="lingyu" id="checkbox15">医疗卫生
      		<input type="checkbox" name="lingyu" id="checkbox15">其他（注明）
      	</td>
	</tr>
	<!-- 第二十行 -->
	<tr height="40" id="Nobasic2" style="display :none">
		<td colspan="2">需求技术应用行业(非基础研究填写)</td>
		<td colspan="3">
        
        	<select name="subject1" id="subject1">
            	<option></option> <!--默认为空，从下拉菜单中选择-->
        		<option value="数学">数学</option>
        		<option value="逻辑学">逻辑学</option>
        		<option value="天文学与天体物理学">天文学与天体物理学</option>
        		<option value="地球科学及空间科学">地球科学及空间科学</option>
        		<option value="物理学">物理学</option>
        		<option value="化学">化学</option>
          		<option value="生命科学">生命科学</option>
     		</select>
     		
     		<select name="subject2" id="subject2">
            	<option></option> <!--默认为空，从下拉菜单中选择-->
        		<option value="数学">数学</option>
        		<option value="逻辑学">逻辑学</option>
        		<option value="天文学与天体物理学">天文学与天体物理学</option>
        		<option value="地球科学及空间科学">地球科学及空间科学</option>
        		<option value="物理学">物理学</option>
        		<option value="化学">化学</option>
          		<option value="生命科学">生命科学</option>
     		</select>
     		
     		<select name="subject3" id="subject3">
            	<option></option> <!--默认为空，从下拉菜单中选择-->
        		<option value="数学">数学</option>
        		<option value="逻辑学">逻辑学</option>
        		<option value="天文学与天体物理学">天文学与天体物理学</option>
        		<option value="地球科学及空间科学">地球科学及空间科学</option>
        		<option value="物理学">物理学</option>
        		<option value="化学">化学</option>
          		<option value="生命科学">生命科学</option>
     		</select>
     	</td>
	</tr>
</table>
	<p>
	 <input type="Submit" name="submit" value="保存并提交" style="width:85px;height:40px;font-family:楷体 ;font-size:14px;color:red;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <input type="Reset" value="重      置" style="width:85px;height:40px;font-family:楷体 ;font-size:14px;color:red;">
    </p>
</form>
</center>
</body>
</html>