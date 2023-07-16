// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../constants.dart';
import '../../provider/app.dart';
import '../signup/signup.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final phone = TextEditingController();
  final pass = TextEditingController();
  bool xx = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    var user = Provider.of<AppProvider>(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimarycolor,
        ),
        body: SizedBox(
          height: height,
          child: Stack(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(height: 90),
                      Column(
                        children: [
                          Row(children: [
                            const Spacer(),
                            Text(
                              "اهلا بك في تطبيق  ",
                              style: GoogleFonts.cairo(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                            const Spacer(),
                          ]),
                          Row(children: [
                            const Spacer(),
                            Text(
                              " سنتر الساعه",
                              style: GoogleFonts.cairo(
                                color: kPrimarycolor,
                                fontSize: 25,
                              ),
                            ),
                            const Spacer(),
                          ]),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "رقم الهاتف",
                              style: GoogleFonts.cairo(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextField(
                              controller: phone,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  fillColor: Color(0xfff3f3f4),
                                  filled: true),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "كلمة المرور",
                              style: GoogleFonts.cairo(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextField(
                              controller: pass,
                              obscureText: xx,
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                fillColor: const Color(0xfff3f3f4),
                                filled: true,
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      xx = !xx;
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.remove_red_eye,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 35),
                      TextButton(
                        onPressed: () {
                          //  print(
                          //  "${name.text} \n ${address.text}  \n ${pass.text} \n ${phone.text} ");
                          user.userlogin(context, pass.text, phone.text);
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: Colors.grey.shade600,
                                  offset: const Offset(2, 4),
                                  blurRadius: 10,
                                  spreadRadius: 2),
                            ],
                            gradient:  LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                kTextColor,
                                kPrimarycolor,
                              ],
                            ),
                          ),
                          child: const Text(
                            'تسجيل الدخول',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * .055,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => SignUp()));
                        },
                        child: const Text(
                          " او قم بانشاء حساب جديد من هنا",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      SizedBox(
                        height: height * .02,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}