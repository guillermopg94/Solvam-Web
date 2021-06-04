<%@ page import="java.io.*, java.util.*, java.net.*, java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*"%>
<%! int clave=0; %>
<%
// codigo del evento BUSQUEDA y recordar construir una nueva forma dinamica
if(request.getParameter("BUSCAR") != null)
{
Connection canal = null;
ResultSet tabla= null;
Statement instruccion=null;

try {
Class.forName("org.mariadb.jdbc.Driver").newInstance();
canal=DriverManager.getConnection("jdbc:mariadb://guillermopg.com.es:3306/Proyecto","guipagar","alumno1234");
instruccion = canal.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
} catch(java.lang.ClassNotFoundException e){} catch(SQLException e) {};
int codigo = Integer.parseInt(request.getParameter("CODIGO"));
String q="select * from detalles where codigo="+codigo;
try {tabla=instruccion.executeQuery(q);
tabla.next();
out.println("<FORM ACTION=modificar.jsp METHOD=POST>");
out.println("CODIGO:<INPUT TYPE=TEXT NAME=CODIGO VALUE= "+  Integer.parseInt( tabla.getString(1))+ "><BR>");
out.println("TITULO:<INPUT TYPE=TEXT NAME=TITULO VALUE= "+ tabla.getString(2)+ "><BR>");
out.println("DESCRIPCION:<INPUT TYPE=TEXT NAME=DESCRIPCION VALUE= "+ tabla.getString(3)+ "><BR>");
out.println("IMAGEN:<INPUT TYPE=TEXT NAME=IMAGEN VALUE= "+ tabla.getString(4)+ "><BR>");
out.println("ARTICULO:<INPUT TYPE=TEXT NAME=ARTICULO VALUE= "+ tabla.getString(5)+ "><BR>");
out.println("AUTOR:<INPUT TYPE=TEXT NAME=AUTOR VALUE= "+ tabla.getString(6)+ "><BR>");
out.println("FECHA:<INPUT TYPE=TEXT NAME=FECHA VALUE= "+ tabla.getString(7)+ "><BR>");
out.println("<INPUT TYPE=SUBMIT NAME=EDITAR VALUE=EDITAR><BR>");
tabla.close();instruccion.close();canal.close();
} catch(SQLException e) {} catch(Exception ex){};
}; // fin evento buscar
// codigo de evento EDICION
String temp2=request.getParameter("EDITAR");
if(temp2==null)temp2=" ";
if(temp2.compareTo("EDITAR")==0)
{
String nombre,q ;
int edad; float estatura;
Connection canal = null;
ResultSet tabla= null;
Statement instruccion=null;

try {
Class.forName("org.mariadb.jdbc.Driver").newInstance();
canal=DriverManager.getConnection("jdbc:mariadb://guillermopg.com.es:3306/Proyecto","guipagar","alumno1234");
instruccion = canal.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
} catch(java.lang.ClassNotFoundException e){} catch(SQLException e) {};
try {
tabla = instruccion.executeQuery("select * from detalles");
} catch(SQLException e) {};
int codigo =  Integer.parseInt( request.getParameter("CODIGO"));
String titulo = request.getParameter("TITULO");
String descripcion = request.getParameter("DESCRIPCION");
String imagen = request.getParameter("IMAGEN");
String articulo = request.getParameter("ARTICULO");
String autor = request.getParameter("AUTOR");
String fecha = request.getParameter("FECHA");

q = "UPDATE detalles SET TITULO='"+ titulo+ "', DESCRIPCION='"+ descripcion+"',IMAGEN='"+imagen+"',ARTICULO='"+articulo+"', AUTOR='"+autor+"', FECHA ='"+fecha+"' WHERE codigo='" + codigo+"'";
try{instruccion.executeUpdate(q); }catch(SQLException e) {};
try {tabla.close();instruccion.close();canal.close();} catch(SQLException e) {};
out.println("REGISTRO MODIFICADO");
}; // fin evento editar
// construyendo forma dinamica
out.println("<FORM ACTION=modificar.jsp METHOD=post>");
out.println("CODIGO EDITAR:<INPUT TYPE=TEXT NAME=CODIGO><BR>");
out.println("<INPUT TYPE=SUBMIT NAME=BUSCAR VALUE=BUSCAR ><BR>");
out.println("</FORM>");
%>