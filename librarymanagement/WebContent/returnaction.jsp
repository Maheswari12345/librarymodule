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
System.out.println("iiiiiii");
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "root");
	String insertQuery="Insert into exp values (?,?,?,?)";
	//String name=request.getParameter("name");
	//String author=request.getParameter("author");
	//int price=Integer.parseInt(request.getParameter("price"));
	//int count=Integer.parseInt(request.getParameter("count"));
	
	int id=Integer.parseInt(request.getParameter("id"));
	int code=Integer.parseInt(request.getParameter("code"));
	String issue=request.getParameter("issue");
	String expiry=request.getParameter("return");
	
	PreparedStatement pstmt =conn.prepareStatement(insertQuery);
	
	pstmt.setInt(1,id);
	pstmt.setInt(2,code);
	
	
	
	pstmt.setString(3,issue);
	pstmt.setString(4,expiry);
	
	
	
	
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