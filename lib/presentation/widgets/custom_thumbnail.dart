import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomThumbnail extends StatefulWidget {
  final String? path;
  final String name;
  final Uint8List? bytes;
  final Function() onPress;

  const CustomThumbnail({this.path,required this.name, super.key,required this.onPress,this.bytes});

  @override
  State<CustomThumbnail> createState() => _CustomThumbnailState();
}

class _CustomThumbnailState extends State<CustomThumbnail> {
  bool _visible = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: SizedBox(
        width: 100,
        child: Column(
          children: [
            InkWell(
              onTap: (){
                widget.onPress();
              },
              onHover: (bool hoverIn) {
                if (hoverIn) {
                  setState(() {
                    _visible = true;
                  });
                } else {
                  setState(() {
                    _visible = false;
                  });
                }
              },
              child: Stack(
                children: [
                  _getImageView(bytes: widget.bytes,path:widget.path),
                  Visibility(
                    visible: _visible,
                    child: Container(
                        width: 100,
                        height: 100,
                        color: Colors.white.withOpacity(0.5),
                        child: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        )),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5,),
            Text(widget.name,style:const TextStyle(height: 1.2))

          ],
        ),
      ),
    );
  }

  Widget _getImageView({Uint8List? bytes, String? path}){
    if(bytes != null) {
      return Image.memory(bytes,width: 100,
      height: 100,
      fit: BoxFit.cover,);
    }else if(path != null) {
      return Image.network(
        path,
        width: 100,
        height: 100,
        fit: BoxFit.cover,
      );
    }else{
      return const SizedBox();
    }

  }
}
