import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TelaInicial extends StatefulWidget {
  const TelaInicial({Key? key}) : super(key: key);

  @override
  _TelaInicialState createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  final _formkey = GlobalKey<FormState>();

  late File foto;
  late File fototemp;

  void acessarCamera() async {
    fototemp =
        (await ImagePicker().pickImage(source: ImageSource.camera)) as File;
    setState(() {
      foto = fototemp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blueAccent,
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Container(
            margin: const EdgeInsets.only(
              left: 40,
              top: 100,
              right: 40,
              bottom: 5,
            ),
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Center(
                    child: Text(
                      "Check-in Seguro",
                      style: TextStyle(fontSize: 32, color: Colors.blue),
                    ),
                  ),
                ),
                Center(
                  child: TextFormField(
                    //controller:
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Campo obrigatório";
                      } else {
                        return null;
                      }
                    },
                    decoration: const InputDecoration(labelText: "Login: "),
                    style: const TextStyle(fontSize: 20),
                    maxLength: 40,
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                Center(
                  child: TextFormField(
                    //controller:
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Campo obrigatório";
                      } else {
                        return null;
                      }
                    },
                    decoration: const InputDecoration(labelText: "Senha: "),
                    style: const TextStyle(fontSize: 20),
                    maxLength: 30,
                    obscureText: true,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 45),
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 45,
                        child: ElevatedButton(
                          // estilo para deixar botão arredondado
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              if (_formkey.currentState!.validate()) {}
                            });
                          },
                          child: const Text(
                            "Entrar",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                      const SizedBox(height: 80),
                      Column(
                        children: [
                          Center(
                            child: SizedBox(
                              width: 65,
                              height: 65,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: const Color(0xffC0C0C0),
                                  shape: const CircleBorder(),
                                  shadowColor: const Color(0xffA9A9A9),
                                ),
                                onPressed: () {
                                  acessarCamera();
                                },
                                child: const Image(
                                  image: AssetImage('assets/face-scan.png'),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
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
