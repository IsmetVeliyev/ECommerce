<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="Models.*" %>  
<%@ page import="java.util.ArrayList" %>
<%@ page import="services.*" %>
<%@ page import="Dao.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Owners of Products</title>
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
        }

        .sidebar {
            width: 300px;
            padding: 15px;
            background-color: #f8f9fa;
            border-right: 1px solid #dee2e6;
            height: 100vh;
            overflow-y: auto;
        }

        .sidebar h2 {
            text-align: center;
            color: #343a40;
            margin-bottom: 20px;
        }

        .section {
            margin-bottom: 20px;
        }

        .section h3 {
            color: #495057;
            border-bottom: 1px solid #dee2e6;
            padding-bottom: 5px;
            margin-bottom: 10px;
        }

        ul {
            list-style-type: none;
            padding: 0;
        }

        ul li {
            margin: 5px 0;
        }

        ul li a {
            text-decoration: none;
            color: #007bff;
            font-weight: bold;
        }

        ul li a:hover {
            text-decoration: underline;
        }

        .section p {
            color: #495057;
        }
    </style>
                <% 
ArrayList<Musteri> mList = null;
Musteri mu = (Musteri) request.getSession().getAttribute("auth");
String gmail = request.getParameter("email");
String user = request.getParameter("user");
if (mu != null && mu.getEmail().equals("super@345")) {
    ClientService cService = new ClientService(Dao.getConnection());
    mList = cService.getClients();
   } else {
     response.sendRedirect("Login.jsp");
}
ArrayList<Urun> uList = null;
ProductServices pService = null;
if(gmail!=null){
	pService =new ProductServices(Dao.getConnection());
	Musteri musteri = new Musteri();
	musteri.setEmail(gmail);
	uList = pService.getProductsByCompany(gmail);
}else{
	pService=new ProductServices(Dao.getConnection());
	uList = pService.getProducts("All");
}
%>
</head>
<body>
    <div class="sidebar">
        <h2>Owners of Products</h2>
        
        <div class="section">
            <h3>Companies</h3>
            <ul>
                <%
                if (mList != null && !mList.isEmpty()) {
                    for (Musteri m : mList) {
                %>
                    <li><a href="SiparisEkle.jsp?email=<%= m.getEmail() %>&user=<%=user%>"><%= m.getEmail() %></a></li>
                <% 
                    } 
                }
                %>
            </ul>
        </div>
    </div>

    <div class="container">
        <div class="card-header my-3">All Products</div>
        <div class="row">
            <%for(Urun urun: uList ){ %>
            <div class="col-md-3">
                <div class="card w-10" style="width: 18rem;">
                    <img src="https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg" alt="Product Image">
                    <div class="card-body">
                        <h5 class="card-title">Product Owner: <%=urun.getEmail() %></h5>
                        <h6 class="price"><%=urun.getFiyat() %>$</h6>
                        <h6 class="category">Category: <%=urun.getKategori() %></h6>
                        <div class="mt-3 d-flex justify-content-between">
                            <div>
                                <form action="pay" method="post">
                                    <button class="btn btn-primary">Buy Now</button><br>
                                    <select name="payment" required>
                                        <option value="creditcard">Credit Card</option>
                                        <option value="cash">Cash</option>
                                    </select>    
                                    <input type="hidden" name="id" value="<%= urun.getUrunId() + " "+user %>">
                                </form>
                            </div>
                        </div>
                    </div>
                    
                </div>
            </div>
                <%}%>
        </div>
    </div>
</body>
</html>