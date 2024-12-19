<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>MultiShop - Online Shop Website Template</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free HTML Templates" name="keywords">
        <meta content="Free HTML Templates" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">  

        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/animate/animate.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
    </head>

    <body>
        <!-- Topbar Start -->
        <%@include file="./inc/header.jsp" %>

        <!-- Topbar End -->


        <!-- Navbar Start -->

        <!-- Navbar End -->


        <!-- Breadcrumb Start -->
        <div class="container-fluid">
            <div class="row px-xl-5">
                <div class="col-12">
                    <nav class="breadcrumb bg-light mb-30">
                        <a class="breadcrumb-item text-dark" href="#">Home</a>
                        <a class="breadcrumb-item text-dark" href="#">Shop</a>
                        <span class="breadcrumb-item active">${product.name}</span>
                    </nav>
                </div>
            </div>
        </div>
        <!-- Breadcrumb End -->


        <!-- Shop Detail Start -->

        <div class="container-fluid pb-5">
            <form action="CartServlet" method="post" class="single-pro-details">
                <input type="hidden" name="action" value="create"/>
                <input type="hidden" name="productId" value="${product.id}"/>
                <input type="hidden" name="price" value="${product.price}"/>

                <div class="row px-xl-5">
                    <div class="col-lg-5 mb-30">
                        <div id="product-carousel" class="carousel slide" data-ride="carousel">
                            <div class="carousel-item active">
                                <img src="${product.thumbnail}" class="w-100 h-100"  alt="Image">
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-7 h-auto mb-30">
                        <div class="h-100 bg-light p-30">
                            <h3>${product.name}</h3>
                            <div class="d-flex mb-3">
                                <div class="text-primary mr-2">
                                    <small class="fas fa-star"></small>
                                    <small class="fas fa-star"></small>
                                    <small class="fas fa-star"></small>
                                    <small class="fas fa-star-half-alt"></small>
                                    <small class="far fa-star"></small>
                                </div>
                                <small class="pt-1">(99 Reviews)</small>
                            </div>
                            <h3 class="font-weight-semi-bold mb-4">${product.price}VND</h3>
                            <p class="mb-4">${product.description}</p>
                            <div class="qr-code" style="margin-top: 50px;">
                                <c:set var="thumbnailUrl" value="${product.thumbnail}" />
                                <c:set var="nameUrl" value="${product.name}" />
                                <c:set var="priceUrl" value="${product.price}" />


                                <c:set var="qrCodeUrl" value="${thumbnailUrl} ${nameUrl} ${priceUrl}" />


                                <!-- QR Code Image -->
                                <img src="https://api.qrserver.com/v1/create-qr-code/?data=${qrCodeUrl}&size=140x140" alt="QR Code for ${product.name}" class="img-qr" />

                                <span class="tooltip">Scan for details</span>
                            </div>
                            <div class="d-flex align-items-center mb-4 pt-2">
                                <div class="input-group quantity mr-3" style="width: 130px;">

                                    <input  class="form-control bg-secondary border-0 text-center" name="quantity" type="number" value="1">


                                </div>
                                <button class="btn btn-primary px-3">
                                    <i class="fa fa-shopping-cart mr-1"></i> Add To Cart</button>
                                </form>

                            </div>
                            <div class="d-flex pt-2">
                                <strong class="text-dark mr-2">Share on:</strong>
                                <div class="d-inline-flex">
                                    <a class="text-dark px-2" href="">
                                        <i class="fab fa-facebook-f"></i>
                                    </a>
                                    <a class="text-dark px-2" href="">
                                        <i class="fab fa-twitter"></i>
                                    </a>
                                    <a class="text-dark px-2" href="">
                                        <i class="fab fa-linkedin-in"></i>
                                    </a>
                                    <a class="text-dark px-2" href="">
                                        <i class="fab fa-pinterest"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

        </div>
        <!-- Shop Detail End -->

        <section id="product1" class="section-p1">
            <!-- Products Start -->
            <div class="container-fluid py-5">
                <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3">You May Also Like</span></h2>
                <div class="row px-xl-5">
                    <div class="col">

                        <div class="owl-carousel related-carousel">
                            <c:forEach items="${newsProductList}" var="product">
                                <div class="product-item bg-light">
                                    <div class="product-img position-relative overflow-hidden">
                                        <img class="img-fluid w-100" src="${product.thumbnail}" alt="">
                                        <div class="product-action">
                                           
                                            <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-sync-alt"></i></a>
                                            <a class="btn btn-outline-dark btn-square" href="ProductServlet?productId=${product.id}"><i class="fa fa-search"></i></a>
                                        </div>
                                    </div>

                                    <div class="text-center py-4">
                                        <a class="h6 text-decoration-none text-truncate" href="ProductServlet?productId=${product.id}">${product.name}</a>
                                        <div class="d-flex align-items-center justify-content-center mt-2">
                                            <h5>$${product.price}</h5><h6 class="text-muted ml-2"><del>$${product.price}</del></h6>
                                        </div>
                                        <div class="d-flex align-items-center justify-content-center mb-1">
                                            <small class="fa fa-star text-primary mr-1"></small>
                                            <small class="fa fa-star text-primary mr-1"></small>
                                            <small class="fa fa-star text-primary mr-1"></small>
                                            <small class="fa fa-star text-primary mr-1"></small>
                                            <small class="fa fa-star text-primary mr-1"></small>
                                            <small>(99)</small>
                                        </div>
                                    </div>

                                </div>

                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Products End -->


        <!-- Footer Start -->
        <%@include file="./inc/footer.jsp" %>

        <!-- Footer End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>


        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>

        <!-- Contact Javascript File -->
        <script src="mail/jqBootstrapValidation.min.js"></script>
        <script src="mail/contact.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
    </body>

</html>