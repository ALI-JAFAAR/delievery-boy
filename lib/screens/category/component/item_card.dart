import '/provider/app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../utiles/button.dart';
import '/models/Product.dart';

import '../../../constants.dart';

class ItemCard extends StatelessWidget {
  // add product qty ...........

  final Product product;
  final VoidCallback press;
  const ItemCard({
    Key? key,
    required this.product,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var app = Provider.of<AppProvider>(context);
    return GestureDetector(
      onTap: press,
      child: Stack(
        children: [
          Container(
            width: 160,
            margin: const EdgeInsets.only(left: 5, right: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border:
                  Border.all(color: kPrimarycolor.withOpacity(0.5), width: 0.5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Hero(
                        tag: "${product.id}",
                        child: Image.network(
                          product.img,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: Text(
                          '${product.name}',
                          style: const TextStyle(
                            fontSize: 16,
                            color: kTextColor,
                          ),
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: Text(
                          '${product.price} دينار',
                          style: const TextStyle(
                            fontSize: 14,
                            color: kPrimarycolor,
                          ),
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                    ],
                  ),
                ),
                CoustemButton(
                  onTap: () {
                    var id = product.id;
                    var name = product.name;
                    app.add_item(
                        id, name, product.img, 1, product.price, context);
                  },
                  width: 0.4,
                  hight: 30,
                  border: 5,
                  title: 'اضف المنتج للسلة',
                  margen: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
