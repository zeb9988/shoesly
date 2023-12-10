import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakerapp/common/loader.dart';
import 'package:sneakerapp/model/shoemodel.dart'; // Assuming you have a CartProvider class
import 'package:sneakerapp/provider/userprovider.dart';
import 'package:sneakerapp/view/screens/Homepage.dart';
import 'package:sneakerapp/view/screens/Rating.dart';
import 'package:sneakerapp/view/screens/cartscreen.dart';
import 'package:sneakerapp/view/widgets/sizeselect.dart';
import 'package:sneakerapp/view/widgets/star.dart';
import 'package:sneakerapp/view/widgets/topthreereview.dart';

String selectedSize = '';

class ProductDetail extends StatefulWidget {
  static const String id = '/productDetail';
  final Shoe product;
  const ProductDetail({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int quantity = 1;

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

  void addToCart(BuildContext context) {
    CartProvider cartProvider =
        Provider.of<CartProvider>(context, listen: false);
    cartProvider.setLoading(true);
    // Check if the selectedSize is not empty

    // CartItem cartItem = CartItem(product: widget.product, quantity: quantity);
    cartProvider.addToCart(widget.product, quantity);
    cartProvider.setLoading(false);
    // Simulate a delay to mimic an asynchronous operation (remove this in your actual implementation)

    // Close the bottom sheet after the delay
    Navigator.of(context).pop();
    // Reset the flag when the bottom sheet is closed

    // Show a new bottom sheet with a success message
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black, width: 3),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.check, color: Colors.black38, size: 48),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Added to cart',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, DiscoverPage.id);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      width: 150,
                      height: 60,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black45, width: 1),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Center(
                        child: Text(
                          'Back Explore',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, CartScreen.id);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      width: 150,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Center(
                        child: Text(
                          'TO CART',
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
              ),
            ],
          ),
        );
      },
    );

    // Reset quantity and totalPrice in the bottom sheet to their default values
    setState(() {
      quantity = 1;
      updateTotalPrice();
    });
  }

  void _showQuantityBottomSheet(BuildContext context) {
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
                        height: 35,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black),
                        ),
                        child: IconButton(
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
                      const SizedBox(width: 10),
                      Container(
                        height: 35,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black),
                        ),
                        child: IconButton(
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
                                ? Loader()
                                : Text(
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
              onTap: () => _showQuantityBottomSheet(context),
              child: Container(
                padding: const EdgeInsets.all(16.0),
                width: 150,
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Center(
                  child: Text(
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
                  Positioned(
                    bottom: 20,
                    right: 20,
                    child: Container(
                      width: 170,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            left: 10,
                            top: 8,
                            child: Container(
                              width: 25,
                              height: 25,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.red,
                              ),
                              child: const Icon(
                                Icons.check,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 50,
                            top: 8,
                            child: Container(
                              width: 25,
                              height: 25,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 90,
                            top: 8,
                            child: Container(
                              width: 25,
                              height: 25,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.green,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 130,
                            top: 8,
                            child: Container(
                              width: 25,
                              height: 25,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.yellow,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
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
                    const Text(
                      '(1045 Reviews)',
                      style: TextStyle(fontSize: 11.0, color: Colors.black45),
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
