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
    return DraggableScrollableSheet(
      expand: true,
      initialChildSize: 0.4,
      maxChildSize: 0.7,
      minChildSize: 0.2,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          color: Colors.blue[100],
          child: ListView.builder(
            controller: scrollController,
            itemCount: 25,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(title: Text('Item $index'));
            },
          ),
        );
      },
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
      body: Container(height: Util.height(context), width: Util.width(context), child: body()),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

enum AnchoringPosition { topLeft, topRight, bottomLeft, bottomRight, center }
/*
it is a subscribe in last commit
 */
