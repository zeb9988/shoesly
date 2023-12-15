import 'package:flutter/material.dart';
import 'package:sneakerapp/common/shoelist.dart';
import 'package:sneakerapp/model/shoemodel.dart';
import 'package:sneakerapp/view/screens/product_detail.dart';

class ShoeGrid extends StatefulWidget {
  final String? filterBrand;

  const ShoeGrid({super.key, this.filterBrand});

  @override
  // ignore: library_private_types_in_public_api
  _ShoeGridState createState() => _ShoeGridState();
}

class _ShoeGridState extends State<ShoeGrid> {
  final ScrollController _scrollController = ScrollController();
  // double totalRating = 0;
  double averageRating = 0;
  @override
  void initState() {
    // averageRating = calculateAverageRating();
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

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
  // double calculateAverageRating() {
  //   if (widget.filterBrand.reviews.isEmpty) {
  //     return 0.0;
  //   }

  //   for (Review review in widget.product.reviews) {
  //     totalRating += review.rating;
  //   }

  //   return totalRating / widget.product.reviews.length;
  // }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  List<Shoe> getFilteredShoes() {
    if (widget.filterBrand == null) {
      return dummyShoes;
    } else {
      return dummyShoes
          .where((shoe) =>
              shoe.brand.toLowerCase() == widget.filterBrand!.toLowerCase())
          .toList();
    }
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      // Reached the bottom of the list - fetch more data or implement pagination
      // For demonstration, we'll add more dummy data
      _loadMoreData();
    }
  }

  void _loadMoreData() {
    // Add more dummy shoes as needed
    setState(() {
      dummyShoes.addAll([
        Shoe(
          id: '8',
          name: 'Reebok Classic',
          brand: 'Reebok',
          price: 90.0,
          reviews: [
            Review(userId: 'user1', comment: 'Great shoe!', rating: 5.0),
            Review(userId: 'user2', comment: 'Comfortable fit.', rating: 4.5),
            Review(userId: 'user1', comment: 'Great shoe!', rating: 5.0),
            Review(userId: 'user2', comment: 'Comfortable fit.', rating: 4.5),
            Review(userId: 'user1', comment: 'Great shoe!', rating: 5.0),
            Review(userId: 'user2', comment: 'Comfortable fit.', rating: 4.5),
            Review(userId: 'user1', comment: 'Great shoe!', rating: 5.0),
            Review(userId: 'user2', comment: 'Comfortable fit.', rating: 4.5),
          ],
          averageRating: 4.0,
          imageUrl: 'assets/shoe3.png',
        ),
      ]);
    });
  }

  @override
  Widget build(BuildContext context) {
    final filteredShoes = getFilteredShoes();

    return GridView.builder(
      controller: _scrollController,
      physics: const AlwaysScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Two items per row
        crossAxisSpacing: 12, // Adjust the spacing as needed
        mainAxisExtent: 245, // Adjust the height as needed
      ),
      itemCount: filteredShoes.length + 1,
      itemBuilder: (context, index) {
        if (index < filteredShoes.length) {
          final shoe = filteredShoes[index];
          averageRating = calculateAverageRating(shoe);
          return InkWell(
            onTap: () =>
                Navigator.pushNamed(context, ProductDetail.id, arguments: shoe),
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
        } else {
          return const Padding(
            padding: EdgeInsets.all(16.0),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
