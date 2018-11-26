<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "com.hibernate.crud.operation.DbOperations" %>
<%@ page import = "com.hibernate.crud.operation.Student, java.util.List" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body>
<% 
List<Student> miList = DbOperations.displayRecords();
%>
<p>&nbsp;</p>
<div class="container">
<a class="btn btn-default" href="nuevoAlumno.jsp" role="button">Nuevo Alumno</a> 
<table class="table table-striped">
    <thead>
      <tr>
        <th>Nombre</th>
        <th>Apellido</th>
        <th>Correo</th>
        <th>Fecha de Nacimiento</th>
        <th>Pension</th>
        <th> </th>
        <th> </th>
      </tr>
    </thead>
    <tbody>
	<%
	int i=0;
	while(i<miList.size()){
		out.println("<tr>");
		out.println("<td>"+miList.get(i).getStudentNombre()+"</td>");
		out.println("<td>"+miList.get(i).getStudentApellido()+"</td>");
		out.println("<td>"+miList.get(i).getStudentMail()+"</td>");
		out.println("<td>"+miList.get(i).getStudentFechaNacimiento()+"</td>");
		out.println("<td>"+miList.get(i).getStudentPension()+"</td>");
		out.println("<td> <a class='btn btn-default' href='editar.jsp?id="+miList.get(i).getId()+"' role='button'>Editar</a> </td>");
		out.println("<td><form action='index.jsp' method ='POST'> <input type='text' name='metodo' value='delete' style='display:none' > <input type='text' name='id' value='"+miList.get(i).getId()+"' style='display:none' > <button type='submit' class='btn btn-default'> Eliminar </button>  </form></td>");
		out.println("</tr>");
		i++;
	}
	%>
	
	
	<%
	String metodo=request.getParameter("metodo");
	if(metodo != null){
		if(metodo.equals("delete")){
			int id=Integer.parseInt(request.getParameter("id"));
			DbOperations.deleteRecord(id);
			response.sendRedirect("index.jsp");
		}
	}
	%>
    </tbody>
  </table>
</div>

  
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</body>
</html>