import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomSheetPage extends StatefulWidget {
  @override
  _BottomSheetPageState createState() => _BottomSheetPageState();
}

class _BottomSheetPageState extends State<BottomSheetPage> {

  // test for commit for get documents
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
          height: size.height,
          width: size.width,
          color: Colors.yellow,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                flex: 20,
                child: ListView(
                  children: <Widget>[
                    TextFormField(),
                    TextFormField(),
                    TextFormField(),
                    TextFormField(),
                    TextFormField(),

                  ],
                ),
              ),
              Flexible(
                  flex: 1,
                  fit: FlexFit.loose,
                  child: Container(width: size.width, child: RaisedButton(color: Colors.red, child: Text('BottomSheet 2'), onPressed: () {})))
            ],
          )),
      // bottomSheet: Container(
      //     margin: const EdgeInsets.all(0.0),
      //     width: size.width,
      //     child: RaisedButton(color: Colors.red, child: Text('BottomSheet'), onPressed: () {})),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingActionButton:
      //     Container(width: size.width, margin: const EdgeInsets.all(0.0), child: RaisedButton(color: Colors.red, child: Text('FloatingActionButton'), onPressed: () {})),
    );
  }
}
