import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../CommonClasses & Constants/common_functions.dart';

class User {
  String email = '';
  String password = '';
  String dbName = '';

  loginAction(BuildContext context,Size size) {
    print('login Button action $email & $password');
    _hideKeyBoardFor(context);

    //CommonFunctions().showLoader();
    CommonFunctions().showLoader(context,size);
    _loginWebservice(context);
  }

  Future<Null> _loginWebservice(BuildContext context) async {
    // var response = await APIManager().loginAction(email, password,dbName);
    // print("response of login:"+response.toString());
    // //CommonFunctions().removeLoader();
    // CommonFunctions().removeLoader(context);
    //
    //
    // if (response != null) {
    //   if (response is Map) {
    //     if (response.containsKey('access_token') && response.containsKey('partner_id')){
    //       //if (response["token"] && response["uid"]){
    //       String token = response["access_token"];
    //       int user_id = response["partner_id"];
    //       print('_loginWebservice ${token} & ${user_id}');
    //
    //        bool b3 = await SharedPreferenceHelper.setToken(token);
    //
    //
    //       Navigator.pushReplacement(
    //           context,
    //           MaterialPageRoute(builder: (context) => Home()));
    //
    //     }
    //     else if(response.containsValue('Failed')){
    //       String error_message = response["message"];
    //       print(error_message);
    //       CommonFunctions().showAlertDialog(context, 'Error', error_message);
    //     }
    //
    //
    //
    //   }
    // }

    // else{
    //   CommonFunctions().showAlertDialog(context, 'Error', "Wrong Username Or Password");
    // }


  }

  registerAction(BuildContext context) {
    _hideKeyBoardFor(context);
  }

  forgotPasswordAction(BuildContext context) {
    _hideKeyBoardFor(context);
    Navigator.pop(context);
  }

  _hideKeyBoardFor(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }
}