<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

 <%@ page import = "Models.*"%>
 <%@ page import = "services.ProductServices" %>
 <%@ page import = "Dao.Dao" %>
 <%@ page import ="java.util.*" %>
 <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<!DOCTYPE html>
<html>
<%
Musteri mu = (Musteri)request.getSession().getAttribute("auth");
String kategori = request.getParameter("kategori");
String company = request.getParameter("company");
ProductServices pServices=null;
ArrayList<Urun> productList=null;
if(kategori!=null){
    pServices = new ProductServices(Dao.getConnection());
    productList = pServices.getProducts(kategori);
}else if(company!=null){
	pServices = new ProductServices(Dao.getConnection());
	productList = pServices.getProductsByCompany(company);
}
else{
    pServices = new ProductServices(Dao.getConnection());
    productList = pServices.getProducts("All");
}


%>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="includes/navbar.jsp"%>
</head>
<body>
<div class = "container">
<div class = "card-header my-3">All Products</div>
<div class="row">
  
  <%
  if(!productList.isEmpty()){
  for(Urun urun :productList){ %>
  <div class="col-md-3">
				<div class="card w-100" style="width: 18rem;">
					<img src="https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg" alt="John's Image">
					<div class="card-body">
						<h5 class="card-title">Urun Sahibi  <%=urun.getEmail() %></h5>
						<h6 class="price"><%=urun.getFiyat() %>$</h6>
						<h6 class="price">Category: <%=urun.getKategori() %></h6>
						<div class="mt-3 d-flex justify-content-between">
						<%if(mu!=null){%>
						   <input type="hidden" class="id" value="<%=urun.getUrunId() %>"></input>
						   <button type="submit" class="sd btn btn-dark">Add Cart</button>
                         <div>
                         <form action="pay" method="post">
							<button class="btn btn-primary">Buy Now</button><br>
							<select name="payment" required>
							<option value="Kredi Kart">Kredi Karti</option>
							<option value="Nakit">Nakit</option>
							</select>    
							<input type="hidden" name="id" value="<%=urun.getUrunId()%>">  
							</form>
                         </div>
							<%} %>
						</div>
					</div>
				</div>
			</div>
			<%}}%>

</div>

</div>

<script>
$(document).ready(function(){
    $(".sd").click(function(event){
        var id = $(this).siblings(".id").val();
        $.get("add?id=" + id, function(status){
        	$("#cart-count").text(status)
        });
    });
});

</script>


</body>
</html>