<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="Models.*" %>
<%@ page import="java.util.*" %>
<%@ page import="services.*" %>
<%@ page import="Dao.Dao" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<head>
<%CartService cservice = new CartService(Dao.getConnection());
ArrayList<Cart> cartList=null;
if(mu!=null){
cartList= cservice.getCartProducts(mu.getEmail());
HttpSession ses = request.getSession();
ses.setAttribute("ses",cartList); 
}
%>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Ecommerce Navbar Design</title>

    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
</head>
<style>
.main-navbar{
    border-bottom: 1px solid #ccc;
}
.main-navbar .top-navbar{
    background-color: #2874f0;
    padding-top: 10px;
    padding-bottom: 10px;
}
.main-navbar .top-navbar .brand-name{
    color: #fff;
}
.main-navbar .top-navbar .nav-link{
    color: #fff;
    font-size: 16px;
    font-weight: 500;
}
.main-navbar .top-navbar .dropdown-menu{
    padding: 0px 0px;
    border-radius: 0px;
}
.main-navbar .top-navbar .dropdown-menu .dropdown-item{
    padding: 8px 16px;
    border-bottom: 1px solid #ccc;
    font-size: 14px;
}
.main-navbar .top-navbar .dropdown-menu .dropdown-item i{
    width: 20px;
    text-align: center;
    color: #2874f0;
    font-size: 14px;
}
.main-navbar .navbar{
    padding: 0px;
    background-color: #ddd;
}
.main-navbar .navbar .nav-item .nav-link{
    padding: 8px 20px;
    color: #000;
    font-size: 15px;
}

.navbar-nav .nav-item .nav-link:hover{
	color: #2874f0;
	background-color: #fff;
}

@media only screen and (max-width: 600px) {
    .main-navbar .top-navbar .nav-link{
        font-size: 12px;
        padding: 8px 10px;
    }
}

</style>
<body>

    <div class="main-navbar shadow-sm sticky-top">
        <div class="top-navbar">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-2 my-auto d-none d-sm-none d-md-block d-lg-block">
                        <h5 class="brand-name">XariBulbul Ecom</h5>
                    </div>
                    <div class="col-md-5 my-auto">
                        <form action="search" method="post">
                            <div class="input-group">
                                <input type="text" name="search" placeholder="Search for company" class="form-control" />
                                <input type="hidden" name ="islem" value="user">
                                <button class="btn bg-white" type="submit">
                                    <i class="fa fa-search"></i>
                                </button>
                            </div>
                        </form>
                    </div>
                    <div class="col-md-5 my-auto">
                        <ul class="nav justify-content-end">
                            
                                <%if(mu!=null){ %>
                            <li class="nav-item">
                                <a class="nav-link" href="#">
                                   <i class="fa fa-shopping-cart"></i> Cart (<span id="cart-count"><%=cservice.getCount(cartList)%></span>)
                                </a>
                            </li>
                                <%}else{ %>
                              <li class="nav-item">
                                <a class="nav-link" href="#">
                                    <i class="fa fa-shopping-cart"></i> Cart (0)
                                </a>
                                <%} %>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                   <% if(mu!=null){%>
                                    <i class="fa fa-user"></i> <%=mu.getAd() %>
                                    <% }else{%>
                                    <i class="fa fa-user"></i> UserName
                                    
                                   <% }%>
                                    
                                </a>
                                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <%if(mu!=null) {%>
                                <li><a class="dropdown-item" href="Profile.jsp"><i class="fa fa-user"></i> Profile</a></li>
                                <li><a class="dropdown-item" href="ShareProduct.jsp?id=<%=mu.getEmail()%>"><i class="fa fa-share"></i> Share Product</a></li>
                                <li><a class="dropdown-item" href="Orders.jsp"><i class="fa fa-list"></i> My Orders</a></li>
                                <li><a class="dropdown-item" href="cart.jsp"><i class="fa fa-shopping-cart"></i> My Cart</a></li>
                                <li><a class="dropdown-item" href="log-out"><i class="fa fa-sign-out"></i> Logout</a></li>
                                <% }else{%>
                                <li><a class="dropdown-item" href="Login.jsp"><i class="fa fa-sign-in"></i>Login</a></li>
                                <li><a class="dropdown-item" href="Register.jsp"><i class="fa fa-user-plus"></i>Register</a></li>
                                <%}%>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
  <nav class="navbar navbar-expand-lg">
            <div class="container-fluid">
                <a class="navbar-brand d-block d-sm-block d-md-none d-lg-none" href="#">
                    
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link" href="Home.jsp">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="Home.jsp?kategori=Elektronik">Elektronik</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="Home.jsp?kategori=Moda">Moda</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Ev-Ofis esyalari 
                            </a>
                            <ul class="dropdown-menu">
                                <li> <a class="dropdown-item" href="Home.jsp?kategori=Ev"style="color: #2874f0;">Ev</a></li>
                                <li> <a class="dropdown-item" href="Home.jsp?kategori=Ofis"style="color: #2874f0;">Ofis</a></li>
                            </ul>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Anne,Bebek,Oyuncak
                            </a>
                            <ul class="dropdown-menu">
                                <li> <a class="dropdown-item" href="Home.jsp?kategori=Anne"style="color: #2874f0;">Anne</a></li>
                                <li> <a class="dropdown-item" href="Home.jsp?kategori=Bebek"style="color: #2874f0;">Bebek</a></li>
                                <li> <a class="dropdown-item" href="Home.jsp?kategori=Oyuncak"style="color: #2874f0;">Oyuncak</a></li>
                            </ul>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Spor,Ayakkabi 
                            </a>
                            <ul class="dropdown-menu">
                                <li> <a class="dropdown-item" href="Home.jsp?kategori=Spor"style="color: #2874f0;">Spor</a></li>
                                <li> <a class="dropdown-item" href="Home.jsp?kategori=ayakkabi"style="color: #2874f0;">Ayakkabı</a></li>
                            </ul>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Kozmetik,KiselBakim 
                            </a>
                            <ul class="dropdown-menu">
                                <li> <a class="dropdown-item" href="Home.jsp?kategori=kosmetik"style="color: #2874f0;">Kozmetik</a></li>
                                <li> <a class="dropdown-item" href="Home.jsp?kategori=kisiselbakim"style="color: #2874f0;">Kişisel Bakım</a></li>
                            </ul>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Super-Market,PetShop
                            </a>
                            <ul class="dropdown-menu">
                                <li> <a class="dropdown-item" href="Home.jsp?kategori=superMarket" style="color: #2874f0;">Super-Market</a></li>
                                <li> <a class="dropdown-item" href="Home.jsp?kategori=PetShop" style="color: #2874f0;">PetShop</a></li>
                            </ul>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Kitab,Müzik,Film,Hobi
                            </a>
                            <ul class="dropdown-menu">
                                <li> <a class="dropdown-item" href="Home.jsp?kategori=Kitap"style="color: #2874f0;">Kitab</a></li>
                                <li> <a class="dropdown-item" href="Home.jsp?kategori=Muzik"style="color: #2874f0;">Müzik</a></li>
                                <li> <a class="dropdown-item" href="Home.jsp?kategori=Film"style="color: #2874f0;">Film</a></li>
                                <li> <a class="dropdown-item" href="Home.jsp?kategori=Hobi"style="color: #2874f0;">Hobi</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>