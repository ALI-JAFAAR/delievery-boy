import 'package:flutter/material.dart';

import '../../map/map.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate([
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MapSample(),
                        ),
                      );
                    },
                    child: Text('ClickMe'),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ],
    );
  }
}
