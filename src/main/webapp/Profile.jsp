<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="Models.*" %>
<%@ page import="services.*" %>
<%@ page import="Dao.Dao" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<%Musteri mu = (Musteri)request.getSession().getAttribute("auth");
ProductServices pservice ;
pservice = new ProductServices(Dao.getConnection());
ArrayList<Urun> pList = pservice.getMyProducts(mu);
%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="includes/navbar.jsp"%>
<style>
    table {
            width: 100%;
            border-collapse: collapse;
            margin: 25px 0;
            font-size: 18px;
            text-align: left;
        }
        th, td {
            padding: 12px;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #2874f0;
            color: white;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        img {
            width: 50px;
            height: 50px;
        }
</style>
</head>
<body>
<div class="container pt-4">
<table>
  <thead>
    <tr>
      <th scope="col">#</th>
      
      <th scope="col">Ad</th>
      <th scope="col">Kategori</th>
      <th scope="col">Sayi</th>
      <th scope="col">Fiyat</th>
       <th scope="col"></th>
       <th scope="col"></th>
      
      
    </tr>
  </thead>
    <tbody>
    <%int i=0;
    if(!pList.isEmpty()){
  
    for(Urun urun:pList){ %>
    <tr>
      <td scope="row"><%=i=i+1 %></td>
      <td><%=urun.getAd() %></td>
      <td><%=urun.getKategori() %></td>
      <td><%=urun.getSayi() %></td>
      <td><%=urun.getFiyat() %>$</td>
      <td><img src="https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg" alt="John's Image"></td>
   <td>
     <a href="edit.jsp?email=<%=urun.getEmail()%>&sayi=<%=urun.getSayi()%>&ad=<%=urun.getAd()%>&fiyat=<%=urun.getFiyat()%>&goruntu=<%=urun.getGoruntu()%>&urunID=<%=urun.getUrunId() %>" class="btn btn-primary btn-sm">Edit</a>
     <input type="hidden" class="id" value=<%=urun.getUrunId()%> ></input>
     <button class="delete btn btn-danger btn-sm mt-1">Remove</button>

      </td>

    </tr>
          
    <%}} %>
  </tbody>

</table>
</div>
<script>
$(document).ready(function() {
    $(".delete").click(function() {
        var id = $(this).siblings(".id").val();
        var button = $(this);
        $.get("delete?id=" + id+"&islem=urun&gmail=null&tarih=null", function(status) {
        	button.closest("tr").remove();
        });
    });
});
</script>
    

</body>
</html>