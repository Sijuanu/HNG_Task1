import "package:flutter/material.dart";
import "package:shopping_app/pages/home.dart";
import "package:shopping_app/pages/welcome.dart";

void main() => runApp(const ShoppingApp());

class ShoppingApp extends StatelessWidget {
  const ShoppingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          debugShowCheckedModeBanner: false,
          home:WelcomeScreen()
    );
  }
}
