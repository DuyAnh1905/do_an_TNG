<%-- 
    Document   : footer
    Created on : Nov 10, 2024, 2:38:32 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="container-fluid bg-dark text-secondary mt-5 pt-5">
    <div class="row px-xl-5 pt-5">
        <div class="col-lg-4 col-md-12 mb-5 pr-3 pr-xl-5">
            <h5 class="text-secondary text-uppercase mb-4">CÔNG TY CỔ PHẦN HUNONIC VIỆT NAM</h5>
            <p class="mb-4">Nhà máy sản xuất: Ngõ 1261, Tổ 12, phường Phú Xá, thành phố Thái Nguyên</p>
            <p class="mb-2"><i class="fa fa-map-marker-alt text-primary mr-3"></i>Trụ sở: Hunonic Center, Đường CMT8, Tổ 2, Phường Cam Giá, TP Thái Nguyên</p>
            <p class="mb-2"><i class="fa fa-envelope text-primary mr-3"></i>info@hunonic.vn</p>
            <p class="mb-0"><i class="fa fa-phone-alt text-primary mr-3"></i>Hotline: 0983 988 828</p>
        </div>
        <div class="col-lg-8 col-md-12">
            <div class="row">
                <div class="col-md-4 mb-5">
                    <h5 class="text-secondary text-uppercase mb-4">Quick Shop</h5>
                    <div class="d-flex flex-column justify-content-start">
                        <c:forEach items="${categoryList}" var="category">

                            <a  href="CategoryServlet?categoryId=${category.id}" class="nav-item nav-link"><i class="fa fa-angle-right mr-2"></i>${category.name}</a>

                        </c:forEach>

                    </div>
                </div>
                <div class="col-md-4 mb-5">
                    <h5 class="text-secondary text-uppercase mb-4">My Account</h5>
                    <div class="d-flex flex-column justify-content-start">
                        <a class="text-secondary mb-2" href="HomeServlet"><i class="fa fa-angle-right mr-2"></i>Home</a>
                        <a class="text-secondary mb-2" href="ShopServlet?page=1"><i class="fa fa-angle-right mr-2"></i>Our Shop</a>

                        <a class="text-secondary mb-2" href="CartServlet"><i class="fa fa-angle-right mr-2"></i>Shopping Cart</a>



                        <a class="text-secondary mb-2" href="AboutServlet"><i class="fa fa-angle-right mr-2"></i>About</a>


                    </div>
                </div>
                <div class="col-md-4 mb-5">
                    <h5 class="text-secondary text-uppercase mb-4">CÔNG TY CỔ PHẦN HUNONIC VIỆT NAM</h5>
                    <p>đăng nhập ơ đây</p>
                    <form action="">
                        <div class="input-group">
                            
                            <div class="input-group-append">
                                   
                                     <c:if test="${sessionScope.user == null}">
                                               
                                                 <button class="btn btn-primary"  href="LoginServlet">Sign Up</button>
                                            </c:if>
                                            <c:if test="${sessionScope.user != null}">
                                                
                                                <button class="btn btn-primary"  href="LogoultServlet"> Logout</button>
                                                
                                            </c:if>
                               
                            </div>
                        </div>
                    </form>
                    <h6 class="text-secondary text-uppercase mt-4 mb-3">Follow Us</h6>
                    <div class="d-flex">
                        <a class="btn btn-primary btn-square mr-2" href="#"><i class="fab fa-twitter"></i></a>
                        <a class="btn btn-primary btn-square mr-2" href="#"><i class="fab fa-facebook-f"></i></a>
                        <a class="btn btn-primary btn-square mr-2" href="#"><i class="fab fa-linkedin-in"></i></a>
                        <a class="btn btn-primary btn-square" href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row border-top mx-xl-5 py-4" style="border-color: rgba(256, 256, 256, .1) !important;">
        <div class="col-md-6 px-xl-0">
            <p class="mb-md-0 text-center text-md-left text-secondary">
                &copy; <a class="text-primary" href="#">Domain</a>.Mọi quyền được bảo lưu. Được thiết kế
                bởi
                <a class="text-primary" href="">AHK</a>
            </p>
        </div>
        <div class="col-md-6 px-xl-0 text-center text-md-right">
            <img class="img-fluid" src="img/payments.png" alt="">
        </div>
    </div>
</div>