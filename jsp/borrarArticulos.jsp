<%@ page import="java.io.*,java.util.*,java.net.*,java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*"%>
<%
// declarando y creando objetos globales
Connection canal = null;
ResultSet tabla= null;
Statement instruccion=null;

if(request.getParameter("OK") != null)
{
// abriendo conexion
try {
Class.forName("org.mariadb.jdbc.Driver").newInstance();
canal=DriverManager.getConnection("jdbc:mariadb://guillermopg.com.es:3306/Proyecto","guipagar","alumno1234");
instruccion = canal.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
} catch(java.lang.ClassNotFoundException e){} catch(SQLException e) {};
// preparando condicion de eliminacion
int id_articulo = Integer.parseInt(request.getParameter("ID_ARTICULO"));
// construyendo select con condicion eliminacion SQL DELETE
String q="delete from articulos where id_articulo = "+id_articulo;
// mandando SQL a ejecución
try { instruccion.executeUpdate(q);
// aviso
out.println("registro eliminado");
} //fin try no usar ; al final de dos o mas catchs
catch(SQLException e) {}
catch(java.lang.NullPointerException e){};
try {
// no ocupa cerrar tabla(), no se leyo (select) un resultset
// la eliminacion fue directa
instruccion.close();canal.close();} catch(SQLException e) {};
};
// construyendo forma dinamica
out.println("<FORM ACTION=borrarArticulos.jsp METHOD=post>");
out.println("ID_ARTICULO ELIMINAR:<INPUT TYPE=TEXT NAME=ID_ARTICULO><BR>");
out.println("<INPUT TYPE=SUBMIT NAME=OK VALUE=ELIMINAR><BR>");
out.println("</FORM>");
%>