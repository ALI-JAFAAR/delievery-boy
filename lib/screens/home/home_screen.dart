import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../constants.dart';
import '../../utiles/draweritem.dart';
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
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 251, 248, 248),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: kPrimarycolor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'سنتر الساعه',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: kTextColor,
                            fontSize: 20.0,
                            
                          ),
                          
                        ),
                      ],
                    ),
                    Spacer(),
                  ],
                ),
              ),
              DrawerItemss(
                color: kPrimarycolor,
                title: "عن التطبيق",
                myIcon: FontAwesomeIcons.info,
                onTap: () {},
              ),
              DrawerItemss(
                color: kPrimarycolor,
                title: "من نحن",
                myIcon: FontAwesomeIcons.peopleGroup,
                onTap: () {},
              ),
            ],
          ),
        ),
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
