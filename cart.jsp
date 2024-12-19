<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        <%@include file="./inc/header.jsp" %>

        <!-- Cart Start -->
        <div class="container-fluid">
            <div class="row px-xl-5">
                <div class="col-lg-8 table-responsive mb-5">
                    <table class="table table-light table-borderless table-hover text-center mb-0">
                        <thead class="thead-dark">
                            <tr>
                                <th>Products</th>
                                <th>Price</th>
                                <th>Quantity</th>
                                <th>Total</th>
                                <th>Remove</th>
                            </tr>


                        </thead>
                        <c:forEach items="${cart}" var="orderItem">
                            <tbody class="align-middle">

                            <td class="align-middle"><img src="${orderItem.product.thumbnail}" alt="" style="width: 50px;">${orderItem.product.name}</td>
                            <td class="align-middle">$${orderItem.price}</td>
                            <td class="align-middle">
                                <div class="input-group quantity mx-auto" style="width: 100px;">
                                    <div class="input-group-btn">

                                    </div>
                                    <form action="CartServlet" method="post">
                                        <input type="hidden" name="action" value="update"/>
                                        <input type="hidden" name="productId" value="${orderItem.productId}"/>

                                        <input onchange="this.form.submit()" name="quantity" type="number" value="${orderItem.quantity}" min="1" class="form-control bg-secondary border-0 text-center" name="quantity" type="number"  value="${orderItem.quantity}" data-id="${orderItem.productId}">

                                    </form>
                                    <div class="input-group-btn">

                                    </div>
                                </div>
                            </td>

                            <td class="align-middle item-total" id="item-total-${orderItem.productId}">$${orderItem.price * orderItem.quantity}</td>
                            <td class="align-middle">

                                <form action="CartServlet" method="post">
                                    <input type="hidden" name="action" value="delete" />
                                    <input type="hidden" name="productId" value="${orderItem.productId}" />
                                    <button class="btn btn-sm btn-danger"><i class="fa fa-times"></i></button>
                                </form>

                            </td>

                            </tbody>
                        </c:forEach>
                    </table>

                </div>
                <div class="col-lg-4">
                    <form class="mb-30" action="">
                        <div class="input-group">
                            <input type="text" class="form-control border-0 p-4" placeholder="Coupon Code">
                            <div class="input-group-append">
                                <button class="btn btn-primary">Apply Coupon</button>
                            </div>
                        </div>
                    </form>
                    <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Cart Summary</span></h5>
                    <div class="bg-light p-30 mb-5">
                        <div class="border-bottom pb-2">
                            <div class="d-flex justify-content-between mb-3">
                                <h6>Subtotal</h6>
                                <h6 class="subtotal-value">$${total}</h6>
                            </div>
                            <div class="d-flex justify-content-between">
                                <h6 class="font-weight-medium">Shipping</h6>
                                <h6 class="font-weight-medium">Free</h6>
                            </div>
                        </div>
                        <div class="pt-2">
                            <div class="d-flex justify-content-between mt-2">
                                <h5>Total</h5>
                                <h5 id="cart-total">$${total}</h5>
                            </div>

                            <a href="CheckoutServlet"  class="btn btn-block btn-primary font-weight-bold my-3 py-3">Proceed to checkout</a>
                            <!-- QR Code Section -->
                            <div class="qr-code" style="margin-top: 20px;">
                                <!-- Set QR Code URL with the total amount -->
                                <c:set var="qrCodeUrl" value="Total Amount: ${total}" />

                                <!-- QR Code Image -->
                                <img src="https://api.qrserver.com/v1/create-qr-code/?data=${qrCodeUrl}&size=200x200" alt="QR Code for Cart Total" class="img-qr" />

                                <span class="tooltip">Scan to pay: ${total}</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Cart End -->


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