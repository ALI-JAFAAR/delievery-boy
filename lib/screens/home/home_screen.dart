import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../constants.dart';
import 'components/body.dart';

import '../profile/profile.dart';
import 'components/location.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = 0;
  }

  List screen = [Body(), ProfileScreen()];
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 251, 248, 248),
        drawer: Drawer(),
        body: Stack(
          clipBehavior: Clip.none,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Body(),
            ),
            SizedBox(
              height: 150,
              child: AppBar(
                elevation: 0,
                backgroundColor: Theme.of(context).primaryColor,
                title: Text(
                  "سنتر الساعة",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                centerTitle: true,
                actions: <Widget>[
                  IconButton(
                    icon: SvgPicture.asset(
                      "assets/icons/search.svg",
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                  const SizedBox(width: kDefaultPaddin / 2)
                ],
              ),
            ),
            Positioned(
              top: 110,
              left: 20,
              width: MediaQuery.of(context).size.width * 0.92,
              child: LocationCard(),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
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
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_cart,
                  color: kTextColor,
                ),
                activeIcon: Icon(
                  Icons.shopping_cart,
                  color: kPrimarycolor,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  color: kTextColor,
                ),
                activeIcon: Icon(
                  Icons.person,
                  color: kPrimarycolor,
                ),
                label: ''),
          ],
        ),
      ),
    );
  }
}
