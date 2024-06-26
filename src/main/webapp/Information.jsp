<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="Dao.Dao" %>
<%@page import="services.*" %>
<%@page import="Models.*" %>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<% String gmail = request.getParameter("id");
ArrayList<Urun> urunList = new ArrayList<>();
ArrayList<Cart> cartList = new ArrayList<>();
ArrayList<Order> orderList = new ArrayList<>();
if(gmail!=null){
ProductServices pservice = new ProductServices(Dao.getConnection());
CartService cservice = new CartService(Dao.getConnection());
OrderService oservice = new OrderService(Dao.getConnection());
Musteri m = new Musteri();
m.setEmail(gmail);
cartList = cservice.getCartProducts(gmail);
if(cartList==null){
	System.out.println("null");
}
urunList = pservice.getMyProducts(m);
orderList = oservice.getOrders(gmail);

}else{
	response.sendRedirect("Login.jsp");
}

%>
<style>
img {
width: 50px;height: 50px;
}
</style>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<%@include file="includes/SuperUserNavbar.jsp" %>

</head>
<body>
<div class="container p-2" id="urun">
<h3>Urunler</h3>
<table class="table table-bordered">
  <thead class="thead-dark">
    <tr>
      <th scope="col">#</th>
      <th scope="col">Ad</th>
      <th scope="col">Fiyat</th>
      <th scope="col">Sayi</th>
      <th scope="col"></th>
      <th scope="col"></th>
      <th scope="col"></th>
    </tr>
  </thead>
  <tbody>
  <% for(Urun urun : urunList) { %>
    <tr>
      <th scope="row">1</th>
      <td><%= urun.getAd() %></td>
      <td><%= urun.getFiyat() %>$</td>
      <td><%= urun.getSayi() %></td>
      <td><td><img src="https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg" alt="John's Image"></td></td>
      <td>
      <input type="hidden" class="id" value="<%= urun.getUrunId() %>">
      <button class="deleteU btn btn-danger btn-sm mt-1">Remove</button>
      <a href="edit.jsp?email=<%=urun.getEmail()%>&sayi=<%=urun.getSayi()%>&ad=<%=urun.getAd()%>&fiyat=<%=urun.getFiyat()%>&goruntu=<%=urun.getGoruntu()%>&urunID=<%=urun.getUrunId() %>" class="btn btn-primary btn-sm">Edit</a>
      </td>
    </tr>
  <% } %>
  </tbody>
</table>
<a href="ShareProduct.jsp?id=<%=gmail %>&yetki=super" class="btn btn-primary btn-sm">Urun Ekle</a>
</div>

<div class="container p-2" id="order">
<h3>Siparisler</h3>
<table class="table table-bordered">
  <thead class="thead-dark">
    <tr>
      <th scope="col">#</th>
      <th scope="col">Ad</th>
      <th scope="col">Fiyat</th>
      <th scope="col">Sayi</th>
      <th scope="col"></th>
      <th scope="col"></th>
      <th scope="col"></th>
    </tr>
  </thead>
  <tbody>
  <% for(Order order : orderList) { %>
    <tr>
      <th scope="row">1</th>
      <td><%= order.getAd() %></td>
      <td><%= order.getFiyat() %>$</td>
      <td><input type="number" class="say" min="1" value="<%=order.getSayi()%>" style="width: 50px;" required>
      <input type="hidden" class="id" value="<%=order.getUrunId()%>" >
      <input type="hidden" class="gmail" value="<%=order.getEmail()%>" >
      <input type="hidden" class="tarih" value="<%=order.getTarih()%>" >
      <button class="uptO btn btn-primary">Update</button>
      </td>
      
      <td><img src="https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg" alt="John's Image"></td>
      
      <td>
      <input type="hidden" class="id" value="<%= order.getUrunId() %>">
      <input type="hidden" class="gmail" value="<%= order.getEmail() %>">
      <input type="hidden" class="tarih" value="<%=order.getTarih()%>" >
      <button class="deleteO btn btn-danger btn-sm mt-1">Remove</button>
      </td>
    </tr>
  <% } %>
  </tbody>
</table>
<a href="SiparisEkle.jsp?user=<%=gmail %>" class="btn btn-primary btn-sm">Siparis Ekle</a>
</div>


<div class="container p-2" id="cart">
<h3>Sepet</h3>
<table class="table table-bordered">
  <thead class="thead-dark">
    <tr>
      <th scope="col">#</th>
      <th scope="col">Ad</th>
      <th scope="col">Fiyat</th>
      <th scope="col">Sayi</th>
      <th scope="col"></th>
      <th scope="col"></th>
      <th scope="col"></th>
    </tr>
  </thead>
  <tbody>
  <% for(Cart cart : cartList) { %>
    <tr>
      <th scope="row">1</th>
      <td><%= cart.getAd() %></td>
      <td><%= cart.getFiyat() %>$</td>
      <td><input type="number" class="say" min="1" value="<%=cart.getSayi()%>" style="width: 50px;" required>
          <input type="hidden" class="id" value=<%=cart.getUrunId()%>>
          <input type="hidden" class="gmail" value=<%=gmail %> >
          <button class="uptC btn btn-primary">Update</button>
      </td>
      
      <td><img src="https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg" alt="John's Image"></td>
      
      <td>
      <input type="hidden" class="gmail" value=<%=gmail%>>
      <input type="hidden" class="id" value="<%=cart.getUrunId() %>">
      <button class="deleteC btn btn-danger btn-sm mt-1">Remove</button>

      </td>
    </tr>
  <% } %>
  </tbody>
</table>
</div>
</body>
<script>
$(document).ready(function() {
    $(".deleteU").click(function() {
        var id = $(this).siblings(".id").val();
        var button = $(this);
        $.get("delete?id=" + id+"&islem=urun&gmail=null&tarih=null", function(status) {
        	button.closest("tr").remove();
        });
    });
    
    $(".deleteC").click(function() {
        var id = $(this).siblings(".id").val();
        var gmail = $(this).siblings(".gmail").val();
        var button = $(this);
        $.get("delete?id=" + id+"&islem=cartS&gmail="+gmail+"&tarih=null", function(status) {
        	button.closest("tr").remove();
        });
    });
    
    $(".deleteO").click(function() {
        var id = $(this).siblings(".id").val();
        var gmail = $(this).siblings(".gmail").val();
        var tarih = $(this).siblings(".tarih").val();
        alert(tarih)
        var button = $(this);
        $.get("delete?id=" + id+"&islem=order&gmail="+gmail+"&tarih="+tarih, function(status) {
        	button.closest("tr").remove();
        });
    });
});
</script>

<script >
$(document).ready(function(){
	$(".uptO").click(function(){
		var id = $(this).siblings(".id").val();
		var say = $(this).siblings(".say").val();
		var tarih = $(this).siblings(".tarih").val()
		var gmail = $(this).siblings(".gmail").val();
		$.get("upt?id="+id+"&say="+say+"&islem=order&tarih="+tarih +"&gmail="+gmail, function(data,status){
		     
		});
	});
	
	$(".uptC").click(function(){
		var say = $(this).siblings(".say").val();
		var id = $(this).siblings(".id").val();
		var gmail =$(this).siblings(".gmail").val();
		alert(say+" " +id +" " + gmail)
		$.get("upt?id="+id+"&say="+say+"&islem=cart&tarih=null&gmail="+gmail , function(data,status){
			
		});
		
	});
	
});

</script>



</html>