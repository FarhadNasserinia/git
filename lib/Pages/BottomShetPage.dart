import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Utils/util.dart';

class BottomSheetPage extends StatefulWidget {
  @override
  _BottomSheetPageState createState() => _BottomSheetPageState();
}

class _BottomSheetPageState extends State<BottomSheetPage> {
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
    // TODO: implement initState
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
    // TODO: implement dispose
    super.dispose();
  }
}

// for this commit test ;