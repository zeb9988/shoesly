import 'package:flutter/material.dart';
import 'package:sneakerapp/view/screens/Discover_page.dart';
import 'package:sneakerapp/view/screens/cart_page.dart';

Future<dynamic> botomsheet(BuildContext context) {
  return showModalBottomSheet(
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
}
