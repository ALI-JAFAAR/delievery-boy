import 'package:alamal_center/provider/app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';

// We need satefull widget for our categories

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    var app = Provider.of<AppProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: SizedBox(
        height: 35,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: app.catAcount,
          itemBuilder: (context, i) => GestureDetector(
            onTap: () {
              app.prod_by_cat(app.catA[i].id);
              setState(() {
                selectedIndex = i;
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    app.catA[i].name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: selectedIndex == i ? kTextColor : kTextLightColor,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: kDefaultPaddin / 4),
                    height: 2,
                    width: 30,
                    color:
                        selectedIndex == i ? Colors.black : Colors.transparent,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
