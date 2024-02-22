<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Note Taker App : Home Page</title>
    <%@include file="all_js_css.jsp"%>
  </head>
  <body>
    <div class="container-fluid">
       <%@ include file="navbar.jsp" %>
      <br>
      <div class="card my-5">
        <img class="Image-fluid mx-auto" style="max-width: 400px" src="Image/pencil.png">

      </div>
      <h1 class="text-primary text-uppercase text-center mt-3">Start Taking Your Notes</h1>
      <div class="container text-center" >
        <button class="btn btn-outline-success text-center"><a href="add_notes.jsp" style="color:black; text-decoration: none; ">Start Here</a></button>
      </div>
    </div
  </body>
</html>