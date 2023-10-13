import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shows_app/providers/shoes_provider.dart';
import 'package:shows_app/ui/pages/pages.dart';

void main() => runApp(ChangeNotifierProvider(
    create: (_) => ShoesProvider(), child: const MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Shoes App',
      debugShowCheckedModeBanner: false,
      // home: ShoeDetailsPage(price: 180.0),
      home: ShoesPage(),
    );
  }
}
