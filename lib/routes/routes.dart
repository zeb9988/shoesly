import 'package:flutter/material.dart';
import 'package:sneakerapp/model/shoemodel.dart';
import 'package:sneakerapp/view/screens/Discover_page.dart';
import 'package:sneakerapp/view/screens/FilteredScreen.dart';
import 'package:sneakerapp/view/screens/review_page.dart';
import 'package:sneakerapp/view/screens/cart_page.dart';
import 'package:sneakerapp/view/screens/filter_page.dart';
import 'package:sneakerapp/view/screens/checkout_page.dart';
import 'package:sneakerapp/view/screens/product_detail.dart';
import 'package:sneakerapp/view/screens/splash.dart';

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
        builder: (_) => const CartScreen(),
      );
    case SplashScreen.id:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const SplashScreen(),
      );

    case OrderSummaryPage.id:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const OrderSummaryPage(),
      );
    case Filter.id:
      // var shoes = routeSettings.arguments as List<Shoe>;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Filter(),
      );
    case FilteredProductsScreen.id:
      var shoes = routeSettings.arguments as List<Shoe>;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => FilteredProductsScreen(filteredShoes: shoes),
      );
    case DiscoverPage.id:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const DiscoverPage(),
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
