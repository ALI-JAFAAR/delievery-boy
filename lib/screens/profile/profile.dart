// ignore_for_file: deprecated_member_use

import 'package:alamal_center/screens/profile/profileupdate.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:provider/provider.dart';
// import 'package:provider/provider.dart';

import '../../constants.dart';
// import '../../provider/app.dart';
import '../../provider/app.dart';
import '../../utiles/profilemenu.dart';
import '../login/login.dart';
// import '../login/login.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<AppProvider>(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimarycolor,
          title: Text(
            'الحساب الشخصي',
          ),
        ),
        body:
            user.login == false
                ? Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),
                        );
                      },
                      child: Text(
                        "رجاء قم بتسجيل الدخول او انشاء حساب",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                :
            SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                /// -- IMAGE
                Stack(
                  children: [
                    SizedBox(
                      width: 120,
                      height: 120,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: const Image(
                              image: AssetImage('assets/images/logo.png'))),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: kPrimarycolor),
                        child: const Icon(
                          LineAwesomeIcons.alternate_pencil,
                          color: Colors.black,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text('اسم المستخدم',
                    style: Theme.of(context).textTheme.headline4),
                Text('${user.userdata.name}',
                    style: Theme.of(context).textTheme.bodyText2),
                const SizedBox(height: 20),

                /// -- BUTTON
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UpdateProfileScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimarycolor,
                        side: BorderSide.none,
                        shape: const StadiumBorder()),
                    child: const Text(
                      'تحديث البيانات',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                const Divider(),
                const SizedBox(height: 10),

                /// -- MENU
                ProfileMenuWidget(
                  title: "${user.userdata.phone}",
                  icon: LineAwesomeIcons.phone,
                  endIcon: false,
                  onPress: () {},
                ),
                ProfileMenuWidget(
                  title: "العنوان : ${user.userdata.address}",
                  icon: LineAwesomeIcons.city,
                  endIcon: false,
                  onPress: () {},
                ),
                
                const Divider(),
                const SizedBox(height: 10),
                ProfileMenuWidget(
                  title: "معلومات الدفع",
                  icon: LineAwesomeIcons.wallet,
                  onPress: () {},
                ),
                ProfileMenuWidget(
                  title: "الخروج",
                  icon: LineAwesomeIcons.alternate_sign_out,
                  textColor: Colors.red,
                  endIcon: false,
                  onPress: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
