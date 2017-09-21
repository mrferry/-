<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.*" %>
<html>
<head>
<title>提交完成</title>
</head>
<body>
	<jsp:useBean id="db" class="bean.DBbean" scope="page" />
	<jsp:useBean id="db1" class="bean.DBbean" scope="page" />
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
		//String[] suject_specific = request.getParameterValues("suject_specific");
		String[] field = request.getParameterValues("field");
		//String[] application_industry = request.getParameterValues("application_industry");
	    
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
			
			//String allss="";
			//for(int q=0;q<suject_specific.length;q++)
			//{
            //    allss += suject_specific[q];		
			//}
			
			String allf="";
			for(int q=0;q<field.length;q++)
			{
                allf += field[q];		
			}
			
			//String allai="";
			//for(int q=0;q<application_industry.length;q++)
			//{
            //     allai += application_industry[q];		
			//}
			
            String s3 = "update basis_information set ";
			String s4 = "where no='"+ no +"'";
            if(tech_name!=""){s3 += "tech_name ='" + tech_name +"' ";}
            if(tech_intro_majorproblem!=""){s3 += ",tech_intro_majorproblem ='" + tech_intro_majorproblem +"' ";} else{s1 += "tech_intro_majorproblem ='无' ";}
            if(tech_intro_keytechnology!=""){s3 += ",tech_intro_keytechnology ='" + tech_intro_keytechnology +"' ";} else{s1 += "tech_intro_keytechnology ='无' ";}
            if(tech_intro_target!=""){s3 += ",tech_intro_target ='" + tech_intro_target +"' ";} else{s1 += "tech_intro_target ='无' ";}
            if(time_start!=""){s3 += ",time_start ='" + time_start +"' ";} else{s1 += "time_start ='无' ";}
            if(time_end!=""){s3 += ",time_end ='" + time_end +"' ";} else{s1 += "time_end ='无' ";}
            if(allk!=""){s3 += ",keyword ='" + allk +"' ";} else{s1 += "keyword ='无' ";}
            if(money_investment!=""){s3 += ",money_investment ='" + money_investment +"' ";} else{s1 += "money_investment ='无' ";}
            if(solution!=""){s3 += ",solution ='" + solution +"' ";} else{s1 += "solution ='无' ";}
            if(name_join_unit!=""){s3 += ",name_join_unit ='" + name_join_unit +"' ";} else{s1 += "name_join_unit ='无' ";}
            if(action_type!=""){s3 += ",action_type ='" + action_type +"' ";} else{s1 += "action_type ='无' ";}
            /*if(allss!=""){s3 += ",suject_specific ='" + allss +"' ";} else{s1 += "suject_specific ='无' ";}*/
            if(allf!=""){s3 += ",field ='" + allf +"' ";} else{s1 += "allf ='无' ";}
            /*if(allai!=""){s3 += ",application_industry ='" + allai +"' ";} else{s1 += "application_industry ='无' ";}*/
            s3 += s4;
            int m = db1.executeUpdate(s3);
            
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