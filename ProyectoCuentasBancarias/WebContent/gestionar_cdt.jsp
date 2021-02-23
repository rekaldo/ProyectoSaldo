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
	
		<h1>Gestión de CDT</h1>
		
		
			<form action="sgestioncdt" method="post">
			<div>
				<table>
					<tr>
						<td></td>
						<td><input type="radio" name="valor" value="c"/></td>
						<td>Crear un CDT</td>
						<td></td>
						<td></td>
						<td><input type="radio" name="valor" value="ct"/></td>
						<td>Cerrar un CDT</td>
					</tr>
					<tr>
						<td></td>
						<td>Cuenta : </td>
						<td><input type="text" name="idCuenta"/></td>
					</tr>
					<tr>
						<td></td>
						<td>Interés : </td>
						<td><input type="text" name="interesesMensuales"/></td>
						<td></td>
						<td></td>
						<td>CDT :</td>
						<td><input type="text" name="cdt"/></td>
					</tr>
					<tr>
						<td></td>
						<td>Monto : </td>
						<td><input type="text" name="valorInversion"/></td>
					</tr>	
					
				</table>
			</div>
			<div>
				<table>
					<tr>
						<td></td>
						<td><input type="submit" value="Realizar acción"/></td>
					</tr>
					<tr>
						<td>Saldo</td>
						<td><input type="text" name="rValor" value="<%=request.getAttribute("rValor")%>"/></td>
					</tr>
					<!-- <tr>
						<td></td>
						<td><textarea name="rError" rows="10" cols="40"><%= request.getAttribute("rError") %></textarea></td>
					</tr> -->
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