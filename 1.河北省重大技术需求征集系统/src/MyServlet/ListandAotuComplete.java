package MyServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.DBbean;

public class ListandAotuComplete extends HttpServlet {
	
	public void init(ServletConfig config) throws ServletException{
	}
	/*
	 * 澶勭悊<GET>璇锋眰鏂规硶
	 */
	protected void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		//request.setCharacterEncoding("UTF-8");
		//璁剧疆杈撳嚭淇℃伅鐨勬牸寮忓強瀛楃闆�
		response.setContentType("text/xml;charset=UTF-8");
		response.setHeader("Cache-Control","no-cache");
		//鎺ュ彈娴忚鍣ㄧ鎻愪氦鐨勪俊鎭�
		String action = request.getParameter("action");
		System.out.println(action);
		//鍒涘缓杈撳嚭娴佸璞�
		PrintWriter out = response.getWriter();
		//渚濇嵁楠岃瘉缁撴灉杈撳嚭涓嶅悓鐨勬暟鎹俊鎭�
		out.println("<response>");
		//鏁版嵁搴撴搷浣�
		DBbean db = new DBbean();
		ResultSet rs;
		String strSql="";
		if(action.equals("subject"))
		{
			String upper = request.getParameter("upper");
			String tier = request.getParameter("tier");
			System.out.println(upper);
			System.out.println(tier);
			if(!tier.equals(""))
			{
				if(tier.equals("1"))
				{
					strSql ="select * from Suject where sno like'"+upper+"___00'";
					System.out.println(strSql);
				}
				else if(tier.equals("2"))
				{
					upper=upper.substring(0,5);
					System.out.println(upper);
					strSql = "select * from Suject where sno like'"+upper+"%'";
				}
				System.out.println(strSql);
				rs = db.executeQuery(strSql);
				try{
					rs.next();
					while(rs.next()){
						out.println("<name>"+rs.getString(2)+"</name>");
						out.println("<value>"+rs.getString(1)+"</value>");
					}
				}catch(SQLException e){
					e.printStackTrace();
				}
			}
		}
		else if(action.equals("industry"))
		{
			String upper = request.getParameter("upper");
			String tier = request.getParameter("tier");
			System.out.println(upper);
			System.out.println(tier);
			if(!tier.equals(""))
			{
				if(tier.equals("1"))
				{
					strSql ="select * from industry where ino like'"+upper+"_0'";
					System.out.println(strSql);
				}
				else if(tier.equals("2"))
				{
					upper=upper.substring(0,3);
					System.out.println(upper);
					strSql = "select * from industry where ino like'"+upper+"%'";
				}
				System.out.println(strSql);
				rs = db.executeQuery(strSql);
				try{
					rs.next();
					while(rs.next()){
						out.println("<name>"+rs.getString(2)+"</name>");
						out.println("<value>"+rs.getString(1)+"</value>");
					}
				}catch(SQLException e){
					e.printStackTrace();
				}
			}
		}
		else if(action.equals("match"))
		{
			String name = request.getParameter("names");
			name = java.net.URLDecoder.decode(name,"UTF-8");
			strSql = "select * from AffiliationDepart where name like'"+name+"%'";
			System.out.println(strSql);
			rs = db.executeQuery(strSql);
			try{
				while(rs.next()){
					out.println("<res>"+rs.getString(1)+"</res>");
				}
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		out.println("</response>");
		out.close();
	}
	
	/*
	 * 澶勭悊<POST>锟斤拷锟襟方凤拷
	 */
	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		doGet(request,response);
	}
}