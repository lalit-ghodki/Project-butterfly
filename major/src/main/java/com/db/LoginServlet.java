package com.db;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
//import java.sql.PreparedStatement;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
		String db = request.getParameter("data_base");
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306","root","MySQL@123");
			String a="create database "+db;
			String b="use "+db;
			String c="create table clg_login(clg_name varchar(100),"
					+ " course_name varchar(100),"
					+ " branch_name varchar(100),"
					+ " location varchar(100),"
					+ " gmail_id varchar(20),"
					+ " total_std int(12),"
					+ " no_boys int(12),"
					+ " no_girls int(12))";
			
			String d="create table std_entry(std_name varchar(100) not null,"
					+ " bnf_id int(12) primary key not null unique key,"
					+ " std_age int(12) not null,"
					+ " vcn_name varchar(20) not null,"
					+ " vcn_type varchar(20) not null,"
					+ " no_dose int(12) not null,"
					+ " sex_type varchar(20) not null)";

			Statement stmt = con.createStatement();
			stmt.addBatch(a);
			stmt.addBatch(b);
			stmt.addBatch(c);
			stmt.addBatch(d);
			stmt.executeBatch();
			System.out.println("table created");
			
			RequestDispatcher rd1 = request.getRequestDispatcher("LoginServlet1");
			rd1.forward(request, response);
			
		}catch(Exception e){
			e.printStackTrace();
			out.println("error!?");
			RequestDispatcher rd2 = request.getRequestDispatcher("index3.jsp");
			rd2.forward(request, response);
		}
	}

}
