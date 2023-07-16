import '/screens/category/category.dart';
import 'package:flutter/material.dart';
// import '../../../constants.dart';
import '../../../models/Product.dart';
import 'slider.dart';
import 'item_card.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate([
            Container(
              color: const Color.fromARGB(255, 249, 245, 245),
              margin: EdgeInsets.only(top: 190),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 5,
                  ),
                  SliderWidget(),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ]),
        ),
        SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 30,
              childAspectRatio: 0.5,
              mainAxisExtent: 150),
          delegate: SliverChildBuilderDelegate(
            (context, index) => ItemCard(
              product: products[index],
              press: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryScreen(),
                ),
              ),
            ),
            childCount: products.length,
          ),
        ),
      ],
    );
  }
}
