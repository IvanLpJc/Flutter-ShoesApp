import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shows_app/providers/shoes_provider.dart';
import 'package:shows_app/ui/pages/pages.dart';

// ignore: must_be_immutable
class ShoePreview extends StatelessWidget {
  final bool fullScreen;

  const ShoePreview({super.key, this.fullScreen = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!fullScreen) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const ShoeDetailsPage(price: 180.0)));
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: fullScreen ? 5 : 30, vertical: fullScreen ? 5 : 0),
        child: Container(
          width: double.infinity,
          height: fullScreen ? 400 : 430,
          decoration: BoxDecoration(
              color: const Color(0XffFFCF53),
              borderRadius: fullScreen
                  ? const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    )
                  : BorderRadius.circular(50)),
          child: Column(
            children: [
              const _ShadowedShoe(),
              if (!fullScreen) _SizeSelector(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ShadowedShoe extends StatelessWidget {
  const _ShadowedShoe();

  @override
  Widget build(BuildContext context) {
    final currentImage = Provider.of<ShoesProvider>(context).currentImage;
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Stack(
        children: [
          const Positioned(bottom: 20, right: 0, child: _Shadow()),
          Image(
            image: AssetImage(currentImage),
          ),
        ],
      ),
    );
  }
}

class _Shadow extends StatelessWidget {
  const _Shadow();

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.5,
      child: Container(
        width: 215,
        height: 110,
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(100),
            boxShadow: const [
              BoxShadow(
                  color: Color.fromARGB(255, 182, 122, 53), blurRadius: 40)
            ]),
      ),
    );
  }
}

class _SizeSelector extends StatelessWidget {
  final List<double> sizes = [7, 7.5, 8, 8.5, 9, 9.5];

  _SizeSelector();

  @override
  Widget build(BuildContext context) {
    final List<_SizeBox> sizeBoxes = [
      for (final (index, item) in sizes.indexed) _SizeBox(index, item)
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: sizeBoxes,
      ),
    );
  }
}

class _SizeBox extends StatelessWidget {
  final double size;
  final int index;

  const _SizeBox(
    this.index,
    this.size,
  );

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ShoesProvider>(context);
    return GestureDetector(
      onTap: () {
        provider.sizeSelected = index;
      },
      child: Container(
        width: provider.sizeSelected == index ? 45 : 40,
        height: provider.sizeSelected == index ? 45 : 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: provider.sizeSelected == index
              ? const Color.fromARGB(255, 255, 145, 0)
              : Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            if (provider.sizeSelected == index)
              const BoxShadow(
                  offset: Offset(0, 5),
                  color: Color.fromARGB(143, 99, 65, 27),
                  blurRadius: 15)
          ],
        ),
        child: Text(
          size.toString().replaceAll('.0', ''),
          style: TextStyle(
              color: provider.sizeSelected == index
                  ? Colors.white
                  : const Color(0xffF1A23A),
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
