import 'package:flutter/material.dart';
import 'package:shows_app/ui/widgets/widgets.dart';

class ShoesPage extends StatelessWidget {
  const ShoesPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          CustomAppBar(text: 'For you'),
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Hero(tag: 'showPreview', child: ShoePreview()),
                  ShoeDescription(
                    title: 'Nike Air Max 720',
                    description:
                        "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                  ),
                ],
              ),
            ),
          ),
          ButtonAddToCart(amount: 180.0),
        ],
      ),
    );
  }
}
