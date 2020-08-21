import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:memogatari/utils/colors.dart';
import 'package:photo_view/photo_view.dart';

class ImageViewer extends StatelessWidget {

  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.black54, elevation: 0,),
      body: Container(
          child: PhotoView(
            minScale: 0.2,
            maxScale: 2.0,
            imageProvider: NetworkImage(data['image']),
          )
      ),
    );
  }
}
