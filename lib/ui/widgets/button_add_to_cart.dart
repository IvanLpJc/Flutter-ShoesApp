import 'package:flutter/material.dart';
import 'package:shows_app/ui/widgets/widgets.dart';

class ButtonAddToCart extends StatelessWidget {
  final double amount;

  const ButtonAddToCart({super.key, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 75,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.25),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            Text(
              '\$$amount',
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            const ActionButton(text: 'Add to cart'),
            const SizedBox(
              width: 20,
            )
          ],
        ),
      ),
    );
  }
}
