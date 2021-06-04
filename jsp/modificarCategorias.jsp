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
int id_categoria = Integer.parseInt(request.getParameter("ID_CATEGORIA"));
String q="select * from categorias where id_categoria="+id_categoria;
try {tabla=instruccion.executeQuery(q);
tabla.next();
out.println("<FORM ACTION=modificarCategorias.jsp METHOD=POST>");
out.println("ID_CATEGORIA:<INPUT TYPE=TEXT NAME=ID_CATEGORIA VALUE= "+  Integer.parseInt( tabla.getString(1))+ "><BR>");
out.println("CATEGORIA:<INPUT TYPE=TEXT NAME=CATEGORIA VALUE= "+ tabla.getString(2)+ "><BR>");

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
tabla = instruccion.executeQuery("select * from categorias");
} catch(SQLException e) {};
int id_categoria =  Integer.parseInt( request.getParameter("ID_CATEGORIA"));
String categoria = request.getParameter("ID_CATEGORIA");


q = "UPDATE categorias SET ID_CATEGORIA='"+ id_categoria+ "', CATEGORIA='"+ categoria+"' WHERE id_categoria='" + id_categoria+"'";
try{instruccion.executeUpdate(q); }catch(SQLException e) {};
try {tabla.close();instruccion.close();canal.close();} catch(SQLException e) {};
out.println("REGISTRO MODIFICADO");
}; // fin evento editar
// construyendo forma dinamica
out.println("<FORM ACTION=modificarCategorias.jsp METHOD=post>");
out.println("ID_CATEGORIA EDITAR:<INPUT TYPE=TEXT NAME=ID_CATEGORIA><BR>");
out.println("<INPUT TYPE=SUBMIT NAME=BUSCAR VALUE=BUSCAR ><BR>");
out.println("</FORM>");
%>