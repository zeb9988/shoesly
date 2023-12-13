// import 'package:cloud_firestore/cloud_firestore.dart';

// class UserModel {
//   final String userId;
//   final Map<String, dynamic> cart;

//   UserModel({required this.userId, Map<String, dynamic>? cart})
//       : cart = cart ?? {}; // If cart is null, initialize it as an empty map

//   // Helper method to add items to the cart
//   void addToCart(String productId, int quantity) {
//     if (cart.containsKey(productId)) {
//       cart[productId] += quantity;
//     } else {
//       cart[productId] = quantity;
//     }
//   }
// }
// // Helper method to get the total quantity in the cart

// class CartService {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   // Future<void> addToCart(UserModel user, String productId, int quantity) async {
//   //   try {
//   //     // Update the user's cart
//   //     user.addToCart(productId, quantity);

//   //     // Save the updated cart to Firestore
//   //     await _firestore
//   //         .collection('users')
//   //         .doc(user.userId)
//   //         .set({'cart': user.cart}, SetOptions(merge: true));
//   //   } catch (error) {
//   //     print('Error adding to cart: $error');
//   //     // Handle the error as needed
//   //   }
//   // }

//   Future<UserModel?> getUser(String userId) async {
//     try {
//       // Retrieve the user data including the cart
//       DocumentSnapshot userSnapshot =
//           await _firestore.collection('users').doc(userId).get();

//       if (userSnapshot.exists) {
//         Map<String, dynamic> userData =
//             userSnapshot.data() as Map<String, dynamic>;
//         return UserModel(userId: userId, cart: userData['cart']);
//       } else {
//         return null; // User not found
//       }
//     } catch (error) {
//       print('Error getting user: $error');
//       // Handle the error as needed
//       return null;
//     }
//   }
// }
