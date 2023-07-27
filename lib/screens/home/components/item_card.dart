import 'package:flutter/material.dart';
import '../../../constants.dart';

class ItemCard extends StatelessWidget {
  final VoidCallback press;
  const ItemCard({
    Key? key,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            // width: 110,
            padding: EdgeInsets.all(kDefaultPaddin),
            decoration: BoxDecoration(
              // color: product.color,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              children: [

              ],
            ),
          ),
        ],
      ),
    );
  }
}
