<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.*" %>
<html>
<head>
<title>提交完成</title>
</head>
<body>
	<jsp:useBean id="db" class="bean.DBbean" scope="page" />
	<jsp:useBean id="db1" class="bean.DBbean" scope="page" />
	<jsp:useBean id="db2" class="bean.DBbean" scope="page" />
	<%
		request.setCharacterEncoding("UTF-8");
	    String submit = request.getParameter("submit");
	    String name = request.getParameter("name");
		String no = request.getParameter("no");
		String address = request.getParameter("address");
		String url = request.getParameter("url");
		String fr = request.getParameter("fr");
		String email = request.getParameter("email");
		String pcode = request.getParameter("pcode");
		String contact = request.getParameter("contact");
		String phone = request.getParameter("phone");
		String mphone = request.getParameter("mphone");
		String cz = request.getParameter("cz");
		String pro = request.getParameter("pro");
		String belong = request.getParameter("belong");
		String intro = request.getParameter("intro");
		String szdy = request.getParameter("szdy");
		
		String tech_name = request.getParameter("tech_name");
		String tech_intro_majorproblem = request.getParameter("tech_intro_majorproblem");
		String tech_intro_keytechnology = request.getParameter("tech_intro_keytechnology");
		String tech_intro_target = request.getParameter("tech_intro_target");
		String time_start = request.getParameter("time_start");
		String time_end = request.getParameter("time_end");
		String[] keyword = request.getParameterValues("keyword");
		String money_investment = request.getParameter("money_investment");
		String solution = request.getParameter("solution");
		String name_join_unit = request.getParameter("name_join_unit");
		String action_type = request.getParameter("action_type");
		String suject_specific1 = request.getParameter("firstSubjects");
		String suject_specific2 = request.getParameter("secondSubjects");
		String suject_specific3 = request.getParameter("thirdSubjects");
		String[] field = request.getParameterValues("field");
		String application_industry1 = request.getParameter("firstIndustry");
		String application_industry2 = request.getParameter("secondIndustry");
		String application_industry3 = request.getParameter("thirdIndustry");
	    
		if(!name.equals("") || !tech_name.equals(""))
		{
			String s1 = "update info set ";
			String s2 = "where no='"+ no +"'";
            if(name!=""){s1 += "name ='" + name +"' ";}
            if(address!=""){s1 += ",address ='" + address +"' ";} else{s1 += "address ='无' ";}
            if(url!=""){s1 += ",url ='" + url +"' ";} else{s1 += "url ='无' ";}
            if(fr!=""){s1 += ",fr ='" + fr +"' ";} else{s1 += "fr ='无' ";}
            if(email!=""){s1 += ",email ='" + email +"' ";} else{s1 += "email ='无' ";}
            if(pcode!=""){s1 += ",pcode ='" + pcode +"' ";} else{s1 += "pcode ='无' ";}
            if(contact!=""){s1 += ",contact ='" + contact +"' ";} else{s1 += "contact ='无' ";}
            if(phone!=""){s1 += ",phone ='" + phone +"' ";} else{s1 += "phone ='无' ";}
            if(mphone!=""){s1 += ",mphone ='" + mphone +"' ";} else{s1 += "mphone ='无' ";}
            if(cz!=""){s1 += ",cz ='" + cz +"' ";} else{s1 += "cz ='无' ";}
            if(pro!=""){s1 += ",pro ='" + pro +"' ";} else{s1 += "pro ='无' ";}
            if(belong!=""){s1 += ",belong ='" + belong +"' ";} else{s1 += "belong ='无' ";}
            if(intro!=""){s1 += ",intro ='" + intro +"' ";} else{s1 += "intro ='无' ";}
            if(szdy!=""){s1 += ",szdy ='" + szdy +"' ";} else{s1 += "szdy ='无' ";}
            s1 += s2;
            int i = db.executeUpdate(s1);
            
            String allk="";
			for(int q=0;q<keyword.length;q++)
			{
				allk += keyword[q];
			}
			
			String allss="";
			if(suject_specific1!="")
				allss += suject_specific1 + " ";
			if(suject_specific1!="")
				allss += suject_specific2 + " ";
			if(suject_specific1!="")
				allss += suject_specific3 + " ";
			
			String allf="";
			try
			{
			for(int q=0;q<field.length;q++)
			{
                allf += field[q];		
			}
			}
			catch (Exception e)
			{
				allf="无";
			}
			
			String allai="";
			if(application_industry1!="")
				allai += application_industry1 + " ";
			if(application_industry2!="")
				allai += application_industry2 + " ";
			if(application_industry3!="")
				allai += application_industry3 + " ";
			
			String tech_no="";
            java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyyMMdd");
            java.util.Date currentTime = new java.util.Date();//得到当前系统时间
            String str_date1 = formatter.format(currentTime); //将日期时间格式化
			String c ="select * from basis_information where tech_no in(select max(tech_no) from basis_information)";
			ResultSet rs = db.executeQuery(c);
			while(rs.next()){
				tech_no=rs.getString("tech_no");
            	//System.out.println(tech_no);
            }
			long id= Long.parseLong(tech_no)+1;
            String id1=Long.toString(id);
            String id2=id1.substring(8);
         	String dannum=str_date1+id2;
			
            String s3 = "insert into basis_information( ";
            if(tech_name!=""){s3 += "tech_name ";}
            s3 += ",tech_no ";
            s3 += ",no ";
            s3 += ",name ";
            s3 += ",state ";
            s3 += ",tech_intro_majorproblem ";
            s3 += ",tech_intro_keytechnology ";
            s3 += ",tech_intro_target ";
            s3 += ",time_start ";
            s3 += ",time_end ";
            s3 += ",keyword ";
            s3 += ",money_investment ";
            s3 += ",solution ";
            s3 += ",name_join_unit ";
            s3 += ",action_type ";
            s3 += ",suject_specific ";
            s3 += ",field "; 
            s3 += ",application_industry ";
            s3 += ") values( ";
            if(tech_name!=""){s3 += "'" + tech_name +"', ";}
            s3 += "'" + dannum +"', ";
            s3 += "'" + no +"', ";
            s3 += "'" + name +"', ";
            s3 += "'1', ";
            if(tech_intro_majorproblem!=""){s3 += "'" + tech_intro_majorproblem +"', ";} else{s3 += "'无', ";}
            if(tech_intro_keytechnology!=""){s3 += "'" + tech_intro_keytechnology +"', ";} else{s3 += "'无', ";}
            if(tech_intro_target!=""){s3 += "'" + tech_intro_target +"', ";} else{s3 += "'无', ";}
            if(time_start!=""){s3 += "'" + time_start +"', ";} else{s3 += "'无', ";}
            if(time_end!=""){s3 += "'" + time_end +"', ";} else{s3 += "'无', ";}
            if(allk!=""){s3 += "'" + allk +"', ";} else{s3 += "'无', ";}
            if(money_investment!=""){s3 += "'" + money_investment +"', ";} else{s3 += "'无', ";}
            if(solution!=""){s3 += "'" + solution +"', ";} else{s3 += "'无', ";}
            if(name_join_unit!=""){s3 += "'" + name_join_unit +"', ";} else{s3 += "'无', ";}
            if(action_type!=""){s3 += "'" + action_type +"', ";} else{s3 += "'无', ";}
            if(allss!=""){s3 += "'" + allss +"', ";} else{s3 += "'无', ";}
            if(allf!=""){s3 += "'" + allf +"', ";} else{s3 += "'无', ";}
            if(allai!=""){s3 += "'" + allai +"', ";} else{s3 += "'无', ";}
            System.out.println(s3.substring(0, s3.length()-2)+")");
            int m = db2.executeUpdate(s3.substring(0, s3.length()-2)+")");
            
			if (i == 1 && m == 1) {
				out.println("<script language='javaScript'> alert('提交成功。');</script>");
				response.setHeader("refresh", "0;url=ask.jsp?no="+no+"");
			}
			else{
				out.println("<script language='javaScript'> alert('提交失败。');</script>");
				response.setHeader("refresh", "0;url=ask.jsp?no="+no+"");
			}
			db.close();
		}
		else
		{
			
			out.println("<script language='javaScript'> alert('所填不能为空!');</script>");
			response.setHeader("refresh", "0;url=ask.jsp?no="+no+"");
			
		}
	%>
</body>
</html>