$(document).ready(function () {
    // Lắng nghe sự thay đổi trên ô nhập số lượng
    $("input[name='quantity']").on('change', function () {
        var quantity = $(this).val(); // Số lượng mới
        var productId = $(this).data('id'); // ID sản phẩm

        // Cập nhật giá trị tổng
        var price = $(this).closest("tr").find(".item-total");
        var productPrice = $(this).closest("tr").find("td:nth-child(2)").text().replace('$', '');
        var totalPrice = (price * quantity).toFixed(2);

        $(price).text('$' + totalPrice);

        // Gửi yêu cầu cập nhật qua AJAX
        $.ajax({
            url: "CartServlet",
            method: "POST",
            data: {
                action: "update",
                productId: productId,
                quantity: quantity
            },
            success: function (response) {
                // Cập nhật lại tổng giỏ hàng nếu cần
                var updatedTotal = response.newTotal;  // Giả sử bạn trả lại tổng giỏ hàng mới từ server
                $("#cart-total").text("$" + updatedTotal);
            },
            error: function (error) {
                console.log("Error updating cart item:", error);
            }
        });
    });
});
document.addEventListener('DOMContentLoaded', function () {
    const quantityInputs = document.querySelectorAll('input[name="quantity"]');

    // Lắng nghe sự kiện thay đổi số lượng
    quantityInputs.forEach(input => {
        input.addEventListener('change', function () {
            updateTotal(input);
        });
    });

    // Chặn hành vi mặc định của các nút bấm trong giỏ hàng
    const buttons = document.querySelectorAll('button');
    buttons.forEach(button => {
        button.addEventListener('click', function (event) {
            if (button.type === 'submit') {
                event.preventDefault(); // Ngăn tải lại trang
            }
        });
    });
});

function updateTotal(inputElement) {
    const productId = inputElement.getAttribute('data-id');
    const newQuantity = parseInt(inputElement.value);

    // Nếu số lượng không hợp lệ, đặt mặc định là 1
    if (isNaN(newQuantity) || newQuantity <= 0) {
        inputElement.value = 1;
    }

    const priceElement = inputElement.closest('tr').querySelector('td:nth-child(2)');
    const totalElement = document.getElementById('item-total-' + productId);

    const price = parseFloat(priceElement.textContent.replace('$', ''));
    const total = price * inputElement.value;

    totalElement.textContent = `$${total.toFixed(2)}`;

    // Cập nhật tổng giỏ hàng
    updateCartTotal();
}

function updateCartTotal() {
    let total = 0;

    const itemTotals = document.querySelectorAll('.item-total');
    itemTotals.forEach(item => {
        const itemTotal = parseFloat(item.textContent.replace('$', ''));
        if (!isNaN(itemTotal)) {
            total += itemTotal;
        }
    });

    const cartTotalElement = document.getElementById('cart-total');
    cartTotalElement.textContent = `$${total.toFixed(2)}`;


}
$(document).ready(function () {
    // Lắng nghe sự thay đổi số lượng
    $("input[name='quantity']").on("change", function () {
        let quantity = $(this).val();
        let productId = $(this).data("id");
        let row = $(this).closest("tr");
        let price = parseFloat(row.find("td:nth-child(2)").text().replace("$", ""));
        let itemTotal = price * quantity;

        // Cập nhật hiển thị item-total
        row.find(".item-total").text(`$${itemTotal.toFixed(2)}`);

        // Gửi yêu cầu AJAX cập nhật giỏ hàng
        $.ajax({
            url: "CartServlet",
            method: "POST",
            data: {
                action: "update",
                productId: productId,
                quantity: quantity
            },
            success: function (response) {
                // Cập nhật Subtotal và Total từ server
                $("#cart-total").text(`$${response.newTotal}`);
                $(".subtotal-value").text(`$${response.newTotal}`);
            },
            error: function (error) {
                console.error("Error updating cart:", error);
            }
        });
    });
});
