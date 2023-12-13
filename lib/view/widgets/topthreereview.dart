import 'package:flutter/material.dart';
import 'package:sneakerapp/model/shoemodel.dart';
import 'package:sneakerapp/view/widgets/star.dart';

class TopThreeReviewsWidget extends StatelessWidget {
  final List<Review> reviews;

  const TopThreeReviewsWidget({super.key, required this.reviews});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (Review review in getTopThreeReviews())
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
                    Text(
                      review.userId,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
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
    );
  }

  List<Review> getTopThreeReviews() {
    // Sort the reviews by rating in descending order
    reviews.sort((a, b) => b.rating.compareTo(a.rating));

    // Take the top three reviews or all reviews if there are fewer than three
    return reviews.take(3).toList();
  }
}
