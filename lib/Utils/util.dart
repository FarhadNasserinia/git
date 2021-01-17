import 'package:flutter/cupertino.dart';

abstract class Util {

  static height(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

 static width(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}
