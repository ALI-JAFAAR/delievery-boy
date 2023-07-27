import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/api.dart';
import '../models/cus.dart';
import '../screens/home/home_screen.dart';

class AppProvider extends ChangeNotifier {
  Api api = Api();
  late SnackBar snackBar;
  bool login = false;
  var userdata;
  // serch var
  bool searchwaiting = true;
  int searchcount = 0;
  var searchitem;

















  createaccount(BuildContext context, String name, String password, String phone) async {
    var data = {
      "name": name,
      "password": password,
      "phone": phone,
    };
    final response = await api.postData(data, 'cus-signup');
    if (response.statusCode == 200) {
      var datas = json.decode(response.body);
      print(response.body);
      var logindata = customerFromJson(response.body);

      if (datas["success"] == false) {
        snackbar(context, "حدث خطا ما");
      } else {
        userdata = logindata.data;
        SharedPreferences localStorage = await SharedPreferences.getInstance();
        localStorage.setInt('id', userdata.id);
        localStorage.setString('name', userdata.name);
        localStorage.setString('phone', userdata.phone);
        snackbar(context, "مرحبا بك ${userdata.name}");
        login = true;
        notifyListeners();
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  HomeScreen()),
        );
      }
    } else {
      print(response.body);
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>  HomeScreen()),
    );
  }


  userlogin(BuildContext context, pass, phone) async {
    var data = {
      "password": pass,
      "phone": phone,
    };
    final response = await api.postData(data, 'cus-login');
    if (response.statusCode == 200) {
      var datas = json.decode(response.body);
      print(response.body);
      var logindata = customerFromJson(response.body);

      if (datas["success"] == false) {
        snackbar(context, "حدث خطا ما");
      } else {
        userdata = logindata.data;
        print("user login data ${logindata.data}");
        SharedPreferences localStorage = await SharedPreferences.getInstance();
        localStorage.setInt('id', userdata.id);
        localStorage.setString('name', userdata.name);
        localStorage.setString('phone', userdata.phone);
        localStorage.setString('address', userdata.address);
        snackbar(context, "مرحبا بك ${userdata.name}");
        login = true;
        notifyListeners();
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  HomeScreen()),
        );
      }
    } else {
      print(response.body);
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>  HomeScreen()),
    );
  }

  check_login(context) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    if (login == true) {
    } else {
      if (localStorage.getInt('id') != null) {
        Data da = Data(
          name: localStorage.getString('name'),
          id: localStorage.getInt('id'),
          phone: localStorage.getString('phone'),
          address: localStorage.getString('address'),
        );
        userdata = da;
        login = true;
        snackbar(context, "مرحبا بك مجددا");
        print("user login id = ${userdata.id}");
        notifyListeners();
      }
    }
  }

  logout(context) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.remove('id');
    localStorage.remove('name');
    localStorage.remove('phone');
    localStorage.remove('address');
    login = false;
    snackbar(context, "تم تسجيل الخروج");
    notifyListeners();
  }


  del_account(context,id) async {

      final response = await api.getData('cus-del/$id');
      print(response.statusCode);
      if (response.statusCode == 200) {
        var datas = json.decode(response.body);

        if (datas["success"] == true) {
          snackbar(context,"تم حذف الحساب لدينا يمكنك الان انشاء حساب جديد");
          logout(context);
          notifyListeners();
        } else {
          print("error delet account");
        }
      }
  }

  void snackbar(context, String text) {
    snackBar = SnackBar(
      content: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        textDirection: TextDirection.rtl,
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}