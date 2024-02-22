<%@ page import="org.hibernate.Session" %>
<%@ page import="com.helper.FactoryProvider" %>
<%@ page import="org.hibernate.QueryException" %>
<%@ page import="org.hibernate.query.Query" %>
<%@ page import="java.util.List" %>
<%@ page import="com.entities.Note" %>
<%--
  Created by IntelliJ IDEA.
  User: sahil
  Date: 2/22/2024
  Time: 2:06 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>All Notes</title>
    <%@include file="all_js_css.jsp"%>
</head>
<body>
   <div class="container">
       <%@ include file="navbar.jsp" %>
       <br>
       <h1 class="text-uppercase">All Notes:</h1>

       <div class="row" >
           <div class="col-12" >
               <%--       for fetching the data--%>
               <%
                   Session s = FactoryProvider.getFactory().openSession();
                   //  show list of notes
                   Query q = s.createQuery("from Note ");
                   List<Note> list = q.list();
                   // for printing the data
                   for (Note note : list)
                   {
               %>
                   <div class="card m-4">
                       <img class="card-img-top m-4"
                            style="max-width:100px"
                            src="Image/pencil.png"
                            alt="Card image cap">
                       <div class="card-body">
                           <h5 class="card-title"> <%= note.getTitle() %> </h5>
                           <p class="card-text">
                               <%= note.getContent() %>
                           </p>
                           <p>
                               <b class="text-primary"> <%=note.getAddedDate()%></b>
                           </p>
<%--                           <p><b <%=note.getAddedDate()%> /></p>--%>
                           <a href="DeleteServlet?note_id= <%= note.getId() %>" class="btn btn-danger">Delete</a>
                           <a href="edit.jsp?note_id= <%=note.getId()%> " class="btn btn-primary">Update</a>
                       </div>
                   </div>

                   <%
                   }
                   s.close();
                   %>
           </div>

       </div>


   </div>
</body>
</html>
