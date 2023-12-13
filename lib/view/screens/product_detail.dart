import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakerapp/common/loader.dart';
import 'package:sneakerapp/model/shoemodel.dart'; // Assuming you have a CartProvider class
import 'package:sneakerapp/provider/userprovider.dart';
import 'package:sneakerapp/view/screens/review_page.dart';
import 'package:sneakerapp/view/screens/cart_page.dart';
import 'package:sneakerapp/view/widgets/bottomsheet.dart';
import 'package:sneakerapp/view/widgets/color_selection.dart';
import 'package:sneakerapp/view/widgets/sizeselect.dart';
import 'package:sneakerapp/view/widgets/star.dart';
import 'package:sneakerapp/view/widgets/topthreereview.dart';

class ProductDetail extends StatefulWidget {
  static const String id = '/productDetail';
  final Shoe product;
  const ProductDetail({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int quantity = 1;
  String selectedSize = '';
  double totalPrice = 0.0;

  @override
  void initState() {
    super.initState();
    updateTotalPrice();
  }

  void updateTotalPrice() {
    setState(() {
      totalPrice = widget.product.price * quantity;
    });
  }

  void addToCart(BuildContext context) async {
    CartProvider cartProvider =
        Provider.of<CartProvider>(context, listen: false);
    try {
      cartProvider.setLoading(true);
      // Check if the selectedSize is not empty

      // CartItem cartItem = CartItem(product: widget.product, quantity: quantity);
      cartProvider.addToCart(widget.product, quantity, selectedSize);

      // await Future.delayed(const Duration(seconds: 2));

      cartProvider.setLoading(false);
      // Simulate a delay to mimic an asynchronous operation (remove this in your actual implementation)

      // Close the bottom sheet after the delay
      // ignore: use_build_context_synchronously
      Navigator.of(context).pop();
      // Reset the flag when the bottom sheet is closed

      // Show a new bottom sheet with a success message
      // ignore: use_build_context_synchronously
      botomsheet(context);

      // Reset quantity and totalPrice in the bottom sheet to their default values
      setState(() {
        quantity = 1;
        updateTotalPrice();
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error Adding to Cart: $e"),
          duration: const Duration(seconds: 3),
        ),
      );
      cartProvider.setLoading(false);
      // print(e.toString());
    }
  }

  void _showQuantityBottomSheet(BuildContext context) async {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              padding: const EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Add to cart',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Quantity',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        quantity.toString(),
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Expanded(child: Container()),
                      Container(
                        height: 25,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black),
                        ),
                        child: IconButton(
                          padding: const EdgeInsets.all(0),
                          onPressed: () {
                            setState(() {
                              if (quantity > 1) {
                                quantity--;
                                updateTotalPrice();
                              }
                            });
                          },
                          icon: const Icon(
                            Icons.remove,
                            size: 18,
                          ),
                        ),
                      ),
                      // const SizedBox(width: 5),
                      Container(
                        height: 25,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black),
                        ),
                        child: IconButton(
                          padding: const EdgeInsets.all(0),
                          onPressed: () {
                            setState(() {
                              quantity++;
                              updateTotalPrice();
                            });
                          },
                          icon: const Icon(
                            Icons.add,
                            size: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Divider(
                    color: Colors.black,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Column(
                        children: [
                          const Text(
                            'Total price',
                            style:
                                TextStyle(fontSize: 11, color: Colors.black45),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            '\$${totalPrice.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Expanded(child: Container()),
                      InkWell(
                        onTap: () {
                          addToCart(context);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(16.0),
                          width: 150,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Center(
                            child: cartProvider.isLoading
                                ? const Loader()
                                : const Text(
                                    'ADD TO CART',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: const Color(0xffF3F3F3),
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GestureDetector(
              onTap: () => Navigator.pushNamed(context, CartScreen.id),
              child: Image.asset('assets/cart.png'),
            ),
          )
        ],
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
                  "Price",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  '\$${widget.product.price.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: () {
                if (selectedSize.isEmpty) {
                  // Display a dialog box if size is not selected
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Select Size'),
                        content: const Text(
                            'Please select a size before adding to cart.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                  return; // Exit the function if size is not selected
                }
                _showQuantityBottomSheet(context);
              },
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
                      ? const Loader()
                      : const Text(
                          'ADD TO CART',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                ),
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      widget.product.imageUrl,
                      height: 400,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const color_selection(),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.product.name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Star(rating: widget.product.averageRating),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      '${widget.product.averageRating}',
                      style: const TextStyle(
                          fontSize: 12.0, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Text(
                      '(${widget.product.reviews.length.toString()})',
                      style: const TextStyle(
                          fontSize: 11.0, color: Colors.black45),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Size",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    )),
              ),
              SizeSelectionRow(
                selectedSize: selectedSize,
                onSizeSelected: (size) {
                  setState(() {
                    selectedSize = size;
                  });
                },
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Description",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    )),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                    "Engineered to crush any movement-based workout, these On sneakers enhance the label's original Cloud sneaker with cutting edge technologies for a pair. ",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Review (${widget.product.reviews.length})",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              TopThreeReviewsWidget(reviews: widget.product.reviews),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, AllReviewsScreen.id,
                      arguments: widget.product.reviews);
                },
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  width: double.infinity,
                  height: 70,
                  decoration: BoxDecoration(
                      // color: Colors.black,
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Colors.black45, width: 1)),
                  child: const Center(
                    child: Text(
                      'SEE ALL REVIEW',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
