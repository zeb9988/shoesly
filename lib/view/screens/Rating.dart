import 'package:flutter/material.dart';
import 'package:sneakerapp/model/shoemodel.dart';
import 'package:sneakerapp/view/screens/Homepage.dart';
import 'package:sneakerapp/view/widgets/star.dart';

class AllReviewsScreen extends StatefulWidget {
  static const String id = '/allrating';
  final List<Review> reviews;

  AllReviewsScreen({required this.reviews});

  @override
  State<AllReviewsScreen> createState() => _AllReviewsScreenState();
}

class _AllReviewsScreenState extends State<AllReviewsScreen>
    with SingleTickerProviderStateMixin {
  double? averageRating;
  late TabController _tabController;

  @override
  void initState() {
    averageRating = calculateAverageRating();
    _tabController = TabController(length: 6, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  double calculateAverageRating() {
    if (widget.reviews.isEmpty) {
      return 0.0;
    }

    double totalRating = 0.0;
    for (Review review in widget.reviews) {
      totalRating += review.rating;
    }

    return totalRating / widget.reviews.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF3F3F3),
      appBar: AppBar(
        title: Text('Review (${widget.reviews.length})'),
        centerTitle: true,
        actions: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.star,
              color: Colors.yellow,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '$averageRating',
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 50,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          CustomTab(
                            text: 'All',
                            index: 0,
                            tabController: _tabController,
                          ),
                          CustomTab(
                            text: '5 Star',
                            index: 1,
                            tabController: _tabController,
                          ),
                          CustomTab(
                            text: '4 Star',
                            index: 2,
                            tabController: _tabController,
                          ),
                          CustomTab(
                            text: '3 Star',
                            index: 3,
                            tabController: _tabController,
                          ),
                          CustomTab(
                            text: '2 Star',
                            index: 4,
                            tabController: _tabController,
                          ),
                          CustomTab(
                            text: '1 Star',
                            index: 5,
                            tabController: _tabController,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: TabBarView(
                controller: _tabController,
                children: [
                  allreview(widget: widget, tabIndex: 0),
                  allreview(widget: widget, tabIndex: 5, rating: 5.0),
                  allreview(widget: widget, tabIndex: 4, rating: 4.0),
                  allreview(widget: widget, tabIndex: 3, rating: 3.0),
                  allreview(widget: widget, tabIndex: 2, rating: 2.0),
                  allreview(widget: widget, tabIndex: 1, rating: 1.0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Onestar extends StatelessWidget {
  const Onestar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Twostar extends StatelessWidget {
  const Twostar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Threestar extends StatelessWidget {
  const Threestar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Fourstar extends StatelessWidget {
  const Fourstar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Fivestar extends StatelessWidget {
  const Fivestar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

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
                            "${review.userId}",
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
