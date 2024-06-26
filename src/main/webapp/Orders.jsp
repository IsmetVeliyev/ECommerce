<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

 <%@ page import = "Models.*"%>
 <%@ page import = "Dao.Dao" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<meta charset="ISO-8859-1">
<%Musteri mu = (Musteri)request.getSession().getAttribute("auth");
OrderService oservice=null;
ArrayList<Order> orderList = new ArrayList<>();
if(mu!=null){
	oservice = new OrderService(Dao.getConnection());
	System.out.println(mu.getEmail());
    orderList  = oservice.getOrders(mu.getEmail());
}else{
response.sendRedirect("Home.jsp");
}
%>
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
      <th scope="col">Foto</th>
      <th scope="col">Ad</th>
      <th scope="col">Kategori</th>
      <th scope="col">Sayi</th>
      <th scope="col"></th>
      <th scope="col">Fiyat</th>
      <th scope="col">Yontem</th>
      <th scope="col">Tarih</th>
      <th scope="col"></th>
    </tr>
  </thead>
    <tbody>
    <%int i=0;
    if(!orderList.isEmpty()){
  
    for(Order order:orderList){ %>
    <tr>
      <td><img src="https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg" alt="John's Image"></td>
      <td><%=order.getAd() %></td>
      <td><%=order.getKategori() %></td>
      <td><input type="number" class="say" min="1" value="<%=order.getSayi()%>" style="width: 50px;" required>
	  <input type="hidden" class="id" value="<%=order.getUrunId() %>"> 
	  <input type="hidden" class="gmail" value=<%=mu.getEmail() %>>
	  <input type="hidden" class="tarih" value="<%=order.getTarih() %>">
	  <button class="upt btn btn-primary">Update</button>
	  <td>
      
      <td><%=order.getFiyat() %>$</td>
      <td><%=order.getYontem() %></td>
      <td><%=order.getTarih() %></td>
      <td>
          <input type="hidden" class="id" value=<%= order.getUrunId() %>>
          <input type="hidden" class="gmail" value=<%=mu.getEmail() %>>
          <input type="hidden" class="tarih" value="<%=order.getTarih() %>">
          <button id="delete" class="delete btn btn-danger btn-sm mt-1">Remove</button>
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
        var gmail =$(this).siblings(".gmail").val();
        var tarih=$(this).siblings(".tarih").val();
        var button = $(this);
        alert(tarih)
        $.get("delete?id=" + id+"&islem=order&gmail="+gmail+"&tarih="+tarih, function(status) {
        	button.closest("tr").remove();
        });
    });
});
$(document).ready(function(){
	$(".upt").click(function(){
		var say = $(this).siblings(".say").val();
		var id = $(this).siblings(".id").val();
		var tarih = $(this).siblings(".tarih").val();
		var gmail = $(this).siblings(".gmail").val();
		alert(tarih);
		$.get("upt?id="+id+"&say="+say+"&islem=order&tarih="+tarih +"&gmail="+gmail, function(data,status){
		     
					});
				});
	});
</script>


<script>

	</script>
</body>

</body>
</html>