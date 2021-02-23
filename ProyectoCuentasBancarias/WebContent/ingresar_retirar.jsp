<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cuentas Bancarias</title>
<link type="text/css" rel="stylesheet" href="estilos/estilos.css">
</head>
<body>	
	
		<h1>Ingresar / Retirar de una cuenta</h1>
		
		
			<form action="singresarretirar" method="post">
			<div>
				<table>
					<tr>
						<td></td>
						<td><input type="radio" name="valor" value="m1"/></td>
						<td>Ingresar</td>
						<td></td>
						<td><input type="radio" name="valor" value="m2"/></td>
						<td>Retirar</td>
					</tr>
					<tr>
						<td></td>
						<td>Cuenta : </td>
						<td><input type="text" name="cuenta"/></td>
					</tr>
					<tr>
						<td></td>
						<td>Monto : </td>
						<td><input type="text" name="monto"/></td>
						<td></td>
					</tr>
				</table>
			</div>
			<div>
				<table>
					<tr>
						<td></td>
						<td><input type="submit" value="Realizar acción"/></td>
					</tr>
					<!--  
						<td>Saldo</td>
						<td><input type="text" name="rValor" value="<%=request.getAttribute("rValor")%>"/></td>
					</tr> --><tr>
					<tr>
						<td></td>
						<td><textarea name="rValor" rows="10" cols="40"><%= request.getAttribute("rError") %></textarea></td>
					</tr>
				</table>
				</div>
			</form>
		<div>
			<table>
				<tr>
					<td><a href="index.jsp"><input type="submit" value="Volver al menú principal"></a></td>
				</tr>
			</table>
		</div>
		
	</body>
</html>