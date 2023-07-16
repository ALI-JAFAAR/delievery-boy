import 'package:google_fonts/google_fonts.dart';

import '/provider/app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'constants.dart';
import 'screens/home/home_screen.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: AppProvider(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'سنتر الساعه',
      theme: ThemeData(
        primaryColor: kPrimarycolor,
        textTheme: GoogleFonts.cairoTextTheme(),
        // textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        
      ),
      home: HomeScreen(),
    );
  }
}