import 'package:flutter/foundation.dart';
import 'package:sneakerapp/model/shoemodel.dart';

class CartProvider extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get cart => _items;

  void addToCart(Shoe product, int quantity, String size) {
    // Check if the item is already in the cart
    int index = _items.indexWhere((item) => item.product == product);

    if (index != -1) {
      // If the item is already in the cart, update the quantity
      _items[index].quantity += quantity;
    } else {
      // If the item is not in the cart, add a new CartItem
      _items.add(CartItem(product: product, quantity: quantity, size: size));
    }

    // Notify listeners to update the UI
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }

  // void decreaseQuantity(int index) {
  //   if (_items[index].quantity > 1) {
  //     _items[index].quantity--;
  //     notifyListeners();
  //   }
  // }

  void removeFromCart(int index) {
    _items.removeAt(index);

    // Notify listeners of the change
    notifyListeners();
  }

  void updateQuantity(CartItem cartItem, int newQuantity) {
    if (newQuantity > 0) {
      cartItem.quantity = newQuantity;
      notifyListeners();
    }
  }

  // void increaseQuantity(int index) {
  //   _items[index].quantity++;
  //   notifyListeners();
  // }

  double calculateTotalPrice() {
    double total = 0.0;
    for (CartItem item in _items) {
      total += item.product.price * item.quantity;
    }
    return total;
  }

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
