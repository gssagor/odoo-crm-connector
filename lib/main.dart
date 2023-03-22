import 'package:call_log_odoo/url_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart';
import 'package:workmanager/workmanager.dart';
import 'package:call_log/call_log.dart';

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask(( task,  inputData) async {
    print('Background Services are Working!');
    try {
      final Iterable<CallLogEntry> cLog = await CallLog.get();
      print('Queried call log entries');
      for (CallLogEntry entry in cLog) {
        print('-------------------------------------');
        print('F. NUMBER  : ${entry.formattedNumber}');
        print('C.M. NUMBER: ${entry.cachedMatchedNumber}');
        print('NUMBER     : ${entry.number}');
        print('NAME       : ${entry.name}');
        print('TYPE       : ${entry.callType}');
        print('DATE       : ${DateTime.fromMillisecondsSinceEpoch(entry.timestamp!)}');
        print('DURATION   : ${entry.duration}');
        print('ACCOUNT ID : ${entry.phoneAccountId}');
        print('ACCOUNT ID : ${entry.phoneAccountId}');
        print('SIM NAME   : ${entry.simDisplayName}');
        print('-------------------------------------');
      }
      return true;
    } on PlatformException catch (e, s) {
      print(e);
      print(s);
      return true;
    }
  });
}

void main() {
  runApp(const MyApp());
  Workmanager().initialize(callbackDispatcher, isInDebugMode: true);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360,690),
        minTextAdapt: true,
        builder:(context,child){
          return MaterialApp(
            home: UrlScreen(),
            //home: Home(),

            debugShowCheckedModeBanner: false,
            theme: ThemeData(fontFamily: 'CircularStd'),
            builder: EasyLoading.init(),

          );
        }
    );
  }
}

