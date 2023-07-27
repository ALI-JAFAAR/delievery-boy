import 'package:flutter/material.dart';
import '../../../constants.dart';

class Description extends StatelessWidget {
  const Description({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: Text(
       'product.disc',
        style: TextStyle(height: 1.5),
      ),
    );
  }
}
