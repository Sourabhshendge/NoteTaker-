<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Add Note Page</title>
<%@include file="all_js_css.jsp"%>
<meta charset="UTF-8">

</head>
<body>

	<div class="container">
		<%@include file="navbar.jsp"%>

		<h1>Please Fill Note Detail</h1>
		<br>
		<!-- Form -->

		<form action="SaveNoteServlet" method="post">
			<div class="form-group">
				<label for="Title">Title</label> <input required name="title" type="text"
					class="form-control" id="exampleInputEmail1"
					aria-describedby="emailHelp" placeholder="Enter Title">
			</div>
			<div class="form-group">
				<label for="content">Content</label>
				<textarea name="content" required id="content" placeholder="Enter your content here"
					class="form-control"
					style="height:300px;"></textarea>
			</div>
			<div class="continer text-center">
				<button type="submit" class="btn btn-primary">Add Note</button>
			</div>

		</form>

	</div>


</body>
</html>