import 'package:flutter/cupertino.dart';
import 'package:call_log/call_log.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Iterable<CallLogEntry> _callLogEntries = <CallLogEntry>[];
  @override
  Widget build(BuildContext context) {
    const TextStyle mono = TextStyle(fontFamily: 'monospace');
    final List<Widget> children = <Widget>[];
    for (CallLogEntry entry in _callLogEntries) {
      children.add(
        Column(
          children: <Widget>[
            const Divider(),
            Text('F. NUMBER  : ${entry.formattedNumber}', style: mono),
            Text('C.M. NUMBER: ${entry.cachedMatchedNumber}', style: mono),
            Text('NUMBER     : ${entry.number}', style: mono),
            Text('NAME       : ${entry.name}', style: mono),
            Text('TYPE       : ${entry.callType}', style: mono),
            Text('DATE       : ${DateTime.fromMillisecondsSinceEpoch(entry.timestamp!)}',
                style: mono),
            Text('DURATION   : ${entry.duration}', style: mono),
            Text('ACCOUNT ID : ${entry.phoneAccountId}', style: mono),
            Text('SIM NAME   : ${entry.simDisplayName}', style: mono),
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
        ),
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        appBar: AppBar(title: const Text('call log'),
        backgroundColor: Colors.teal,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 10),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MaterialButton(
                    onPressed: () async {
                      final Iterable<CallLogEntry> result = await CallLog.query();
                      setState(() {
                        _callLogEntries = result;
                      });
                    },
                    child: Text(
                      'Get Logs',
                      style: TextStyle(
                          fontSize: 14.0.sp,
                          // fontFamily: 'SFUIDisplay',
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    color: Colors.teal,
                    elevation: 3,
                    minWidth: 130.0.w,
                    height: 40.0.h,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r),
                        side: BorderSide(color: Colors.teal, width: 2.0)),
                  ),
                ),
              ),





              // Center(
              //   child: Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: ElevatedButton(
              //       onPressed: () {
              //         Workmanager().registerOneOffTask(
              //           DateTime.now().millisecondsSinceEpoch.toString(),
              //           'simpleTask',
              //           existingWorkPolicy: ExistingWorkPolicy.replace,
              //         );
              //       },
              //       child: const Text('Get all in background'),
              //     ),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: children),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
