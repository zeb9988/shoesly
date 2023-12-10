// import 'package:matcher/expect.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakerapp/model/shoemodel.dart';
import 'package:sneakerapp/provider/userprovider.dart';

Widget buildCartItem(BuildContext context, CartItem cartItem) {
  return ListTile(
    leading: Image.asset(
      cartItem.product.imageUrl,
      width: 60,
      height: 80,
      fit: BoxFit.cover,
    ),
    title: Text(
      cartItem.product.name,
      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
    ),
    subtitle: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Text(
              cartItem.product.brand,
              style: const TextStyle(
                fontSize: 11,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Red Grey .',
              style: const TextStyle(
                fontSize: 11,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              '40',
              style: const TextStyle(
                fontSize: 11,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Text(
              '\$${cartItem.product.price.toStringAsFixed(2)}',
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
            Expanded(child: Container()),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black38, width: 2),
                  ),
                  child: IconButton(
                    onPressed: () {
                      Provider.of<CartProvider>(context, listen: false)
                          .updateQuantity(cartItem, cartItem.quantity - 1);
                    },
                    icon: const Icon(
                      Icons.remove,
                      size: 18,
                    ),
                  ),
                ),
                Text(cartItem.quantity.toString()), // This should update now
                Container(
                  height: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                  child: IconButton(
                    onPressed: () {
                      Provider.of<CartProvider>(context, listen: false)
                          .updateQuantity(cartItem, cartItem.quantity + 1);
                    },
                    icon: const Icon(
                      Icons.add,
                      size: 18,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}
