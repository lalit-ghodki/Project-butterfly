package com.db;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Connection;
/**
 * Servlet implementation class LoginServlet1
 */
@WebServlet("/LoginServlet1")
public class LoginServlet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet1() {
        super();
        // TODO Auto-generated constructor stub
    }

    


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
	
		
		//fetch data from login page
		String clg_name = request.getParameter("clg_name");
		String course_name = request.getParameter("course_name");
		String branch_name = request.getParameter("branch_name");
		String gmail_id = request.getParameter("gmail_id");
		String loc = request.getParameter("loc");
		String db = request.getParameter("data_base");
		int total_std = Integer.parseInt(request.getParameter("total_std"));
		int no_boys = Integer.parseInt(request.getParameter("no_boys"));
		int no_girls = Integer.parseInt(request.getParameter("no_girls"));
		
		request.setAttribute("data_base", db);
		System.out.println("fetch done on "+clg_name);
		
//		connection.....
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,"root", "MySQL@123");
			
//			query......
			String query ="insert into clg_login"
					+ "(clg_name,"
					+ " course_name,"
					+ " branch_name,"
					+ " location,"
					+ " gmail_id,"
					+ " total_std,"
					+ " no_boys,"
					+ " no_girls) values(?,?,?,?,?,?,?,?)";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, clg_name);
			pstmt.setString(2, course_name);
			pstmt.setString(3, branch_name);
			pstmt.setString(5, gmail_id);
			pstmt.setString(4, loc);
			pstmt.setInt(6, total_std);
			pstmt.setInt(7, no_boys);
			pstmt.setInt(8, no_girls);
			
//			query fire.....
			pstmt.executeUpdate();
			
			System.out.println("upload done successfully !!!");
			
			RequestDispatcher rd1 = request.getRequestDispatcher("index4.jsp");
			rd1.forward(request, response);
			
		}catch(Exception e){
			e.printStackTrace();
			out.println("error");
		}
	}

}
