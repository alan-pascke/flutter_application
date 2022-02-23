// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import 'package:qr_flutter/qr_flutter.dart';

// ignore: must_be_immutable
class QrCodePage extends StatefulWidget {
  const QrCodePage({Key? key}) : super(key: key);

  @override
  _QrCodePageState createState() => _QrCodePageState();
}

class _QrCodePageState extends State<QrCodePage> {
  String data = '1235652';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[700],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Mostre o QR Code à atendente',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 60),
          Center(
            child: QrImage(
              data: data,
              size: 250,
            ),
          ),
        ],
      ),
    );
  }
}
