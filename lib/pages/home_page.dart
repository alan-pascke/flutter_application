import 'package:flutter/material.dart';
import 'package:flutter_application/pages/qrcode_page.dart';
import 'package:flutter_application/pages/widgets/vltsner_doutores.dart';
import 'package:flutter_application/pages/widgets/vlstner_unidades.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //
  //
  final _formkey = GlobalKey<FormState>();

  TextEditingController data = TextEditingController();

  DateTime _date = DateTime.now();

  final DateFormat _dateFormat = DateFormat('dd/MM/yyyy');

  final String dataQr = '123456';

  Future<void> _selectcDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
    );
    if (picked != null && picked != _date) {
      setState(() {
        _date = picked;
        data.text = _dateFormat.format(_date).toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        centerTitle: true,
        title: const Text(
          "Check-in Seguro",
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Container(
            margin: const EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                const SizedBox(height: 25),
                Container(
                  width: MediaQuery.of(context).size.width * .8,
                  height: MediaQuery.of(context).size.width * .14,
                  child: TextFormField(
                    readOnly: true,
                    controller: data,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.date_range),
                      border: OutlineInputBorder(),
                      hintText: "Data Consulta/Exame",
                    ),
                    onTap: () {
                      _selectcDate(context);
                    },
                  ),
                ),
                const SizedBox(height: 50),
                Container(
                  width: MediaQuery.of(context).size.width * .8,
                  height: MediaQuery.of(context).size.width * .14,
                  child: dropDBTunidade(context),
                ),
                const SizedBox(height: 50),
                Container(
                  width: MediaQuery.of(context).size.width * .8,
                  height: MediaQuery.of(context).size.width * .14,
                  child: dropDBTdoutores(context),
                ),
                const SizedBox(height: 50),
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * .56,
                    height: MediaQuery.of(context).size.width * .14,
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(side: BorderSide.none),
                        child: Row(
                          children: const [
                            Image(
                              image: AssetImage('assets/qr-code.png'),
                            ),
                            Text(
                              'Gerar QR CODE',
                              style: TextStyle(fontSize: 16),
                            )
                          ],
                        ),
                        onPressed: () {
                          Navigator.pop;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const QrCodePage(),
                            ),
                          );
                        }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
