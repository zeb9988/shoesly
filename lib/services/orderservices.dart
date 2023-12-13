import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakerapp/provider/userprovider.dart';
import 'package:sneakerapp/view/screens/Discover_page.dart';

Future<void> placeOrder(BuildContext context) async {
  final cart = Provider.of<CartProvider>(context, listen: false);
  try {
    cart.setLoading(true); // Show loader

    // Simulate a delay for demonstration purposes (replace with your actual order logic)
    await Future.delayed(const Duration(seconds: 2));

    // Create a new order document in Firebase Firestore
    await FirebaseFirestore.instance.collection('orders').add({
      // Replace with your user identifier
      'items': cart.cart
          .map((item) => {
                'productId': item.product.id,
                'productBrand': item.product.brand,
                'productName': item.product.name,
                'quantity': item.quantity,
                'totalPrice': cart.calculateTotalPrice()
              })
          .toList(),
      'timestamp': FieldValue.serverTimestamp(),
      // Add more fields as needed
    });

    // Clear the cart after placing the order
    cart.clearCart();

    cart.setLoading(false); // Hide loader
    // ignore: use_build_context_synchronously
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Order Placed Successfully'),
          content: Text('Thank you for your order!'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  DiscoverPage.id,
                  (route) => false,
                );
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
    // Navigator.pushNamedAndRemoveUntil(
    //     context, DiscoverPage.id, (route) => false);
  } catch (e) {
    print("Error placing order: $e");

    // Show an error message to the user
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Error placing order: $e"),
        duration: const Duration(seconds: 3),
      ),
    );
    cart.setLoading(false); // Hide loader in case of an error
  }
}
