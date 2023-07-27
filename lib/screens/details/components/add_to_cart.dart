import 'package:alamal_center/provider/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '/models/Product.dart';

import '../../../constants.dart';

class AddToCart extends StatefulWidget {
  const AddToCart({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  int numOfItems = 1;
  @override
  Widget build(BuildContext context) {
    var app = Provider.of<AppProvider>(context);
    return Column(
      children: [
        Row(
          children: <Widget>[
            buildOutlineButton(
              icon: Icons.remove,
              press: () {
                if (numOfItems > 1) {
                  setState(() {
                    numOfItems--;
                  });
                }
              },
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: kDefaultPaddin / 2),
              child: Text(
                // if our item is less  then 10 then  it shows 01 02 like that
                numOfItems.toString(),
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            buildOutlineButton(
                icon: Icons.add,
                press: () {
                  setState(() {
                    numOfItems++;
                  });
                }),
          ],
        ),
        SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: kDefaultPaddin),
                height: 50,
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                      // color: product.color,
                      ),
                ),
                child: IconButton(
                  icon: SvgPicture.asset(
                    "assets/icons/add_to_cart.svg",
                    // color: product.color,
                  ),
                  onPressed: () {
                    app.add_item(widget.product.id, widget.product.name, widget.product.img, widget.product.price, numOfItems, context);
                  },
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 50,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      '',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  SizedBox buildOutlineButton(
      {required IconData icon, required VoidCallback press}) {
    return SizedBox(
      width: 40,
      height: 32,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          ),
        ),
        onPressed: press,
        child: Icon(icon),
      ),
    );
  }
}
