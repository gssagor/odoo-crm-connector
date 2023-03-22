
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../CommonClasses & Constants/app_constants.dart';
import '../CommonClasses & Constants/common_functions.dart';

import 'Models/user.dart';
import 'home.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late Size size;
  final _formKey = GlobalKey<FormState>();
  final _user = User();
  bool _isObscure = true;
  bool isDbListLoaded = false;
  var dbListData;
  String _userEmail = '';
  String _userPass = '';
  String selectedDb='';
   List<dynamic> dbList=[];
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isChecked = false;

  var _emailSaved;
  var _passwordSaved;
  var _rememberMe;
  var _dbSaved;

  // Future<Null> _getDatabaseList() async {
  //
  //   //var result = await CommonFunctions().checkInternet();
  //   // if (result == true) {
  //     //_searchList.clear();
  //   CommonFunctions().showLoader(context,size);
  //
  //     dbListData = await APIManager().getDatabaseList();
  //
  //     setState(() {
  //       isDbListLoaded = true;
  //       CommonFunctions().removeLoader(context);
  //
  //     });
  //     print("db list:" + dbListData.toString());
  //     print("db list result: " + dbListData.values.last.toString());
  //     dbList = dbListData.values.last;
  //     print("dblist length: " + dbList.length.toString());
  //   // } else if (result == false) {
  //   //   CommonFunctions().flushbar(context);
  //   // }
  // }

  @override
  void initState() {
    super.initState();
    //_checkVersion();
    Future.delayed(const Duration(milliseconds: 500), () {
      //_getDatabaseList();
    });
    _loadUserEmailPassword();


    print("base url in login screen: " + URLConstants.baseUrl);
  }

  @override
  Widget build(BuildContext context) {
    // if(isDbListLoaded){
    //   CommonFunctions().removeLoader(context);
    // }else{
    //   CommonFunctions().showLoader(context);
    // }
    size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
            color: Colors.teal,
            // image: DecorationImage(
            //     image: AssetImage(
            //       'Assets/images/bg.png',
            //     ),
            //     fit: BoxFit.cover)
          ),
          child: Stack(children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: size.height * 0.15, left: 30.w, right: 30.w),
                  child: Column(

                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10.0.h),

                      ),
                      SizedBox(
                        height: 70.h,
                      ),
                      // Padding(
                      //   padding:
                      //   EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
                      //   child: _DbListSearchableWidget(),
                      // ),
                      Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
                        child: Form(key: _formKey, child: _inputView()),
                      ),
                      Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 25.w, vertical: 5.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            _rememberMeFunc()
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 60.0.h),
                  child: MaterialButton(
                    onPressed: () async {
                      // if(selectedDb==''|| selectedDb==null){
                      //   CommonFunctions().showToast("Please select Database First!");
                      // }
                      // else{
                      //   var result = await CommonFunctions().checkInternet();
                      //   if (result == true) {
                      //     _handleRemember(_isChecked);
                      //     final form = _formKey.currentState;
                      //     if (form!.validate()) {
                      //       form.save();
                      //       _user.loginAction(context,size);
                      //     }
                      //   } else if (result == false) {
                      //     CommonFunctions().flushbar(context);
                      //   }
                      // }
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));

                    },
                    child: Text(
                      'Sign in',
                      style: TextStyle(
                          fontSize: 16.0.sp,
                          // fontFamily: 'SFUIDisplay',
                          fontWeight: FontWeight.w500,
                          color: Colors.teal),
                    ),
                    color: Colors.white,
                    elevation: 3,
                    minWidth: 180.0.w,
                    height: 40.0.h,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.r),
                        side: BorderSide(color: Colors.white, width: 2.0)),
                  ),
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
  Widget buildPortrait(){
    size = MediaQuery.of(context).size;
    return  Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
        color: Colors.teal,
              // image: DecorationImage(
              //     image: AssetImage(
              //       'Assets/images/bg.png',
              //     ),
              //     fit: BoxFit.cover)
          ),
          child: Stack(children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: size.height * 0.15, left: 30.w, right: 30.w),
                  child: Column(

                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10.0.h),

                      ),
                      SizedBox(
                        height: 70.h,
                      ),
                      // Padding(
                      //   padding:
                      //   EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
                      //   child: _DbListSearchableWidget(),
                      // ),
                      Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
                        child: Form(key: _formKey, child: _inputView()),
                      ),
                      Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 25.w, vertical: 5.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            _rememberMeFunc()
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 60.0.h),
                  child: MaterialButton(
                    onPressed: () async {
                      if(selectedDb==''|| selectedDb==null){
                        CommonFunctions().showToast("Please select Database First!");
                      }
                      else{
                        var result = await CommonFunctions().checkInternet();
                        if (result == true) {
                          _handleRemember(_isChecked);
                          final form = _formKey.currentState;
                          if (form!.validate()) {
                            form.save();
                            _user.loginAction(context,size);
                          }
                        } else if (result == false) {
                          CommonFunctions().flushbar(context);
                        }
                      }

                    },
                    child: Text(
                      'Sign in',
                      style: TextStyle(
                          fontSize: 16.0.sp,
                          // fontFamily: 'SFUIDisplay',
                          fontWeight: FontWeight.w500,
                          color: Colors.teal),
                    ),
                    color: Colors.white,
                    elevation: 3,
                    minWidth: 180.0.w,
                    height: 40.0.h,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.r),
                        side: BorderSide(color: Colors.white, width: 2.0)),
                  ),
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
  Widget buildLandscape(){
    size = MediaQuery.of(context).size;
    return  Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'Assets/images/bg.png',
                  ),
                  fit: BoxFit.cover)),
          child: Stack(children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: size.height * 0.15, left: 30.w, right: 30.w),
                  child: Container(
                    height: size.height - (size.height * 0.35),
                    width: size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.6),
                          spreadRadius: 2,
                          blurRadius: 3,
                          offset: Offset(2, 2), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(

                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 10.0.h),
                          child: Container(
                              height: 70.h,
                              child: Image.asset(
                                'Assets/images/invex_logo_main.png',
                                height: 50.h,
                                width: 150.w,
                              )),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Padding(
                          padding:
                          EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
                          child: _DbListSearchableWidgetLandscape(),
                        ),
                        Padding(
                          padding:
                          EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
                          child: Form(key: _formKey, child: _inputViewLandscape()),
                        ),
                        Padding(
                          padding:
                          EdgeInsets.symmetric(horizontal: 25.w, vertical: 5.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              _rememberMeFuncLandscape()
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30.0.h),
                  child: MaterialButton(
                    onPressed: () async {
                      if(selectedDb==''|| selectedDb==null){
                        CommonFunctions().showToast("Please select Database First!");
                      }
                      else{
                        var result = await CommonFunctions().checkInternet();
                        if (result == true) {
                          _handleRemember(_isChecked);
                          final form = _formKey.currentState;
                          if (form!.validate()) {
                            form.save();
                            _user.loginAction(context,size);
                          }
                        } else if (result == false) {
                          CommonFunctions().flushbar(context);
                        }
                      }

                    },
                    child: Text(
                      'Sign in',
                      style: TextStyle(
                          fontSize: 24.0.sp,
                          // fontFamily: 'SFUIDisplay',
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    color: AppColors.BUTTON_BG_COLOR,
                    elevation: 3,
                    minWidth: 140.0.w,
                    height: 65.0.h,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.r),
                        side: BorderSide(color: Color(0xFF707070), width: 2.0)),
                  ),
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }

  Widget _DbListSearchableWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            height: 55.h,
            decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.white, width: 1.5, style: BorderStyle.solid),
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: DropdownButtonHideUnderline(
                child:DropdownButton<dynamic>(
                  iconDisabledColor: Colors.white,
                  iconEnabledColor: Colors.white,
                  iconSize: 30.sp,
                  underline: Container(
                    height: 2.h,color: Colors.black,
                  ),

                  isExpanded: true,

                  value:
                  isDbListLoaded ? dbList!.first : null,
                  onChanged: (dynamic data) {
                    setState(() {
                      print("db: " + data!.toString());
                      selectedDb = data;

                    });
                  },
                  items: dbList!.map((dynamic user) {
                    return new DropdownMenuItem<dynamic>(
                      value: user,
                      child: Text(
                        user,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: new TextStyle(color: Colors.white,
                            fontSize: 14.sp
                        ),
                      ),
                    );
                  }).toList(),
                )

              ),
            )),
      ],
    );
  }
  Widget _DbListSearchableWidgetLandscape() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            height: 65.h,
            decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.grey, width: 1.5, style: BorderStyle.solid),
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: DropdownButtonHideUnderline(
                child:DropdownButton<dynamic>(
                  iconDisabledColor: Colors.grey,
                  iconEnabledColor: Colors.grey,
                  iconSize: 30.sp,
                  underline: Container(
                    height: 2.h,color: Colors.black,
                  ),

                  isExpanded: true,

                  value:
                  isDbListLoaded ? dbList!.first : null,
                  onChanged: (dynamic data) {
                    setState(() {
                      print("db: " + data!.toString());
                      selectedDb = data;

                    });
                  },
                  items: dbList!.map((dynamic user) {
                    return new DropdownMenuItem<dynamic>(
                      value: user,
                      child: Text(
                        user,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: new TextStyle(color: Colors.black,
                            fontSize: 16.sp
                        ),
                      ),
                    );
                  }).toList(),
                )

              ),
            )),
      ],
    );
  }

  Widget _inputView() => Container(
        //padding: EdgeInsets.fromLTRB(5.0.w, 0,5.0.w, 0),
        decoration: BoxDecoration(
          color: Colors.transparent,
          //border:Border.all(color: Colors.grey, width: 0.5),
          //borderRadius: BorderRadius.all(Radius.circular(15.0.r)),
        ),
        child: SizedBox(
          //height: 145.0.h,
          // width: 240.0.w,
          child: Column(children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: _emailRow(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: _passwordRow(),
            ),
          ]),
        ),
      );
  Widget _inputViewLandscape() => Container(
        //padding: EdgeInsets.fromLTRB(5.0.w, 0,5.0.w, 0),
        decoration: BoxDecoration(
          color: Colors.transparent,
          //border:Border.all(color: Colors.grey, width: 0.5),
          //borderRadius: BorderRadius.all(Radius.circular(15.0.r)),
        ),
        child: SizedBox(
          //height: 145.0.h,
          // width: 240.0.w,
          child: Column(children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: _emailRowLandscape(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: _passwordRowLandscape(),
            ),
          ]),
        ),
      );

  Widget _emailRow() => Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: TextFormField(

                //autofillHints: [_emailSaved],
                controller: _emailController,
                textInputAction: TextInputAction.next,
                style: TextStyle(
                    color: Colors.white,
                    // fontSize: 12.0.sp
                    ),
                onChanged: (text) {
                  setState(() {
                    _userEmail = text.toString();
                    print(_userEmail);
                  });
                },
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.white,
                      width: 1,
                    )),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.white,
                      width: 1,
                    )),
                    labelText: 'Username',
                    labelStyle: TextStyle(
                        // fontSize: 12.0.sp,
                        color: Colors.white)),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your username';
                  }
                },
                onSaved: (val) => setState(() => _user.email = val!),
              ),
            ),
          ]);
  Widget _emailRowLandscape() => Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SizedBox(
                height: 75.h,
                child: TextFormField(

                  //autofillHints: [_emailSaved],
                  controller: _emailController,
                  textInputAction: TextInputAction.next,
                  style: TextStyle(
                      //color: Colors.black,
                      // fontSize: 12.0.sp
                      ),
                  onChanged: (text) {
                    setState(() {
                      _userEmail = text.toString();
                      print(_userEmail);
                    });
                  },
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1,
                      )),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1,
                      )),
                      labelText: 'Username',
                      labelStyle: TextStyle(
                          // fontSize: 12.0.sp,
                          color: Colors.black)),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your username';
                    }
                  },
                  onSaved: (val) => setState(() => _user.email = val!),
                ),
              ),
            ),
          ]);

  Widget _passwordRow() =>
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: TextFormField(
                textInputAction: TextInputAction.done,
                controller: _passwordController,
                obscureText: _isObscure,
                style: TextStyle(
                    color: Colors.white,
                    // fontSize: 12.0.sp
                    ),
                onChanged: (text) {
                  setState(() {
                    _userPass = text.toString();
                    print(_userPass);
                  });
                },
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.white,
                    width: 1,
                  )),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.white,
                    width: 1,
                  )),
                  labelText: 'Password',
                  labelStyle: TextStyle(
                      // fontSize: 12.0.sp,
                      color: Colors.white),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isObscure ? Icons.visibility : Icons.visibility_off,
                      size: 15,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                  ), /*enabledBorder: InputBorder.none*/
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter password';
                  }
                },
                onSaved: (val) => setState(() => _user.password = val!),
              ),
            ),
          ]);

  Widget _passwordRowLandscape() =>
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SizedBox(
                height: 75.h,
                child: TextFormField(
                  textInputAction: TextInputAction.done,
                  controller: _passwordController,
                  obscureText: _isObscure,
                  style: TextStyle(
                    //color: Colors.black,
                    // fontSize: 12.0.sp
                  ),
                  onChanged: (text) {
                    setState(() {
                      _userPass = text.toString();
                      print(_userPass);
                    });
                  },
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 1,
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 1,
                        )),
                    labelText: 'Password',
                    labelStyle: TextStyle(
                      // fontSize: 12.0.sp,
                        color: Colors.black),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isObscure ? Icons.visibility : Icons.visibility_off,
                        size: 15,
                        color: Colors.black38,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                    ), /*enabledBorder: InputBorder.none*/
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter password';
                    }
                  },
                  onSaved: (val) => setState(() => _user.password = val!),
                ),
              ),
            ),
          ]);

  Widget _rememberMeFunc()=> Container(
    child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              height: 22.0.h,
              width: 22.0.w,
              child: Theme(
                data: ThemeData(
                    unselectedWidgetColor: Colors.white // Your color
                ),
                child: Checkbox(
                    activeColor: Colors.green,
                    value: _isChecked,
                    onChanged: (value){
                      setState(() {
                        _isChecked = value!;
                      });
                    }),
              )),
          SizedBox(width: 8.0.w),
          Text("Remember Me",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.sp,
                  fontFamily: 'Rubic'))
        ]
    ),
  );
  Widget _rememberMeFuncLandscape()=> Container(
    child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              height: 22.0.h,
              width: 22.0.w,
              child: Theme(
                data: ThemeData(
                    unselectedWidgetColor: AppColors.BUTTON_BG_COLOR // Your color
                ),
                child: Checkbox(
                    activeColor: AppColors.BUTTON_BG_COLOR,
                    value: _isChecked,
                    onChanged: (value){
                      setState(() {
                        _isChecked = value!;
                      });
                    }),
              )),
          SizedBox(width: 8.0.w),
          Text("Remember Me",
              style: TextStyle(
                  color: Color(0xff646464),
                  fontSize: 16.sp,
                  fontFamily: 'Rubic'))
        ]
    ),
  );
  void _handleRemember(bool value) async{
    //_isChecked = value;
    if(value==true){
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool("remember_me", value);
      print("Saved User $_emailController");
      print("Saved Pass $_passwordController");
      prefs.setString('email', _emailController.text);
      prefs.setString('password', _passwordController.text);
      prefs.setString('db', selectedDb);

    }


  }

  void _loadUserEmailPassword() async {
    try {
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      _emailSaved = _prefs.getString("email") ?? "";
      _passwordSaved = _prefs.getString("password") ?? "";
      selectedDb = _prefs.getString("db") ?? "";
      _rememberMe = _prefs.getBool("remember_me") ?? false;
      print(_rememberMe);
      print(_emailSaved);
      print(_passwordSaved);
      if (_rememberMe) {
        setState(() {
          _isChecked = true;

        });
        _emailController.text = _emailSaved;
        _passwordController.text = _passwordSaved;
        /*_useName = _emailSaved;
        _passWord = _passwordSaved;*/

      }
    } catch (e)
    {
      print(e);
    }
  }
}
