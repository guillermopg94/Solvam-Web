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
int id_articulo = Integer.parseInt(request.getParameter("ID_ARTICULO"));
String titulo = request.getParameter("TITULO");
String articulo =request.getParameter("ARTICULO");
String autor =request.getParameter("AUTOR");
String fecha =request.getParameter("FECHA");
String etiquetas =request.getParameter("ETIQUETAS");
int categorias =Integer.parseInt(request.getParameter("CATEGORIAS"));
String foto =request.getParameter("FOTO");
int visitas =Integer.parseInt(request.getParameter("VISITAS"));

String q="insert into articulos(id_articulo,titulo,articulo,autor,fecha,etiquetas,categorias,foto,visitas) values('"+ id_articulo +"','"+titulo+"','"+articulo+"','"+autor+"','"+fecha+"','"+etiquetas+"','"+categorias+"','"+foto+"','"+visitas+"')";
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
out.println("<FORM ACTION= insertarArticulos.jsp METHOD=post>");
out.println("ID_ARTICULO :<INPUT TYPE=TEXT NAME=ID_ARTICULO><BR>");
out.println("TITULO :<INPUT TYPE=TEXT NAME=TITULO><BR>");
out.println("ARTICULO:<INPUT TYPE=TEXT NAME=ARTICULO><BR>");
out.println("AUTOR:<INPUT TYPE=TEXT NAME=AUTOR><BR>");
out.println("FECHA:<INPUT TYPE=TEXT NAME=FECHA><BR>");
out.println("ETIQUETAS:<INPUT TYPE=TEXT NAME=ETIQUETAS><BR>");
out.println("CATEGORIAS:<INPUT TYPE=TEXT NAME=CATEGORIAS><BR>");
out.println("FOTO:<INPUT TYPE=TEXT NAME=FOTO><BR>");
out.println("VISITAS:<INPUT TYPE=TEXT NAME=VISITAS><BR>");
out.println("<INPUT TYPE=SUBMIT NAME=GRABAR VALUE=INSERTAR ><BR>");
out.println("</FORM>");
%> 