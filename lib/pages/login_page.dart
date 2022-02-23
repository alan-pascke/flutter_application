import 'package:flutter/material.dart';
import 'package:flutter_application/pages/open_camera.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[700],
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Container(
            margin: const EdgeInsets.only(
              left: 40,
              top: 140,
              right: 40,
              bottom: 5,
            ),
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Center(
                    child: Text(
                      "Check-in Seguro",
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
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
                    decoration: const InputDecoration(
                      labelText: "Login: ",
                      labelStyle: TextStyle(color: Colors.white),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                    cursorColor: Colors.white,
                    maxLength: 40,
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Center(
                  child: TextFormField(
                    //controller:
                    decoration: const InputDecoration(
                      labelText: "Senha: ",
                      labelStyle: TextStyle(color: Colors.white),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Campo Obrigatorio";
                      } else {
                        return null;
                      }
                    },
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                    cursorColor: Colors.white,
                    maxLength: 30,
                    obscureText: true,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 45),
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 45,
                        child: OutlinedButton(
                          // estilo para deixar botão arredondado
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            primary: Colors.green,
                            side: const BorderSide(
                                color: Color(0xff197a0d), width: 2),
                          ),
                          onPressed: () {
                            setState(() {
                              if (_formkey.currentState!.validate()) {}
                            });
                          },
                          child: const Text(
                            "Entrar",
                            style: TextStyle(
                              fontSize: 20,
                            ),
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
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  side: const BorderSide(color: Colors.white),
                                  shape: const CircleBorder(),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const OpenCamera(),
                                      fullscreenDialog: true,
                                    ),
                                  );
                                },
                                child: const Image(
                                  image:
                                      AssetImage('assets/scanner-de-rosto.png'),
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
