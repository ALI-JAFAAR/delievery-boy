import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../provider/app.dart';
import '../login/login.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<AppProvider>(context);
    var size = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: Text(
          " الحساب الشخصي ",
          style: TextStyle(
            color: Theme.of(context).scaffoldBackgroundColor,
            fontSize: 25,
          ),
        ),
      ),
      body:
          // user.login == false
          //     ? Center(
          //         child: TextButton(
          //           onPressed: () {
          //             Navigator.push(
          //               context,
          //               MaterialPageRoute(builder: (context) => Login()),
          //             );
          //           },
          //           child: Text(
          //             "رجاء قم بتسجيل الدخول او انشاء حساب",
          //             style: TextStyle(
          //               fontSize: size < 200 ? 16 : 26,
          //               fontWeight: FontWeight.bold,
          //             ),
          //           ),
          //         ),
          //       )
          //     :
          SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Container(
                width: double.infinity,
                height: 120,
                child: Container(
                  alignment: Alignment(0.0, 2.5),
                  child: Container(
                    decoration: BoxDecoration(
                      // boxShadow: [
                      //   BoxShadow(
                      //     // color: Colors.black.withOpacity(0.1),
                      //     // spreadRadius: 1,
                      //     // blurRadius: 4,
                      //     // offset: Offset(0, 3),
                      //   ),
                      // ],
                    ),
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/images/logo.png"),
                      radius: 50,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Spacer(),
                Text(
                  "معلومات الحساب",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                ),
                Spacer(),
              ],
            ),
            Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      " الاسم  : ",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      " رقم الهاتف  : ",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: user.login == true
          ? BottomAppBar(
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 200,
                  child: Row(
                    children: [
                      Spacer(),
                      Column(
                        children: [
                          InkResponse(
                            splashFactory: NoSplash.splashFactory,
                            onTap: () {
                              user.logout(context);
                            },
                            child: Container(
                              margin: const EdgeInsets.all(15),
                              height: size > 800 ? 60 : 45,
                              width: MediaQuery.of(context).size.width * 0.5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: kPrimarycolor,
                              ),
                              child: Center(
                                  child: Text(
                                'تسجيل الخروج',
                                style: TextStyle(
                                  fontSize: size > 800 ? 26 : 16,
                                  color: Colors.white,
                                ),
                              )),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          InkResponse(
                            splashFactory: NoSplash.splashFactory,
                            onTap: () {
                              user.del_account(context, user.userdata.id);
                            },
                            child: Container(
                              margin: const EdgeInsets.all(15),
                              height: size > 800 ? 60 : 45,
                              width: MediaQuery.of(context).size.width * 0.5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: kPrimarycolor,
                              ),
                              child: Center(
                                  child: Text(
                                'حذف الحساب',
                                style: TextStyle(
                                  fontSize: size > 800 ? 26 : 16,
                                  color: Colors.white,
                                ),
                              )),
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ),
            )
          : Text(""),
    );
  }
}
