import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/BottomShetPage.dart';
import 'package:flutter_app/Pages/testPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: BottomSheetPage(),
    );
  }
}

class TestByTest extends StatefulWidget {
  @override
  _TestByTestState createState() => _TestByTestState();
}

class _TestByTestState extends State<TestByTest> {
  TextEditingController controller = TextEditingController();

  var token;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                child: Text('get number'),
                color: Colors.red,
                onPressed: () async {
                  String url = 'https://cf-stage.emtiyaz.app/user/otp';
                  Dio dio = Dio();
                  dio.options.headers["Authorization"] = "Bearer ";
                  Response response = await dio.post(url, data: {'phone_number': '989362404341'});
                  print(response.data);
                },
              ),
            ),
            Padding(padding: const EdgeInsets.all(8.0), child: TextFormField(keyboardType: TextInputType.number, controller: controller)),
            SizedBox(height: 30.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                child: Text('send number with otp'),
                color: Colors.red,
                onPressed: () async {
                  String url = 'https://cf-stage.emtiyaz.app/user/otp';
                  Dio dio = Dio();
                  dio.options.headers["Authorization"] = "Bearer ";
                  Response response = await dio.post(url, data: {'phone_number': '989362404341', 'otp': controller.text.toString()});
                  setState(() {
                    token = response.data['data'];
                  });
                },
              ),
            ),
            SizedBox(height: 30.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => TestPage(token: token)))),
            )
          ],
        ),
      ),
    );
  }
}