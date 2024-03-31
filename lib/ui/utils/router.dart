import 'package:flutter/material.dart';
import 'package:fudge_financial_app/ui/screens/home_screen.dart';
import 'package:fudge_financial_app/ui/screens/transactions_screen.dart';
import 'package:fudge_financial_app/ui/utils/constants.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case transactionRoute:
        return MaterialPageRoute(builder: (_) => const TransactionScreen());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
