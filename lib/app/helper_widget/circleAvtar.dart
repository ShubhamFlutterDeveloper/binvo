// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CircleAvtarWidget extends StatefulWidget {
  final double circleAvtarradius;
  final String? url;
  final Color ?color;
  final Color?background;
  final String ?urlImage;
  final Color? borderColor;
  const CircleAvtarWidget({Key? key, required this.url,  this.color,  this.background,required this.circleAvtarradius, this.urlImage, this.borderColor}) : super(key: key);

  @override
  State<CircleAvtarWidget> createState() => _CircleAvtarWidgetState();
}

class _CircleAvtarWidgetState extends State<CircleAvtarWidget> {

  @override
  Widget build(BuildContext context) {
    String others="http";
ImageProvider image(){
  if(widget.url != null){
    if(widget.url==""){
      return  AssetImage(widget.url.toString());
    }else if(widget.url!.contains(others)){
      return NetworkImage(widget.url.toString());
    }else{
      return AssetImage(widget.url.toString());
    }

  }else{
    return const AssetImage("assets/placeholder.png");
  }

}
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.circleAvtarradius)
     ),
      child: CircleAvatar(
        radius: widget.circleAvtarradius,
        backgroundColor: widget.background,
        backgroundImage:image(),
      ),
    );
  }
}
