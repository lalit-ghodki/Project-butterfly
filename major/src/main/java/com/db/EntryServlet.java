package com.db;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;

/*import javax.servlet.RequestDispatcher;
*/
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import java.sql.Statement;
import java.sql.PreparedStatement;

/**
 * Servlet implementation class EntryServlet
 */
@WebServlet("/EntryServlet")
public class EntryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EntryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String std_name =request.getParameter("std_name");
		int bnf_id = Integer.parseInt(request.getParameter("bnf_id"));
		int std_age = Integer.parseInt(request.getParameter("std_age"));
		String vcn_name = request.getParameter("vcn_name");
		String vcn_type = request.getParameter("vcn_type");
		int no_dose = Integer.parseInt(request.getParameter("no_dose"));
		String sex_type = request.getParameter("sex_type");
		String db = request.getSession().getAttribute("data").toString();
		
		System.out.println(db+" fetching successful");
		try {
			Thread.sleep(2000);
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url ="jdbc:mysql://localhost:3306/"+db;
			String user ="root";
			String pwd = "MySQL@123";
			Connection con = DriverManager.getConnection(url,user,pwd);
			String q = "insert into std_entry(std_name, bnf_id, std_age, vcn_name, vcn_type, no_dose, sex_type) values(?,?,?,?,?,?,?)";
			PreparedStatement pstmt = con.prepareStatement(q);
			pstmt.setString(1, std_name);
			pstmt.setInt(2, bnf_id);
			pstmt.setInt(3, std_age);
			pstmt.setString(4, vcn_name);
			pstmt.setString(5, vcn_type);
			pstmt.setInt(6, no_dose);
			pstmt.setString(7, sex_type);
			pstmt.executeUpdate();
			/* System.out.println("std_entry done"); */
			out.println("done");
				
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}

}
