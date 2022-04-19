<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="model.JavaBeans"%>
<%@ page import="java.util.ArrayList"%>
<%
ArrayList<JavaBeans> lista = (ArrayList<JavaBeans>) request.getAttribute("contatos");
%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="utf-8">
<title>Agenda de contatos</title>
<link rel="icon" href="img/favicon.png">
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
	<form action="edit" name="frmContato">
		<table>
			<tr>
				<td><input type="text" name="idcon" class="caixa1" /></td>
			</tr>
			<tr>
				<td><input type="text" name="nome" placeholder="Nome"
					class="caixa1" /></td>
			</tr>
			<tr>
				<td><input type="text" name="fone" placeholder="Fone"
					class="caixa2" /></td>
			</tr>
			<tr>
				<td><input type="text" name="email" placeholder="E-mail"
					class="caixa1" /></td>
			</tr>
		</table>
		<input type="button" value="Adicionar" class="btn" onclick="validar()" />
	</form>
	<script type="text/javascript" src="scripts/validador.js"></script>
</body>
</html>