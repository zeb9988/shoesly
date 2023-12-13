import 'package:flutter/material.dart';
import 'package:sneakerapp/model/shoemodel.dart';
import 'package:sneakerapp/view/screens/review_page.dart';
import 'package:sneakerapp/view/widgets/star.dart';

// ignore: camel_case_types
class allreview extends StatelessWidget {
  const allreview({
    super.key,
    required this.widget,
    required this.tabIndex,
    this.rating = 0.0,
  });

  final AllReviewsScreen widget;
  final int tabIndex;
  final double rating;

  @override
  Widget build(BuildContext context) {
    List<Review> filteredReviews = [];

    // Filter reviews based on the selected tab and rating
    if (tabIndex == 0) {
      // Show all reviews
      filteredReviews = List.from(widget.reviews);
    } else {
      // Show reviews with the specified rating
      filteredReviews =
          widget.reviews.where((review) => review.rating == rating).toList();
    }

    return ListView.builder(
      itemCount: filteredReviews.length,
      itemBuilder: (context, index) {
        Review review = filteredReviews[index];
        return Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/profile.png",
                      width: 40,
                      height: 40,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            review.userId,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Star(rating: review.rating),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            review.comment,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
