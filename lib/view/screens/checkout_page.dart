import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakerapp/common/loader.dart';
import 'package:sneakerapp/provider/userprovider.dart';
import 'package:sneakerapp/services/orderservices.dart';
import 'package:sneakerapp/view/widgets/order-summary-widget.dart';

class OrderSummaryPage extends StatelessWidget {
  static const String id = '/order-summary';
  const OrderSummaryPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Summary'),
        centerTitle: true,
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16.0),
        width: double.infinity,
        height: 90,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Grand Total",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "\$${(cartProvider.calculateTotalPrice() + 20.00).toStringAsFixed(2)}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () => placeOrder(context),
              child: Container(
                padding: const EdgeInsets.all(16.0),
                width: 150,
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(
                  child: cartProvider.isLoading
                      ? Loader()
                      : const Text(
                          'PAYMENT',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                ),
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Text(
                'Information',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 10),
            _buildInformationCard(),
            const SizedBox(height: 10),
            const Divider(
              color: Colors.black12,
            ),
            _buildLocationCard(),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Order Detail',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
            _buildOrderDetail(context),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Text(
                'Payment Detail',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16),
              child: Column(
                children: [
                  buildPaymentDetailRow(
                    "Sub Total",
                    "\$${cartProvider.calculateTotalPrice().toStringAsFixed(2)}",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  buildPaymentDetailRow("Shipping", "\$20.00"),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(
                    color: Colors.black38,
                    height: 2,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  buildPaymentDetailRow(
                    "Total Order",
                    "\$${(cartProvider.calculateTotalPrice() + 20.00).toStringAsFixed(2)}",
                  ),
                ],
              ),
            )
            // _buildPayment(),
          ],
        ),
      ),
    );
  }
}

Widget _buildInformationCard() {
  return const ListTile(
    title: Text(
      'Payment Method',
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w700,
      ),
    ),
    subtitle: Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Text(
        'Credit Card',
        style: TextStyle(
          fontSize: 12, color: Colors.black38,
          // fontWeight: FontWeight.w400,
        ),
      ),
    ),
    trailing: Icon(
      Icons.arrow_forward_ios,
      size: 15,
      color: Colors.black26,
    ),
  );
}

Widget _buildLocationCard() {
  return const ListTile(
    title: Text(
      'Location',
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w700,
      ),
    ),
    subtitle: Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Text(
        'Semarang, Indonesia',
        style: TextStyle(
          fontSize: 12, color: Colors.black38,
          // fontWeight: FontWeight.w400,
        ),
      ),
    ),
    trailing: Icon(
      Icons.arrow_forward_ios,
      size: 15,
      color: Colors.black26,
    ),
  );
}

Widget _buildOrderDetail(BuildContext context) {
  final cartProvider = Provider.of<CartProvider>(context);

  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: cartProvider.cart.map((cartItem) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cartItem.product.name, // Assuming 'name' is the product name
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      cartItem
                          .product.brand, // Adjust based on your product model
                      style:
                          const TextStyle(fontSize: 14, color: Colors.black38),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text(
                      'Red Grey', // Adjust based on your product model
                      style: TextStyle(fontSize: 14, color: Colors.black38),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text(
                      '40', // Adjust based on your product model
                      style: TextStyle(fontSize: 14, color: Colors.black38),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Qty: ${cartItem.quantity}',
                      style:
                          const TextStyle(fontSize: 14, color: Colors.black38),
                    ),
                  ],
                ),
                Text(
                  '\$${(cartItem.product.price * cartItem.quantity).toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0), // Add some spacing between items
          ],
        );
      }).toList(),
    ),
  );
}
