import 'package:flutter/widgets.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // x  = is a width
    // y = is a height
    double radius = 20;

    // Path path = Path()
    //   ..moveTo(radius, 0)
    //   ..lineTo(size.width - radius, 0)
    //   ..arcToPoint(Offset(size.width, radius))
    //   ..lineTo(size.width, size.height - radius)
    //   ..arcToPoint(Offset(size.width - radius, size.height), radius: Radius.circular(radius))
    //   ..lineTo(radius, size.height)
    //   ..arcToPoint(Offset(0, size.height - radius), radius: Radius.circular(radius), clockwise: false)
    //   ..lineTo(0, radius)
    //   ..arcToPoint(Offset(radius, 0), radius: Radius.elliptical(40, 20))
    //   ..close();


    var path = Path();
    path.lineTo(0.0, size.height);
    path.quadraticBezierTo(
        size.width / 2,
        size.height - 100,
        size.width,
        size.height
    );
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
