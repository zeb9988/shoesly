import 'package:flutter/material.dart';
import 'package:sneakerapp/model/shoemodel.dart';
import 'package:sneakerapp/view/widgets/allreview.dart';
import 'package:sneakerapp/view/widgets/customtab.dart';

class AllReviewsScreen extends StatefulWidget {
  static const String id = '/allrating';
  final List<Review> reviews;

  const AllReviewsScreen({super.key, required this.reviews});

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
