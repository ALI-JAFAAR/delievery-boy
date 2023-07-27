import '/provider/app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants.dart';
import '../cart/cart.dart';

import '../profile/profile.dart';
import 'components/main.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late int i;
  
  @override
  void initState() {
    super.initState();
    i = 0;
  }

  List screen = [MainScreen(), CartScreen(), ProfileScreen()];
  @override
  Widget build(BuildContext context) {
    var app = Provider.of<AppProvider>(context);
    app.slider();
    app.category_all();
    print("check login");
    app.check_login(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 247, 242, 242),
        body: screen[i],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: i,
          onTap: (value) {
            setState(() {
              i = value;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: kTextColor,
              ),
              activeIcon: Icon(
                Icons.home,
                color: kPrimarycolor,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart,
                color: kTextColor,
              ),
              activeIcon: Icon(
                Icons.shopping_cart,
                color: kPrimarycolor,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: kTextColor,
              ),
              activeIcon: Icon(
                Icons.person,
                color: kPrimarycolor,
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
