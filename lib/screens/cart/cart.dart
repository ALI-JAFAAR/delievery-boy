import 'package:alamal_center/constants.dart';
import 'package:alamal_center/provider/app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../checkout/checkout.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var store = Provider.of<AppProvider>(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('عربة التسوق'),
          backgroundColor: kPrimarycolor,
          elevation: 0,
        ),
        body: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView.builder(
                itemCount: store.cartitem.length,
                itemBuilder: (context, i) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        Card(
                          child: Container(
                            width: MediaQuery.of(context).size.width - 20,
                            height: 100,
                            child: Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 100,
                                      height: 100,
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            store.cartitem[i].img,
                                          ),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 10,),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      store.cartitem[i].name,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      (store.cartitem[i].price).toString(),
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                         
                          child: IconButton(
                            onPressed: () {
                              store.remove_item(i);
                            },
                            icon: const Icon(
                              Icons.close,
                              color: Colors.red,
                              size: 30,
                            ),
                          ),
                        ),

                        Positioned(
                          bottom: 40,
                          left: 30,
                          child: Row(
                            children: [
                               Text(
                                  store.cartitem[i].qty.toString(),
                                  style: const TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                             const Icon(Icons.close,size: 15,color: Colors.grey,),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                })),
        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 100,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            const Text(
                              "Total Price",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "${store.total_price()}",
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  InkResponse(
                    splashFactory: NoSplash.splashFactory,
                    onTap: () {
                      if (store.cartitem.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "لاتوجد منتجات في داخل العربة ",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              textDirection: TextDirection.rtl,
                            ),
                          ),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CheckOut(),
                          ),
                        );
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.all(15),
                      height: 45,
                      width: MediaQuery.of(context).size.width * 0.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: kPrimarycolor,
                      ),
                      child: const Center(
                          child: Text(
                        'CheckOut',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}