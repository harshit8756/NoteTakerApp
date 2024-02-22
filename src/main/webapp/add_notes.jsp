<%--
  Created by IntelliJ IDEA.
  User: sahil
  Date: 2/21/2024
  Time: 7:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Notes</title>
    <%@include file="all_js_css.jsp"%>
</head>
<body>
<div class="container-fluid">
    <%@ include file="navbar.jsp" %>
    <br>
    <h1>Please fill your note detail</h1>
    <br>

    <%--creating form--%>
    <form action="SaveNoteServlet" method="post">
        <div class="form-group">
            <label for="title" >Note Title</label>
            <input name="title" required type="text" class="form-control" style="height: 50px" id="title" placeholder="Enter here" aria-describedby="emailHelp">
        </div>

        <div class="form-group">
            <label for="note-content">Note Content</label>
            <textarea name="content" required id="note-content" class="form-control" style="height: 200px" placeholder="Enter your content details"></textarea>
        </div>

        <div class="container text-center">
            <button type="submit" class="btn btn-primary" >Add</button>
        </div>
    </form>
</div

</body>
</html>
