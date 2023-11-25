import 'package:flutter/material.dart';
import 'package:shop_app/view/home_view.dart';
import 'package:shop_app/view/product_update_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomeView.id: (context) => const HomeView(),
        ProductUpdateView.id: (context) => ProductUpdateView(),
      },
      initialRoute: HomeView.id,
    );
  }
}
