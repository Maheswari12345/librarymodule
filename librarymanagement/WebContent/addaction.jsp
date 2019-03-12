<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
    
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "root");
	String insertQuery="Insert into stock values (?,?,?,?,?,?,?,?)";
	String name=request.getParameter("name");
	String author=request.getParameter("author");
	int price=Integer.parseInt(request.getParameter("price"));
	int count=Integer.parseInt(request.getParameter("count"));
	int id=Integer.parseInt(request.getParameter("id"));
	String arrival=request.getParameter("arrival");
	int rack=Integer.parseInt(request.getParameter("rack"));
	String genre=request.getParameter("genre");
	PreparedStatement pstmt =conn.prepareStatement(insertQuery);
	pstmt.setString(1,name);
	pstmt.setString(2,author);
	pstmt.setInt(3,price);
	pstmt.setInt(4,count);
	
	pstmt.setInt(5,id);
	
	pstmt.setString(6,arrival);
	pstmt.setInt(7,rack);
	pstmt.setString(8,genre);
	
	
	
	int insert=0;
	insert=pstmt.executeUpdate();
    if(insert==0)
    {
          out.println("Error while insert the record");
    }else
          
    {
          response.sendRedirect("success.jsp");
    }
    

	
	
	
}catch(Exception e)
{
	out.println(e.getMessage());
}

%>


</body>
</html>