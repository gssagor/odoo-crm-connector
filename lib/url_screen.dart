import 'package:call_log_odoo/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'CommonClasses & Constants/app_constants.dart';
import 'home.dart';

class UrlScreen extends StatefulWidget {


  @override
  _UrlScreenState createState() => _UrlScreenState();
}

class _UrlScreenState extends State<UrlScreen> {
  late Size size;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _urlInputController = TextEditingController();
  var _rememberMe;
  bool _isChecked = false;
  var _urlSaved;

  @override
  void initState() {
    //_checkVersion();
    _loadsavedUrl();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      color: Colors.teal,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [



          Padding(
            padding: EdgeInsets.symmetric(horizontal:25, vertical: 0),
            child: Form(key: _formKey, child: _urlInputRow()),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal:25, vertical: 8),
            child: _rememberMeFunc(),
          ),

          SizedBox(height: 30.h,),

          MaterialButton(
            onPressed: ()  async{

              final SharedPreferences prefs = await SharedPreferences.getInstance();
              var url = prefs.getString('url');
              //var result= await CommonFunctions().checkInternet();
              // if(result==true){
              _handleRemember(_isChecked);
              final form = _formKey.currentState;
              if (form!.validate()) {
                form.save();
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
                //_showDialog(context);
              }

              // }
            },
            child: Text(
              'Next',
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
                side:BorderSide(color: Colors.white,width: 2.0)
            ),

          ),


        ],
      ),
    );
  }
  void _handleRemember(bool value) async{
    //_isChecked = value;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("remember_url", value);
    prefs.setString('url', _urlInputController.text);

  }
  Widget _rememberMeFunc()=> Container(
    child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
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
                  fontSize: 13.sp,
                  fontFamily: 'Rubic'))
        ]
    ),
  );
  Widget _rememberMeFuncLandscape()=> Container(
    child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
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
          SizedBox(width: 5.0.w),
          Text("Remember Me",
              style: TextStyle(
                  color: Color(0xff646464),
                  fontSize: 18.sp,
                  fontFamily: 'Rubic'))
        ]
    ),
  );
  Widget _urlInputRow() =>
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child:TextFormField(

                //autofillHints: [_emailSaved],
                controller: _urlInputController,
                textInputAction: TextInputAction.done,
                style: TextStyle(
                  color: Colors.white,
                  // fontSize: 12.0.sp
                ),
                /*onChanged: (text){
                  setState(() {
                    _useName= text.toString();
                    print(_useName);
                  });
                },*/
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,width: 1,
                        )
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,width: 1,
                        )
                    ),
                    labelText: 'URL/Server IP',
                    labelStyle: TextStyle(
                      // fontSize: 12.0.sp,
                        color: Colors.white)),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter URL';
                  }
                },
                onSaved: (val) => setState(() => URLConstants.baseUrl= val!),
              ),
            ),
          ]);

  void _loadsavedUrl() async {
    try {
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      //_emailSaved = _prefs.getString("email") ?? "";
      _urlSaved = _prefs.getString("url") ?? "";
      _rememberMe = _prefs.getBool("remember_url") ?? false;
      print(_rememberMe);
      print("saved url: "+_urlSaved);
      if (_rememberMe) {
        setState(() {
          _isChecked = true;

        });
        // _emailController.text = _emailSaved;
        _urlInputController.text = _urlSaved;
        /*_useName = _emailSaved;
        _passWord = _passwordSaved;*/

      }
    } catch (e)
    {
      print(e);
    }
  }
}
