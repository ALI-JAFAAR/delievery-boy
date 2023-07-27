import 'package:alamal_center/constants.dart';
import 'package:alamal_center/provider/app.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../utiles/iconbutton.dart';
import '../checkout/checkout.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late int qty;

  @override
  void initState() {
    super.initState();
    qty = 1;
  }

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
                    padding: const EdgeInsets.all(2),
                    child: ClipRRect(
                      child: Card(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(4),
                              child: Container(
                                child: CachedNetworkImage(
                                  imageUrl: store.cartitem[i].img,
                                  fit: BoxFit.fill,
                                  width: 115,
                                  height: 110,
                                  placeholder: (context, url) => Image.asset(
                                    'assets/images/logo.png',
                                    fit: BoxFit.cover,
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),
                              ),
                            ),
                      
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                               
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 60),
                                      child: Text(
                                        store.cartitem[i].name,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                Row(
                                  children: [
                                    Text(store.cartitem[i].price.toString()),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Container(
                                      width: 130,
                                      height: 60,
                                      child: Row(
                                        children: [
                                          IconsButton(
                                            onTap: () {
                                              if (store.cartitem[i].qty == 1)
                                                store.remove_item(i);
                                              else {
                                                store.qty_update(
                                                    i,
                                                    store.cartitem[i].qty -
                                                        1);
                                              }
                                            },
                                            border: 50,
                                            title: Icons.remove,
                                            width: 0.12,
                                            margen: 0,
                                            hight: 40,
                                            size: 25,
                                            color: kPrimarycolor,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            '${store.cartitem[i].qty}',
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          IconsButton(
                                            onTap: () {
                                              store.qty_update(i,store.cartitem[i].qty + 1);
                                            },
                                            border: 50,
                                            title: Icons.add,
                                            width: 0.12,
                                            margen: 0,
                                            hight: 40,
                                            size: 25,
                                            color: Colors.greenAccent,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                
                              ],
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Column(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    store.remove_item(i);
                                  },
                                  icon: Icon(
                                    FontAwesomeIcons.trash,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                })),
        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 110,
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
                              "السعر الكلي",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "${store.total_price()}",
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 40,),
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
                            builder: (context) => CheckOut(),
                          ),
                        );
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.all(15),
                      height: 45,
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: kPrimarycolor,
                      ),
                      child: const Center(
                          child: Text(
                        'اتمام الطلب',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
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
