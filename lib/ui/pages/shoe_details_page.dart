import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shows_app/helpers/helpers.dart';
import 'package:shows_app/providers/shoes_provider.dart';
import 'package:shows_app/ui/widgets/widgets.dart';

class ShoeDetailsPage extends StatelessWidget {
  final double price;

  const ShoeDetailsPage({Key? key, required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    changeStatusLight();
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              const Hero(
                  tag: 'showPreview', child: ShoePreview(fullScreen: true)),
              Positioned(
                top: 60,
                child: FloatingActionButton(
                  onPressed: () {
                    changeStatusDark();
                    Navigator.pop(context);
                  },
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  highlightElevation: 0,
                  child: const Icon(
                    Icons.chevron_left_rounded,
                    size: 60,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  const ShoeDescription(
                    title: 'Nike Air Max 720',
                    description:
                        "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                  ),
                  _PriceAndBuy(price: price),
                  const _ColorSelector(),
                  const _MultiActionButtons()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PriceAndBuy extends StatelessWidget {
  final double price;

  const _PriceAndBuy({required this.price});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        margin: const EdgeInsets.only(top: 15, bottom: 20),
        child: Row(
          children: [
            Text(
              '\$$price',
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Bounce(
                delay: const Duration(milliseconds: 400),
                from: 15,
                child: const ActionButton(
                    height: 35, width: 130, text: 'Buy now')),
          ],
        ),
      ),
    );
  }
}

class _ColorSelector extends StatelessWidget {
  const _ColorSelector();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          Expanded(
              child: Stack(
            children: [
              Positioned(
                left: 90,
                child: _ColorSelectorButton(
                  color: Color(0xffc6d642),
                  index: 4,
                ),
              ),
              Positioned(
                left: 60,
                child: _ColorSelectorButton(
                  color: Color(0xff2099F1),
                  index: 3,
                ),
              ),
              Positioned(
                left: 30,
                child: _ColorSelectorButton(
                  color: Color(0xffFFAD29),
                  index: 2,
                ),
              ),
              _ColorSelectorButton(
                color: Color(0xff364D56),
                index: 1,
              ),
            ],
          )),
          // Spacer(),
          ActionButton(
            height: 25,
            width: 130,
            text: 'More related items',
            color: Color(0xffFFC675),
          ),
        ],
      ),
    );
  }
}

class _ColorSelectorButton extends StatelessWidget {
  final Color color;
  final int index;
  const _ColorSelectorButton({
    required this.color,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      delay: Duration(milliseconds: index * 100),
      duration: const Duration(milliseconds: 300),
      child: GestureDetector(
        onTap: () {
          final provider = Provider.of<ShoesProvider>(context, listen: false);
          provider.currentImage = index.toString();
        },
        child: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
      ),
    );
  }
}

class _MultiActionButtons extends StatelessWidget {
  const _MultiActionButtons();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30),
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _Button(
            icon: Icon(
              Icons.favorite,
              color: Colors.black26,
            ),
          ),
          _Button(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.black26,
            ),
          ),
          _Button(
            icon: Icon(
              Icons.settings,
              color: Colors.black26,
            ),
          ),
        ],
      ),
    );
  }
}

class _Button extends StatelessWidget {
  final Icon icon;
  const _Button({
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                color: Colors.black26,
                spreadRadius: -5,
                blurRadius: 20,
                offset: Offset(0, 7))
          ]),
      child: icon,
    );
  }
}
