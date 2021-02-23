<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="ISO-8859-1"/>
		<title>Cuentas Bancarias</title>
		<link rel="Stylesheet" type="text/css" href="estilos/estilos.css"/>
	</head>

	<body>	
	
		<h1>Visualizar Saldo</h1>
		
		
			<form action="svisualizarsaldos" method="post">
			<div>
				<table>
					<tr>
						<td>
						<input type="radio" name="saldo" value="c"/> 
						<input type="radio" name="saldo" value="cd"/> 
						<input type="radio"	name="saldo" value="cl"/></td>
						<td>
						<p>Saldo cuenta</p>
						<p>Saldo CDT</p>
						<p>Saldo cliente</p>
						</td>
						<td></td>
						<td>Información</td>
						<td><input type="text" name="id"/></td>
					</tr>
				</table>
			</div>
			<div>
				<table>
					<tr>
						<td></td>
						<td><input type="submit" value="Consultar saldo"/></td>
					</tr>
					<tr>
						<td>Saldo</td>
						<td><input type="text" name="rSaldo" value="<%= request.getAttribute("rSaldo") %>"/></td>
					</tr>
					<tr>
						<td></td>
						<td><textarea name="rError" rows="10" cols="40"><%= request.getAttribute("rError") %></textarea></td>
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