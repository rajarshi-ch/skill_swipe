import 'package:flutter/material.dart';

class DragHandler extends StatelessWidget {
  const DragHandler({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const double handleWidth = 40;
    const double handleHeight = 16;
    const double lineHeight = 2;
    return SizedBox(
      height: lineHeight,
      child: Stack(clipBehavior: Clip.none, children: [
        Container(
          height: lineHeight,
          width: size.width - 18,
          color: Colors.black,
        ),
        Positioned(
          top: -(handleHeight / 2) + (lineHeight / 2),
          left: (size.width / 2) - 8 - (handleWidth / 2), // Center horizontally

          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: handleWidth, // Width of the rectangle
                height: handleHeight, // Height of the rectangle
                decoration: BoxDecoration(
                  color: Colors.black, // Color of the rectangle
                  borderRadius:
                      BorderRadius.circular(10), // Rounded corner radius
                ),
                child: Center(
                    child: Icon(
                  Icons.drag_handle,
                  color: Colors.white,
                  size: handleHeight,
                )),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
