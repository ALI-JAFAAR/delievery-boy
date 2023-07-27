import 'package:alamal_center/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/app.dart';
import '../login/login.dart';

class CheckOut extends StatefulWidget {
  CheckOut({super.key});

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  late TextEditingController address = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var store = Provider.of<AppProvider>(context);
    return store.login == false
        ? Scaffold(
            backgroundColor: Colors.white,
            body: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Login(),
                      ),
                    );
                  },
                  child: Text("رجاء قم بتسجيل الدخول او انشاء حساب للمتابعه"),
                ),
              ],
            )),
          )
        : Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              appBar: AppBar(
                title: const Text('اتمام الطلب'),
                backgroundColor: kPrimarycolor,
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, right: 10, left: 10),
                      child: SizedBox(
                        height: 300,
                        child: ListView.builder(
                          itemCount: store.cartitem.length,
                          itemBuilder: (context, i) {
                            var item = store.cartitem[i];
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 2.0),
                              child: Card(
                                elevation: 4.0,
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundImage: NetworkImage(
                                      item.img,
                                    ),
                                    radius: 45,
                                  ),
                                  title: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(item.name),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(item.price.toString()),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(
                              "العنوان",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              height: 100,
                              margin: const EdgeInsets.only(top: 10),
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: TextField(
                                controller: address,
                                maxLines: 8,
                                decoration: const InputDecoration(
                                  hintText: '  اكتب عنوان السكن من فضلك  ',
                                  fillColor: Colors.grey,
                                  border: InputBorder.none,
                                ),
                                onSubmitted: (search) {},
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              bottomNavigationBar: BottomAppBar(
                elevation: 0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: 140,
                      color: kPrimarycolor,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                const Text(
                                  "السعر الكلي",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  (store.total_price()).toString()+" دينار",
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: InkResponse(
                              splashFactory: NoSplash.splashFactory,
                              onTap: () {
                                store.send_order(
                                    store.userdata.name,
                                    store.userdata.phone,
                                    store.total_price(),
                                    address.text,
                                    store.userdata.id,
                                    context);
                              },
                              child: Container(
                                margin: const EdgeInsets.all(10),
                                height: 40,
                                width: MediaQuery.of(context).size.width * 0.5,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.amberAccent,
                                ),
                                child: const Center(
                                  child: Text(
                                    'اتمام الطلب',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
