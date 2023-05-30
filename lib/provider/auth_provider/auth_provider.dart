// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:qlcd/model/user_model.dart';

import '../../api/graphql_server.dart';

class AuthProvider extends ChangeNotifier {
  UserModel? userModel;

  Future<bool> SignIn(String email, String password) async {
    UserModel? user;
    if (email.contains('@')) {
      user = await GraphQLServer().SignIn(email, password);
      print("user dang nhap tư email : ${user.toString()}");
    } else {
      user = await GraphQLServer().SignInPhone(email, password);
      print("user dang nhap tư email : ${user.toString()}");
    }

    print("user : ${user.toString()}");
    if (user == null) {
      return false;
    } else {
      userModel = user;
      notifyListeners();
      print("sign :${userModel}");
      return true;
    }
  }
}
