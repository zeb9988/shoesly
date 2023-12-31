// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:sneakerapp/model/shoemodel.dart';
import 'package:sneakerapp/view/screens/product_detail.dart';

class FilteredProductsScreen extends StatefulWidget {
  static const String id = '/FilteredScreen';
  final List<Shoe> filteredShoes;

  const FilteredProductsScreen({super.key, required this.filteredShoes});

  @override
  State<FilteredProductsScreen> createState() => _FilteredProductsScreenState();
}

class _FilteredProductsScreenState extends State<FilteredProductsScreen> {
  double averageRating = 0;
  double calculateAverageRating(Shoe shoe) {
    if (shoe.reviews.isEmpty) {
      return 0.0;
    }

    double totalRating = 0;

    for (Review review in shoe.reviews) {
      totalRating += review.rating;
    }

    return totalRating / shoe.reviews.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filtered Products'),
      ),
      body: GridView.builder(
        // controller: _scrollController,
        physics: const AlwaysScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Two items per row
          crossAxisSpacing: 12, // Adjust the spacing as needed
          mainAxisExtent: 245, // Adjust the height as needed
        ),
        itemCount: widget.filteredShoes.length + 1,
        itemBuilder: (context, index) {
          if (index < widget.filteredShoes.length) {
            final shoe = widget.filteredShoes[index];
            averageRating = calculateAverageRating(shoe);
            return InkWell(
              onTap: () => Navigator.pushNamed(context, ProductDetail.id,
                  arguments: shoe),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          shoe.imageUrl,
                          fit: BoxFit.cover,
                          height: 160,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          shoe.name,
                          style: const TextStyle(
                            fontSize: 12.0,
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 16.0,
                            ),
                            Text(
                              averageRating.toStringAsFixed(1),
                              style: const TextStyle(
                                  fontSize: 12.0, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            Text(
                              '(${shoe.reviews.length}) Reviews',
                              style: const TextStyle(
                                  fontSize: 11.0, color: Colors.black45),
                            ),
                          ],
                        ),
                        Text(
                          '\$${shoe.price.toStringAsFixed(2)}',
                          style: const TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          return null;
        },
      ),
    );
  }
}
