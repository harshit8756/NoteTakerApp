<%@ page import="org.hibernate.Session" %>
<%@ page import="com.helper.FactoryProvider" %>
<%@ page import="org.hibernate.Transaction" %>
<%@ page import="com.entities.Note" %>
<%@ page import="com.helper.* , org.hibernate.*,com.entities.*"%>
<%--
  Created by IntelliJ IDEA.
  User: sahil
  Date: 2/22/2024
  Time: 6:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="all_js_css.jsp"%>
</head>
<body>
<div class="container">
    <%@ include file="navbar.jsp" %>
    <h1>Edit your Note</h1>
    <br>
    <%
        int noteId = Integer.parseInt(request.getParameter("note_id").trim());
        Session s = FactoryProvider.getFactory().openSession();
        Transaction tx = s.beginTransaction();
        Note note = (Note) s.get(Note.class , noteId);
    %>
    <form action="UpdateServlet" method="post">
        <input value="<%=note.getId()%>" name="noteId" type="hidden" />
        <div class="form-group">
            <label for="title" >Note Title</label>
            <input name="title"
                   required
                   type="text"
                   class="form-control"
                   style="height: 50px"
                   id="title"
                   placeholder="Enter here"
                   value="<%=note.getTitle()%>"
                   aria-describedby="emailHelp">
        </div>

        <div class="form-group">
            <label for="note-content">Note Content</label>
            <textarea name="content" required
                      id="note-content"
                      class="form-control"
                      style="height: 200px" placeholder="Enter your content details"><%=note.getContent()%></textarea>
        </div>

        <div class="container text-center">
            <button type="submit" class="btn btn-success" >Save Note</button>
        </div>
    </form>

</div

</body>
</html>
