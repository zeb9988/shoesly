import 'package:flutter_test/flutter_test.dart';
import 'package:sneakerapp/model/shoemodel.dart';
import 'package:sneakerapp/provider/userprovider.dart';

void main() {
  group('CartProvider Tests', () {
    test('Adding item to cart should update the cart', () {
      CartProvider cartProvider = CartProvider();
      Shoe sampleShoe = Shoe(
        id: '1',
        name: 'Nike Air Max',
        brand: 'Nike',
        price: 120.0,
        reviews: [
          Review(userId: 'zeb', comment: 'Great shoe!', rating: 5.0),
          Review(userId: 'rax', comment: 'Comfortable fit.', rating: 4.5),
          Review(userId: 'shady', comment: 'best shoe!', rating: 3.0),
          Review(userId: 'rax', comment: 'Comfortable fit.', rating: 2.5),
          Review(userId: 'shady', comment: 'Great shoe!', rating: 1.0),
          Review(userId: 'rax', comment: 'Comfortable fit.', rating: 3.5),
          Review(userId: 'shady', comment: 'Great shoe!', rating: 4.0),
          Review(userId: 'shady', comment: 'Comfortable fit.', rating: 3.5),
        ],
        averageRating: 5.0,
        imageUrl: 'assets/shoe1.png',
      );

      expect(cartProvider.cart.length, 0);

      cartProvider.addToCart(sampleShoe, 2);

      expect(cartProvider.cart.length, 1);
      expect(cartProvider.cart[0].product, sampleShoe);
      expect(cartProvider.cart[0].quantity, 2);
    });

    test('Removing item from cart should update the cart', () {
      CartProvider cartProvider = CartProvider();
      Shoe sampleShoe = Shoe(
        id: '1',
        name: 'Nike Air Max',
        brand: 'Nike',
        price: 120.0,
        reviews: [
          Review(userId: 'zeb', comment: 'Great shoe!', rating: 5.0),
          Review(userId: 'rax', comment: 'Comfortable fit.', rating: 4.5),
          Review(userId: 'shady', comment: 'best shoe!', rating: 3.0),
          Review(userId: 'rax', comment: 'Comfortable fit.', rating: 2.5),
          Review(userId: 'shady', comment: 'Great shoe!', rating: 1.0),
          Review(userId: 'rax', comment: 'Comfortable fit.', rating: 3.5),
          Review(userId: 'shady', comment: 'Great shoe!', rating: 4.0),
          Review(userId: 'shady', comment: 'Comfortable fit.', rating: 3.5),
        ],
        averageRating: 5.0,
        imageUrl: 'assets/shoe1.png',
      );
      cartProvider.addToCart(sampleShoe, 2);

      expect(cartProvider.cart.length, 1);

      cartProvider.removeFromCart(0);

      expect(cartProvider.cart.length, 0);
    });

    test('Updating item quantity should reflect in the cart', () {
      CartProvider cartProvider = CartProvider();
      Shoe sampleShoe = Shoe(
        id: '1',
        name: 'Nike Air Max',
        brand: 'Nike',
        price: 120.0,
        reviews: [
          Review(userId: 'zeb', comment: 'Great shoe!', rating: 5.0),
          Review(userId: 'rax', comment: 'Comfortable fit.', rating: 4.5),
          Review(userId: 'shady', comment: 'best shoe!', rating: 3.0),
          Review(userId: 'rax', comment: 'Comfortable fit.', rating: 2.5),
          Review(userId: 'shady', comment: 'Great shoe!', rating: 1.0),
          Review(userId: 'rax', comment: 'Comfortable fit.', rating: 3.5),
          Review(userId: 'shady', comment: 'Great shoe!', rating: 4.0),
          Review(userId: 'shady', comment: 'Comfortable fit.', rating: 3.5),
        ],
        averageRating: 5.0,
        imageUrl: 'assets/shoe1.png',
      );
      cartProvider.addToCart(sampleShoe, 2);

      expect(cartProvider.cart[0].quantity, 2);

      cartProvider.updateQuantity(cartProvider.cart[0], 3);

      expect(cartProvider.cart[0].quantity, 3);
    });

    test('updateQuantity should update the quantity of an item in the cart',
        () {
      // Arrange
      CartProvider cartProvider = CartProvider();
      Shoe sampleShoe = Shoe(
        id: '1',
        name: 'Nike Air Max',
        brand: 'Nike',
        price: 120.0,
        reviews: [
          Review(userId: 'zeb', comment: 'Great shoe!', rating: 5.0),
          Review(userId: 'rax', comment: 'Comfortable fit.', rating: 4.5),
          Review(userId: 'shady', comment: 'best shoe!', rating: 3.0),
          Review(userId: 'rax', comment: 'Comfortable fit.', rating: 2.5),
          Review(userId: 'shady', comment: 'Great shoe!', rating: 1.0),
          Review(userId: 'rax', comment: 'Comfortable fit.', rating: 3.5),
          Review(userId: 'shady', comment: 'Great shoe!', rating: 4.0),
          Review(userId: 'shady', comment: 'Comfortable fit.', rating: 3.5),
        ],
        averageRating: 5.0,
        imageUrl: 'assets/shoe1.png',
      );

      // Act
      cartProvider.addToCart(sampleShoe, 2);
      cartProvider.updateQuantity(cartProvider.cart[0], 5);

      // Assert
      expect(cartProvider.cart[0].quantity, 5);
    });

    test('calculateTotalPrice should return the correct total price', () {
      // Arrange
      CartProvider cartProvider = CartProvider();
      Shoe sampleShoe = Shoe(
        id: '1',
        name: 'Nike Air Max',
        brand: 'Nike',
        price: 120.0,
        reviews: [
          Review(userId: 'zeb', comment: 'Great shoe!', rating: 5.0),
          Review(userId: 'rax', comment: 'Comfortable fit.', rating: 4.5),
          Review(userId: 'shady', comment: 'best shoe!', rating: 3.0),
          Review(userId: 'rax', comment: 'Comfortable fit.', rating: 2.5),
          Review(userId: 'shady', comment: 'Great shoe!', rating: 1.0),
          Review(userId: 'rax', comment: 'Comfortable fit.', rating: 3.5),
          Review(userId: 'shady', comment: 'Great shoe!', rating: 4.0),
          Review(userId: 'shady', comment: 'Comfortable fit.', rating: 3.5),
        ],
        averageRating: 5.0,
        imageUrl: 'assets/shoe1.png',
      );
      Shoe sampleShoe2 = Shoe(
        id: '1',
        name: 'Nike Air Max',
        brand: 'Nike',
        price: 120.0,
        reviews: [
          Review(userId: 'zeb', comment: 'Great shoe!', rating: 5.0),
          Review(userId: 'rax', comment: 'Comfortable fit.', rating: 4.5),
          Review(userId: 'shady', comment: 'best shoe!', rating: 3.0),
          Review(userId: 'rax', comment: 'Comfortable fit.', rating: 2.5),
          Review(userId: 'shady', comment: 'Great shoe!', rating: 1.0),
          Review(userId: 'rax', comment: 'Comfortable fit.', rating: 3.5),
          Review(userId: 'shady', comment: 'Great shoe!', rating: 4.0),
          Review(userId: 'shady', comment: 'Comfortable fit.', rating: 3.5),
        ],
        averageRating: 5.0,
        imageUrl: 'assets/shoe1.png',
      );

      // Act
      cartProvider.addToCart(sampleShoe, 2);
      cartProvider.addToCart(sampleShoe2, 3);

      // Assert
      expect(cartProvider.calculateTotalPrice(),
          (sampleShoe.price * 2) + (sampleShoe2.price * 3));
    });
  });
}
