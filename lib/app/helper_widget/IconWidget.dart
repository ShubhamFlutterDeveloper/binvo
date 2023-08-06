// ignore_for_file: file_names

import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {

  final IconData iconData;
  final double size;
  final Color color;
   const IconWidget({Key ?key, required this.iconData, required this.size, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      iconData,size: size,color:color,
    );
  }
}
