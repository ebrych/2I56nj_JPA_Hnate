<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
<%@ page import = "com.hibernate.crud.operation.DbOperations" %>
<%@ page import = "com.hibernate.crud.operation.Student" %>
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
String idStudent=request.getParameter("id");
if(idStudent.equals("")){
	String redirectURL = "index.jsp";
    response.sendRedirect(redirectURL);
}
Student miItem = DbOperations.findRecordById(Integer.parseInt(idStudent));
%>
<p>&nbsp;</p>
<div class="container"> 
<a class="btn btn-default" href="index.jsp" role="button">Regresar</a> 
<h2>Editar Alumno</h2>
<form action="editar.jsp?id=<%= request.getParameter("id")  %>" method = "POST">
    <input type="text" class="form-control" name="idt" value="<%= request.getParameter("id")  %>" style="display:none">
	<label >Nombre</label>
    <input type="text" class="form-control" name="nombre" value="<%= miItem.getStudentNombre() %>">
    <label >apellidos</label>
    <input type="text" class="form-control" name="apellido" value="<%= miItem.getStudentApellido() %>">
    <label >Correo</label>
    <input type="email" class="form-control" name="correo" value="<%= miItem.getStudentMail() %>">
    <label >Fecha Nacimiento</label>
    <input type="date" class="form-control" name="nacimiento" value="<%= miItem.getStudentFechaNacimiento() %>">
    <label >Pension</label>
    <input type="text" class="form-control" name="pension" value="<%= miItem.getStudentPension() %>">
    <input type="text" class="form-control" name="metodo" value="update" style="display:none">
    <button type="submit" class="btn btn-default">Submit</button>
</form>

<%
String metodo=request.getParameter("metodo");
if(metodo != null){
	if(metodo.equals("update")){
		int id=Integer.parseInt(request.getParameter("idt"));
		String nombre=request.getParameter("nombre");
		String apellido=request.getParameter("apellido");
		String correo = request.getParameter("correo");
		String fechaNacimiento = request.getParameter("nacimiento");
		String pension = request.getParameter("pension");
		DbOperations.updateRecord(id,nombre,apellido,correo,fechaNacimiento,pension);
		response.sendRedirect("index.jsp");
	}
}
%>
</div>





<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</body>
</html>