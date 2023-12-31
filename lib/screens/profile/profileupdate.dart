import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '/constants.dart';
import 'package:flutter/material.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimarycolor,
          title: Text('تحديث المعلومات',),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding:  EdgeInsets.all(kDefaultPaddin),
            child: Column(
              children: [
                // -- IMAGE with ICON
                Stack(
                  children: [
                    SizedBox(
                      width: 120,
                      height: 120,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: const Image(image: AssetImage('assets/images/logo.png'))),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(100), color: kPrimarycolor),
                        child: const Icon(LineAwesomeIcons.camera, color: Colors.black, size: 20),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
    
                // -- Form Fields
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                            label: Text('tFullName'), prefixIcon: Icon(LineAwesomeIcons.user)),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        decoration: const InputDecoration(
                            label: Text('tEmail'), prefixIcon: Icon(LineAwesomeIcons.envelope_1)),
                      ),
                      const SizedBox(height:   20),
                      TextFormField(
                        decoration: const InputDecoration(
                            label: Text('tPhoneNo'), prefixIcon: Icon(LineAwesomeIcons.phone)),
                      ),
                      const SizedBox(height:  20),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          label: const Text('tPassword'),
                          prefixIcon: const Icon(Icons.fingerprint),
                          suffixIcon:
                          IconButton(icon: const Icon(LineAwesomeIcons.eye_slash), onPressed: () {}),
                        ),
                      ),
                      const SizedBox(height: 20),
    
                      // -- Form Submit Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: ()  {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: kPrimarycolor,
                              side: BorderSide.none,
                              shape: const StadiumBorder()),
                          child: const Text('tEditProfile', style: TextStyle(color: Colors.black)),
                        ),
                      ),
                      const SizedBox(height: 20),
    
                      // -- Created Date and Delete Button
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text.rich(
                            TextSpan(
                              text: 'tJoined',
                              style: TextStyle(fontSize: 12),
                              children: [
                                TextSpan(
                                    text: 'tJoinedAt',
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12))
                              ],
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.redAccent.withOpacity(0.1),
                                elevation: 0,
                                foregroundColor: Colors.red,
                                shape: const StadiumBorder(),
                                side: BorderSide.none),
                            child: const Text('tDelete'),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}