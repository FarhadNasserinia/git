import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Utils/util.dart';

class BottomSheetPage extends StatefulWidget {
  @override
  _BottomSheetPageState createState() => _BottomSheetPageState();
}

class _BottomSheetPageState extends State<BottomSheetPage> {
  bool internetCheck;
  // check internal connection without dependency ;
  Future internetConnection() async {
    try {
      final response = await InternetAddress.lookup('www.kindacode.com');
      if (response.isNotEmpty) setState(() => internetCheck = true);
      print('in response good : => $response');
    } on SocketException catch (err) {
      setState(() => internetCheck = false);
      print(err);
      print('Connection is off');
    }
  }

  Widget body() {
    return Container(
      height: Util.height(context) * 0.9,
      width: Util.width(context),
      color: Colors.green,
      child: Center(child: Text('${Util.height(context) * 1}')),
    );
  }

  @override
  void initState() {
    internetConnection();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: body(),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

/*
it is a subscribe in last commit
 */
