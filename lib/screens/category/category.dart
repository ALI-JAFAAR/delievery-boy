import 'package:alamal_center/provider/app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/constants.dart';
import '/screens/details/details_screen.dart';

import 'component/categorries.dart';
import 'component/item_card.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var app = Provider.of<AppProvider>(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimarycolor,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              Categories(),
              
              app.prodwa==false? Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
                  child: GridView.builder(
                      itemCount: app.prodC,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: kDefaultPaddin,
                        crossAxisSpacing: kDefaultPaddin,
                        childAspectRatio: 0.75,
                      ),
                      itemBuilder: (context, i) => ItemCard(
                            product: app.prods[i],
                            press: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailsScreen(
                                    product: app.prods[i],
                                  ),
                                )),
                          )),
                ),
              ):Text(''),
            ],
          ),
        ),
      ),
    );
  }
}
