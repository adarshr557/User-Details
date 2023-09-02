import 'package:flutter/material.dart';
import 'package:user_app/model/user_details_model_class.dart';

class HomepageProvider extends ChangeNotifier {
  late List<UserDetails> userlist = [];
  //creating saved index variable to assaing the int index(required parameter of secondpage)
  late int savedindex;

  void test() {
    notifyListeners();
    //super.initState();
    //getdetails();
  }
}
