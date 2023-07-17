import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';
import 'body.dart';
import 'location.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Body(),
        ),
        SizedBox(
          height: 150,
          child: AppBar(
            elevation: 1,
            backgroundColor: Theme.of(context).primaryColor,
            // leading: Container(
            //   margin: EdgeInsets.only(right: 2),
            //   child: 
            // ),
            title: Row(
              children: [
                
                Text(
                  "سنتر الساعه",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                Image.asset(
                'assets/images/title.png',
                height: 50,
                width: 60,
              ),
              ],
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
          top: 120,
          left: 20,
          width: MediaQuery.of(context).size.width * 0.92,
          child: LocationCard(),
        ),
      ],
    );
  }
}
