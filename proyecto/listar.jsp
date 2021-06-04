<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Acceso a MySQL utilizando JDBC, Tomcat y JSP</title>
</head>
<body>
<%@ page import="java.io.*,java.util.*,java.net.*,java.sql.*" %>
<%!Connection conConexion;Statement scSQL;
ResultSet rsListaRegistros;
ResultSetMetaData lsDatos;
%>
<%Class.forName("org.mariadb.jdbc.Driver").newInstance();
conConexion =DriverManager.getConnection("jdbc:mariadb://guillermopg.com.es:3306/Proyecto","guipagar","alumno1234");
scSQL = conConexion.createStatement();
rsListaRegistros = scSQL.executeQuery("SELECT * FROM detalles");
lsDatos = rsListaRegistros.getMetaData();%>
<table width="100%" border="1">
<tr>
<% for(int iCont = 1; iCont <= lsDatos.getColumnCount(); iCont++ ) 
{ %><th><%--Nombres de las columnas de la tabla MySQL --%><%= lsDatos.getColumnLabel(iCont) %>
</th><% }%>
</tr><% while(rsListaRegistros.next()) {
     %><tr>
     <% for(int iCont=1; iCont <= lsDatos.getColumnCount(); iCont++ )
      { %><%--Obtenemos el valor de los registros --%>
      <td><%= rsListaRegistros.getString(iCont) %></td><% } %></tr><%}%>
      </table>
      </body>
      </html>