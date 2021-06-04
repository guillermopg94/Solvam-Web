<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*,java.net.*,java.sql.*" %>
<%


if(request.getParameter("GRABAR") != null)


{
 Class.forName("org.mariadb.jdbc.Driver"); // puente Connection
Connection con=DriverManager.getConnection("jdbc:mariadb://guillermopg.com.es:3306/Proyecto","guipagar","alumno1234"); 
//Conéctate a la base de datos
Statement statement=con.createStatement(); // objeto de declaración
String name = request.getParameter("NAME");
String pwd = request.getParameter("PWD");
String sql = "select * from login where name='"+ name +"'and pwd='"+ pwd + "'"; 
ResultSet rs=statement.executeQuery(sql); // objeto de declaración
if(rs.next()){
response.sendRedirect("loginsucces.jsp"); }
else{
response.sendRedirect("login.jsp");
}

rs.close();
statement.close();
con.close();
};
out.println("<FORM ACTION= login.jsp METHOD=post>");
out.println("NAME :<INPUT TYPE=TEXT NAME=NAME><BR>");
out.println("PWD :<INPUT TYPE=TEXT NAME=PWD><BR>");
out.println("<INPUT TYPE=SUBMIT NAME=GRABAR VALUE=LOGIN ><BR>");
out.println("</FORM>");
%>

