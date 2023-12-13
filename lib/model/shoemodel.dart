class Review {
  final String userId;
  final String comment;
  final double rating;

  Review({
    required this.userId,
    required this.comment,
    required this.rating,
  });
}

class Shoe {
  final String id;
  final String name;
  final String brand;
  final double price;

  final List<Review> reviews; // Add a list of reviews
  final double averageRating;
  final String imageUrl;

  Shoe({
    required this.brand,
    required this.id,
    required this.name,
    required this.price,
    required this.reviews,
    required this.averageRating,
    required this.imageUrl,
  });
}

class Cart {
  List<CartItem> items = [];
}

class CartItem {
  final Shoe product;
  String size;
  int quantity;

  CartItem({required this.product, required this.size, required this.quantity});
}
