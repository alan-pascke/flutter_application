import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController data = TextEditingController();
  DateTime _date = DateTime.now();
  final DateFormat _dateFormat = DateFormat('dd/MM/yyyy');
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
            margin: const EdgeInsets.all(8),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * .56,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
