import 'package:flutter/cupertino.dart';

/// This is used for the top bar under the navbar.
///
class TopBoxClipper extends CustomClipper<Path>{
  const TopBoxClipper();

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {

    throw UnimplementedError();
  }
  @override
  getClip(Size size) {
    Path path = Path();
    double height = size.height;
    double width = size.width;

    path.moveTo(0,0);
    path.lineTo(width,0);
    path.lineTo(width,height);
    path.quadraticBezierTo(width,height*0.8,width*0.8,size.height*0.8);
    path.cubicTo(width*0.7,height*0.8,size.width*0.3,size.height*0.8,size.width*0.2,size.height*0.8);
    path.quadraticBezierTo(0.0,size.height*0.8,0,size.height*0.6);
    path.lineTo(0,0);
    path.close();


    return path;
  }


}
