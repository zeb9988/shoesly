import 'package:flutter/material.dart';
import 'package:sneakerapp/model/shoemodel.dart';
import 'package:sneakerapp/view/screens/Homepage.dart';
import 'package:sneakerapp/view/screens/Rating.dart';
import 'package:sneakerapp/view/screens/cartscreen.dart';
import 'package:sneakerapp/view/screens/filter.dart';
import 'package:sneakerapp/view/screens/order-summary.dart';
import 'package:sneakerapp/view/screens/productdetail.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    // case SplashScreen.id:
    //   return MaterialPageRoute(
    //     settings: routeSettings,
    //     builder: (_) => SplashScreen(),
    //   );
    case ProductDetail.id:
      var prod = routeSettings.arguments as Shoe;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => ProductDetail(
          product: prod,
        ),
      );
    case CartScreen.id:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => CartScreen(),
      );

    case OrderSummaryPage.id:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => OrderSummaryPage(),
      );
    case Filter.id:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => Filter(),
      );
    case DiscoverPage.id:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => DiscoverPage(),
      );
    case AllReviewsScreen.id:
      var reviews = routeSettings.arguments as List<Review>;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => AllReviewsScreen(reviews: reviews),
      );
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Screen does not exist!'),
          ),
        ),
      );
  }
}
