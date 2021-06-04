<%@ page import="java.io.*,java.util.*,java.net.*,java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*"%>
<%
if(request.getParameter("GRABAR") != null)
{
// objetos de enlace
Connection canal = null;
ResultSet tabla= null;
Statement instruccion=null;

try {
Class.forName("org.mariadb.jdbc.Driver").newInstance();
canal=DriverManager.getConnection("jdbc:mariadb://guillermopg.com.es:3306/Proyecto","guipagar","alumno1234");
instruccion = canal.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
} catch(java.lang.ClassNotFoundException e){} catch(SQLException e) {};
//cargando los campos a grabar
// excepto clave porque en mysql es de tipo auto-increment
int id_categoria = Integer.parseInt(request.getParameter("ID_CATEGORIA"));
String categoria = request.getParameter("CATEGORIA");


String q="insert into categorias(id_categoria,categoria) values('"+ id_categoria +"','"+categoria+"')";
try {
// agregando (insert)
int n=instruccion.executeUpdate(q);
//avisando que se hizo la instruccion
out.println("REGISTRO INSERTADO");
} catch(SQLException e) {out.println(e);};
try{
// tabla.close();
instruccion.close();
canal.close();
} catch(SQLException e) {out.println(e);};
};
// construyendo forma dinamica
out.println("<FORM ACTION= insertarCategorias.jsp METHOD=post>");
out.println("ID_CATEGORIA :<INPUT TYPE=TEXT NAME=ID_CATEGORIA><BR>");
out.println("CATEGORIA :<INPUT TYPE=TEXT NAME=CATEGORIA><BR>");

out.println("<INPUT TYPE=SUBMIT NAME=GRABAR VALUE=INSERTAR ><BR>");
out.println("</FORM>");
%> 