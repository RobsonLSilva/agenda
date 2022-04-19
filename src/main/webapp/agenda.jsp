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
	<h1>Agenda de contatos</h1>
	<a href="novo.html" class="btn">Novo contato</a>
	<table id="tabela">
		<thead>
			<tr>
				<th>Código</th>
				<th>Nome</th>
				<th>Telefone</th>
				<th>Email</th>
				<th>Opções</th>
			</tr>
		</thead>
		<tbody>
			<%
			for (int i = 0; i < lista.size(); i++) {
			%>
			<tr>
				<td><%=lista.get(i).getIdcon() %></td>
				<td><%=lista.get(i).getNome() %></td>
				<td><%=lista.get(i).getFone() %></td>
				<td><%=lista.get(i).getEmail() %></td>
				<td><a href="select?idcon=<%=lista.get(i).getIdcon()%>" class="btn">Editar</a></td>
			</tr>
			<%
			}
			%>
		</tbody>

		<tfoot>

		</tfoot>
	</table>
</body>
</html>