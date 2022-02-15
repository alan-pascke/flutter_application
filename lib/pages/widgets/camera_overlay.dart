import 'package:flutter/material.dart';

Widget cameraOverlay({double padding = 50, double aspectRatio = 1}) {
  return LayoutBuilder(builder: (context, constraints) {
    double parentAspectRatio = constraints.maxWidth / constraints.maxHeight;
    double horizontalPadding;
    double verticalPadding;

    if (parentAspectRatio < aspectRatio) {
      horizontalPadding = padding;
      verticalPadding = (constraints.maxHeight -
              ((constraints.maxWidth - .5 * padding) / aspectRatio)) /
          2;
    } else {
      verticalPadding = padding;
      horizontalPadding = (constraints.maxWidth -
              ((constraints.maxHeight - 2 * padding) * aspectRatio)) /
          2;
    }
    return Stack(children: [
      Container(
        margin: EdgeInsets.symmetric(
            horizontal: horizontalPadding, vertical: verticalPadding),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.cyan),
          borderRadius: BorderRadius.circular(150),
        ),
      )
    ]);
  });
}
