<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="model.JavaBeans"%>
<%@ page import="java.util.ArrayList"%>
<%
ArrayList<JavaBeans> lista = (ArrayList<JavaBeans>)
request.getAttribute("contatos");
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
			</tr>
		</thead>
		<tbody>
			<%
			for (int i = 0; i < lista.size(); i++) {
			%>
			<tr>

				<td>
					<%
					out.println(lista.get(i).getIdcon());
					%>
				</td>
				<td>
					<%
					out.println(lista.get(i).getNome());
					%>
				</td>
				<td>
					<%
					out.println(lista.get(i).getFone());
					%>
				</td>
				<td>
					<%
					out.println(lista.get(i).getEmail());
					%>
				</td>

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