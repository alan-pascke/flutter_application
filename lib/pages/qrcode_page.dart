import 'package:flutter/material.dart';
import 'package:flutter_application/pages/widgets/gerar_qrcode.dart';

class QrCodePage extends StatefulWidget {
  const QrCodePage({Key? key}) : super(key: key);

  @override
  _QrCodePageState createState() => _QrCodePageState();
}

class _QrCodePageState extends State<QrCodePage> {
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
            child: qrcodeGerenator(context),
          ),
        ],
      ),
    );
  }
}
