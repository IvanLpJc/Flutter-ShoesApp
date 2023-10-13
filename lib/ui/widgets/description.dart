import 'package:flutter/material.dart';

class ShoeDescription extends StatelessWidget {
  final String title;
  final String description;

  const ShoeDescription(
      {super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style:
                  const TextStyle(fontSize: 30, fontWeight: FontWeight.w700)),
          const SizedBox(
            height: 20,
          ),
          Text(description,
              // maxLines: 3,
              // overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black54,
                  height: 1.6)),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
