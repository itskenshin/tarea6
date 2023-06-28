import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AgeFilterScreen extends StatefulWidget {
  const AgeFilterScreen({super.key});

  @override
  State<AgeFilterScreen> createState() => _AgeFilterScreenState();
}

class _AgeFilterScreenState extends State<AgeFilterScreen> {
  final input = TextEditingController();
  var resultado = 0;
  var estado = '';
  Future<int> getAge(String name) async {
    final apiUrl = 'https://api.agify.io/?name=$name';

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final age = jsonResponse['age'];

      resultado = age;
      return age;
    } else {
      throw Exception('Failed to retrieve gender.');
    }
  }

  @override
  Widget build(BuildContext context) {
    String assets = 'lib/assets/images/niño.jpg';
    if (resultado > 12 && resultado < 18) {
      setState(() {
        assets = 'lib/assets/images/adolescente.jpg';
        estado = 'Adolescente';
      });
    } else if (resultado > 18 && resultado < 60) {
      setState(() {
        assets = 'lib/assets/images/adulto.jpg';
        estado = 'Adulto';
      });
    } else if (resultado >= 60) {
      setState(() {
        assets = 'lib/assets/images/anciano.jpg';
        estado = 'Anciano';
      });
    }
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            'Age Filter',
            style: TextStyle(fontSize: 30),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text('Por favor ingrese un nombre para saber su edad'),
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: input,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Nombre',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: 200,
            height: 200,
            child: Image.asset(
              assets,
            ),
          ),
          Text('Edad: ${resultado.toString()}'),
          Text('Estado: $estado'),
          ElevatedButton(
            onPressed: () {
              getAge(input.text).then((result) {
                setState(() {
                  resultado = result;
                });
              });
            },
            child: const Text('Enviar'),
          ),
        ],
      ),
    ));
  }
}
