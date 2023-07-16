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
    );
  }
}
