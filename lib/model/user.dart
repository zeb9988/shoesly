class User {
  final String userId;
  final Map<String, dynamic> cart;

  User({required this.userId, Map<String, dynamic>? cart})
      : cart = cart ?? {}; // If cart is null, initialize it as an empty map
}
