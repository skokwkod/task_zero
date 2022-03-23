import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class CustomBigPhoto extends StatefulWidget {
  CustomBigPhoto({Key? key, required this.images, required this.id})
      : super(key: key);
  final List images;
  int id;

  @override
  _CustomBigPhotoState createState() => _CustomBigPhotoState();
}

class _CustomBigPhotoState extends State<CustomBigPhoto> {
  String? swipeDirection;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Moje Pasje ' +
            (widget.id + 1).toString() +
            ' z ' +
            widget.images.length.toString()),
      ),
      body: GestureDetector(
        onHorizontalDragUpdate: (details) {
          if (details.delta.dx > 0) {
            setState(() {
              swipeDirection = 'right';
            });
          } else if (details.delta.dx < 0) {
            setState(() {
              swipeDirection = 'left';
            });
          }
        },
        onHorizontalDragEnd: (details) {
          if (swipeDirection == null) {
            return;
          } else if (swipeDirection == 'right') {
            if (widget.id > 0) {
              setState(() {
                widget.id--;
              });
            }
          } else if (swipeDirection == 'left') {
            if (widget.id < widget.images.length - 1) {
              setState(() {
                widget.id++;
              });
            }
          }
        },
        child: PhotoView(
          imageProvider: AssetImage(widget.images[widget.id]),
        ),
      ),
    );
  }
}
