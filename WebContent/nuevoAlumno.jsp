<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
<%@ page import = "com.hibernate.crud.operation.DbOperations" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body>
<p>&nbsp;</p>
<div class="container"> 
<a class="btn btn-default" href="index.jsp" role="button">Regresar</a> 
<h2>Nuevo Alumno</h2>
<form action="nuevoAlumno.jsp" method = "POST">
	<label >Nombre</label>
    <input type="text" class="form-control" name="nombre" >
    <label >apellidos</label>
    <input type="text" class="form-control" name="apellido" >
    <label >Correo</label>
    <input type="email" class="form-control" name="correo" >
    <label >Fecha Nacimiento</label>
    <input type="date" class="form-control" name="nacimiento" placeholder="año-mes-dia">
    <label >Pension</label>
    <input type="text" class="form-control" name="pension" >
    <input type="text" class="form-control" name="metodo" value="insert" style="display:none">
    <button type="submit" class="btn btn-default">Submit</button>
</form>
<%
String metodo=request.getParameter("metodo");
if(metodo != null){
	if(metodo.equals("insert")){
		String nombre=request.getParameter("nombre");
		String apellido=request.getParameter("apellido");
		String correo = request.getParameter("correo");
		String fechaNacimiento = request.getParameter("nacimiento");
		String pension = request.getParameter("pension");
		DbOperations.createRecord(nombre,apellido,correo,fechaNacimiento,pension);
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