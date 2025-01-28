<%@page import="com.entites.Note"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update page</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>
	<div class="container">
		<%@include file="navbar.jsp"%>
		<h1 class="text-uppercase">Update Note:</h1>
		<%
		int noteId = Integer.parseInt(request.getParameter("note_id"));

		Session s = FactoryProvider.getFactory().openSession();

		Note noteObj = (Note) s.get(Note.class, noteId);

		s.close();
		%>
		<br>
		<form action="UpdateServlet" method="post">
			<input value="<%=noteObj.getId()%>" name="note_id" type="hidden" />
			<div class="form-group">
				<label for="Title">Title</label> <input required name="title"
					type="text" class="form-control" id="exampleInputEmail1"
					aria-describedby="emailHelp" placeholder="Enter Title"
					value="<%=noteObj.getTitle()%>">
			</div>
			<div class="form-group">
				<label for="content">Content</label>
				<textarea name="content" required id="content"
					placeholder="Enter your content here" class="form-control"
					style="height: 300px;"><%=noteObj.getContent()%></textarea>
			</div>
			<div class="continer text-center">
				<button type="submit" class="btn btn-success">Save Note</button>
			</div>

		</form>

	</div>
</body>
</html>