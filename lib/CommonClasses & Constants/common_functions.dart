import 'package:another_flushbar/flushbar.dart';
import 'package:call_log_odoo/CommonClasses%20&%20Constants/shared_preference_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:intl/intl.dart';


import '../url_screen.dart';
import 'app_constants.dart';

class CommonFunctions {
  showAlertDialog(BuildContext context, String title, String message) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            Padding(
              padding:  EdgeInsets.only(right: 5.0),
              child: MaterialButton(onPressed: (){
                Navigator.pop(context,true);
              },
                color: AppColors.BUTTON_BG_COLOR,

                child: Text("Close",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                elevation: 3,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35.r)),
              ),
            )
          ],
        ));
  }

  showLoader(BuildContext context, Size size) {
    var _backgroundColor = Colors.transparent;

    showDialog(
      context: context,
      barrierColor: _backgroundColor,
      builder: (BuildContext dialogContext) {
        return Container(
          color: AppColors.LOADER_BACKGROUND_COLOR,
          height: size.height,
          width: size.width,
          child: Center(
            child: Image.asset(
              'Assets/images/loaderbar_two.gif', // Put your gif into the assets folder
              width: 70,
              height: 70,
            ),
          ),
        );
      },
    );
    //EasyLoading.show(status: 'loading...');
    //customLoader();
    //MyIconSpinner();
    //showCdialog(context);

  }

  removeLoader(BuildContext context) {

    Navigator.pop(context);

    //EasyLoading.dismiss();



  }

  showToast(String message) {
    EasyLoading.showToast(message);
  }

  showLoaderLogout(BuildContext context){

    EasyLoading.show(status: 'Session Expired. Logging Out...');
  }
  removeLoaderLogout(){

  }

  String formatedDateStringFrom(String comingDateStr) {
    DateTime date = DateTime.parse(comingDateStr);
    String formattedDate = DateFormat('yyyy-MM-dd').format(date);
    return formattedDate;
  }

  String formatedDateStringFromDate(DateTime comingDate) {
    String formattedDate = DateFormat('yyyy-MM-dd').format(comingDate);
    return formattedDate;
  }
  sessionExpiry(BuildContext context){
    showLoaderLogout(context);
    Future.delayed(Duration(milliseconds: 3000),(){
      EasyLoading.dismiss();
      /*Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => SignIn()));*/
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => UrlScreen()), (route) => false);
    }
    );
  }

  Widget customLoader(){
    return Container(
      height: 80,
      width: 80,
      child: Image.asset("Assets/images/double_ring_transparent.gif",
        height: 60,
        width: 60,),
    );
  }

  Future<bool> checkInternet() async{
    bool result = await InternetConnectionChecker().hasConnection;
    if(result == true) {
      return result;
    } else {
      print("no internet");
      return result;
      // print(InternetConnectionChecker().lastTryResults);
    }
  }

  flushbar(BuildContext context){
    Flushbar(
      title:  "No Internet",
      message:  "Please Check Your Internet Connection",
      duration:  Duration(seconds: 3),
      flushbarPosition: FlushbarPosition.TOP,
      backgroundColor: Colors.red,
      titleColor: Colors.white,
      messageColor: Colors.white,
    )..show( context);

  }

  Future<Null> signoutAction(BuildContext context) async {
    //final bool removed = await SignInFunctionality.removeUserDetails();

    bool usernme_is_removed = await SharedPreferenceHelper.removeUsername("");
    bool password_is_removed = await SharedPreferenceHelper.removePassword("");
    Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return UrlScreen();
        },
      ),
          (_) => false,
    );


    //
    /*Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (c) => MyApp()), (route) => false, );*/
  }
  getUserId()async{
    int user_id = await SharedPreferenceHelper.getUserID();
    return user_id;
  }

}