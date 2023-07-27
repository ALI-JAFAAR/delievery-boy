import 'package:flutter/material.dart';
import 'components/body.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          'مندوب التوصيل',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,

      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Body(),
        ),
      ),
      ),
    );
  }
}
