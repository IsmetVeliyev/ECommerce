<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"%>
<%@ page import="services.*" %>
<%@ page import="Dao.*" %>
<%@ page import="java.util.*" %>
<%@ page import="Models.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Client Management</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"/>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<%
Musteri mu = (Musteri)request.getSession().getAttribute("auth");
ArrayList<Musteri> cList = new ArrayList<>();
if(mu != null && mu.getEmail().equals("super@345")){
    ClientService cservice = new ClientService(Dao.getConnection());
    cList = cservice.getClients();
}else{
    response.sendRedirect("Home.jsp");
}
%>
</head>
<body>
<nav class="navbar navbar-light bg-light justify-content-between">
  <a class="navbar-brand">Navbar</a>
  <form action="search" method="POST" class="form-inline">
    <input class="form-control mr-sm-2" type="text" name="search">
    <input type="hidden" name="islem" value="super">
    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
  </form>
  <a class="btn btn-outline-danger my-2 my-sm-0" href="log-out">Logout</a>
</nav>

<div class="container p-2">
<table class="table">
  <thead class="thead-dark">
    <tr>
      <th scope="col">#</th>
      <th scope="col">Ad</th>
      <th scope="col">Soyad</th>
      <th scope="col">Email</th>
      <th scope="col">Sifre</th>
      <th scope="col"></th>
    </tr>
  </thead>
  <tbody>
  <% int index = 1; %>
  <% for(Musteri m : cList) { %>
    <tr>
      <th scope="row"><%= index++ %></th>
      <td><input type="text" class="ad" value="<%= m.getAd() %>" style="width: 80px;"></td>
      <td><input type="text" class="soyad" value="<%= m.getSoyad() %>" style="width: 80px;"></td>
      <td class="email"><%= m.getEmail() %></td>
      <td><input type="text" value="<%= m.getSifre() %>" class="sifre" style="width: 80px;"></td>
      <td>
        <button class="update btn btn-primary btn-sm">Update</button>
        <input type="hidden" class="id" value="<%= m.getEmail() %>">
        <button class="deleteM btn btn-danger btn-sm mt-1">Remove</button>
        <a href="Information.jsp?id=<%= m.getEmail() %>" class="btn btn-primary btn-sm">Info</a>
      </td>
    </tr>
  <% } %>
  </tbody>
</table>
<a href="Register.jsp" class="btn btn-primary btn-sm">Musteri Ekle</a>
</div>

<script>
$(document).ready(function() {
    $(".deleteM").click(function() {
        var id = $(this).siblings(".id").val();
        var button = $(this);
        $.get("delete?id=" + id + "&islem=musteri&gmail=null&tarih=null", function(status) {
            button.closest("tr").remove();
        });
    });

    $(".update").click(function(){
        var row = $(this).closest("tr");
        var ad = row.find(".ad").val();
        var soyad = row.find(".soyad").val();
        var email = row.find(".email").text();
        var sifre = row.find(".sifre").val();
        $.ajax({
            url: 'uptuser',
            type: 'POST', 
            data: {
                ad: ad,
                soyad: soyad,
                email: email,
                sifre: sifre
            },
            success: function(response) {
                alert(email + " updated");
            },
            error: function() {
                alert(email + " not updated");
            }
        });


    });
});
</script>
</body>
</html>
