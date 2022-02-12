import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

const String data = '1235652';

Widget qrcodeGerenator(BuildContext context) {
  return QrImage(
    data: data,
    size: 250,
  );
}
