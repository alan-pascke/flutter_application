import 'package:flutter/material.dart';

final dropValue = ValueNotifier('');
final dropOpcoes = [
  'Unimed - unidade 1',
  'Unimed - unidade 2',
  'Unimed - unidade 3'
];
Widget dropDBTunidade(BuildContext context) {
  return ValueListenableBuilder(
    valueListenable: dropValue,
    builder: (BuildContext context, String value, _) {
      return DropdownButtonFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        hint: const Text(
          "Selecione o laboratório/clinica",
          style: TextStyle(fontSize: 16),
        ),
        value: (value.isEmpty) ? null : value,
        onChanged: (opcaoUnidades) =>
            dropValue.value = opcaoUnidades.toString(),
        items: dropOpcoes
            .map(
              (op) => DropdownMenuItem(
                value: op,
                child: Text(op),
              ),
            )
            .toList(),
      );
    },
  );
}
