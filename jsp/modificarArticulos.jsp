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
int id_articulo = Integer.parseInt(request.getParameter("ID_ARTICULO"));
String q="select * from articulos where id_articulo="+id_articulo;
try {tabla=instruccion.executeQuery(q);
tabla.next();
out.println("<FORM ACTION=modificarArticulos.jsp METHOD=POST>");
out.println("ID_ARTICULO:<INPUT TYPE=TEXT NAME=ID_ARTICULO VALUE= "+  Integer.parseInt( tabla.getString(1))+ "><BR>");
out.println("TITULO:<INPUT TYPE=TEXT NAME=TITULO VALUE= "+ tabla.getString(2)+ "><BR>");
out.println("ARTICULO:<INPUT TYPE=TEXT NAME=ARTICULO VALUE= "+ tabla.getString(3)+ "><BR>");
out.println("AUTOR:<INPUT TYPE=TEXT NAME=AUTOR VALUE= "+ tabla.getString(4)+ "><BR>");
out.println("FECHA:<INPUT TYPE=TEXT NAME=FECHA VALUE= "+ tabla.getString(5)+ "><BR>");
out.println("ETIQUETAS:<INPUT TYPE=TEXT NAME=ETIQUETAS VALUE= "+ tabla.getString(6)+ "><BR>");
out.println("CATEGORIAS:<INPUT TYPE=TEXT NAME=CATEGORIAS VALUE= "+ tabla.getString(7)+ "><BR>");
out.println("FOTO:<INPUT TYPE=TEXT NAME=FOTO VALUE= "+ tabla.getString(8)+ "><BR>");
out.println("VISITAS:<INPUT TYPE=TEXT NAME=VISITAS VALUE= "+ tabla.getString(9)+ "><BR>");
out.println("<INPUT TYPE=SUBMIT NAME=EDITAR VALUE=EDITAR><BR>");
tabla.close();instruccion.close();canal.close();
} catch(SQLException e) {} catch(Exception ex){};
}; // fin evento buscar
// codigo de evento EDICION
String temp2=request.getParameter("EDITAR");
if(temp2==null)temp2=" ";
if(temp2.compareTo("EDITAR")==0)
{

Connection canal = null;
ResultSet tabla= null;
Statement instruccion=null;











try {
Class.forName("org.mariadb.jdbc.Driver").newInstance();
canal=DriverManager.getConnection("jdbc:mariadb://guillermopg.com.es:3306/Proyecto","guipagar","alumno1234");
instruccion = canal.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
} catch(java.lang.ClassNotFoundException e){} catch(SQLException e) {};
try {
tabla = instruccion.executeQuery("select * from articulos");
} catch(SQLException e) {};
int id_articulo =  Integer.parseInt( request.getParameter("ID_ARTICULO"));
String titulo = request.getParameter("TITULO");
String articulo = request.getParameter("ARTICULO");
String autor = request.getParameter("AUTOR");
String fecha = request.getParameter("FECHA");
String etiquetas = request.getParameter("ETIQUETAS");
int categorias = Integer.parseInt( request.getParameter("CATEGORIAS"));
String foto = request.getParameter("FOTO");
int visitas = Integer.parseInt( request.getParameter("VISITAS"));

String q = "UPDATE articulos SET ID_ARTICULO='"+ id_articulo+ "', TITULO='"+ titulo+"',ARTICULO='"+articulo+"',AUTOR='"+autor+"', FECHA='"+fecha+"', ETIQUETAS ='"+etiquetas+"', CATEGORIAS ='"+categorias+"', FOTO ='"+foto+"', VISITAS ='"+visitas+"' WHERE id_articulo='" + id_articulo+"'";
try{instruccion.executeUpdate(q); }catch(SQLException e) {};
try {tabla.close();instruccion.close();canal.close();} catch(SQLException e) {};
out.println("REGISTRO MODIFICADO");
}; // fin evento editar
// construyendo forma dinamica
out.println("<FORM ACTION=modificarArticulos.jsp METHOD=post>");
out.println("ID_ARTICULO EDITAR:<INPUT TYPE=TEXT NAME=ID_ARTICULO><BR>");
out.println("<INPUT TYPE=SUBMIT NAME=BUSCAR VALUE=BUSCAR ><BR>");
out.println("</FORM>");
%>