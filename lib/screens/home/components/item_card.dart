import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../models/cat.dart';

class ItemCard extends StatelessWidget {
  final Cats product;
  final VoidCallback press;
  const ItemCard({
    Key? key,
    required this.product,
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
                Hero(
                  tag: "${product.id}",
                  child: CachedNetworkImage(
                    imageUrl: product.img,
                    fit: BoxFit.fill,
                    width: MediaQuery.of(context).size.width,
                    placeholder: (context, url) => Image.asset(
                      'assets/images/logo.png',
                      fit: BoxFit.cover,
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                Text(
                  product.name,
                  style: TextStyle(color: kTextLightColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
