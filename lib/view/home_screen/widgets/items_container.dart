import 'package:flutter/material.dart';

class ItemContainer extends StatelessWidget {
  const ItemContainer({
    super.key,
    required this.image,
  });
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(20)),
      height: 250,
      width: 250,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(alignment: Alignment(1, -1), children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.favorite_border,
                )),
          ),
        ]),
      ),
    );
  }
}
