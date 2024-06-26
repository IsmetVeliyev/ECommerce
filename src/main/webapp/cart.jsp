<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="services.*"%>
<%@ page import="Dao.Dao"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<title>Insert title here</title>
<%
Musteri mu = (Musteri) request.getSession().getAttribute("auth");
double Tfiyat;
if (mu == null) {
	response.sendRedirect("Login.jsp");
}
%>
<%@include file="includes/navbar.jsp"%>
<%
CartService cserv = new CartService(Dao.getConnection());
Tfiyat = cserv.cartCost(cartList);
%>
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
		<h2 id="fiyat">
			Toplam fiyat:<%=Tfiyat%>$
		</h2>
		<table>
			<thead>
				<tr>
					<th scope="col">#</th>
                    <th scope="col">Foto</th>
					<th scope="col">Ad</th>
					<th scope="col">Kategori</th>
					<th scope="col">Sayi</th>
					<th scope="col"></th>
					<th scope="col">Fiyat</th>
					<th scope="col"></th>
					<th scope="col"></th>
				</tr>
			</thead>
			<tbody>
				<%
				int i = 0;
				if (!cartList.isEmpty()) {

					for (Cart cart : cartList) {
				%>
				<tr>
					<td scope="row"><%=i = i + 1%></td>
					<td><img src="https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg" alt="John's Image"></td>
					<td><%=cart.getAd()%></td>
					<td><%=cart.getKategori()%></td>
					<td><input type="number" class="say" min="1" value="<%=cart.getSayi()%>" style="width: 50px;" required>
					<input type="hidden" class="id" value=<%=cart.getUrunId() %>> 
					<input type="hidden" class="gmail" value=<%=mu.getEmail() %>>
					<button class="upt btn btn-primary">Update</button>
					<td>
					<td><%=cart.getFiyat()%>$</td>
					<td><input type="hidden" class="id"
						value=<%=cart.getUrunId()%>>
						
						<button id="delete" class="delete btn btn-danger btn-sm mt-1">Remove</button>
					</td>

				</tr>

				<%
				}
				}
				%>
			</tbody>

		</table>
		<a href="Payment.jsp" class="btn btn-primary">ODEME</a>
	</div>
	<script>
		$(document).ready(
				function() {
					$(".delete").click(
							function() {
								var id = $(this).siblings(".id").val();
								var button = $(this);
								$.get("delete?id=" + id
										+ "&islem=cart&gmail=null&tarih=null", function(
										data, status) {
									button.closest("tr").remove();
									$("#fiyat")[0].innerText="Toplam Fiyat:" + data+'$';
								});
							});
				});
	</script>
	
	<script>
	$(document).ready(function(){
		$(".upt").click(
				function(){
					var say = $(this).siblings(".say").val();
					var id = $(this).siblings(".id").val();
					var gmail =$(this).siblings(".gmail").val();
					$.get("upt?id="+id+"&say="+say+"&islem=cart&tarih=null&gmail="+gmail , function(data,status){
						$("#fiyat")[0].innerText="Toplam Fiyat:"+data+"$";
					}
							);
					
				}
				);
		
	});
	</script>
</body>

</html>