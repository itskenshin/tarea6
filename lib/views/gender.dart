// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class GenderizeScreen extends StatefulWidget {
  const GenderizeScreen({super.key});

  @override
  State<GenderizeScreen> createState() => _GenderizeScreenState();
}

class _GenderizeScreenState extends State<GenderizeScreen> {
  final input = TextEditingController();
  var resultado = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<String> getGender(String name) async {
    final apiUrl = 'https://api.genderize.io/?name=$name';

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final gender = jsonResponse['gender'];

      resultado = gender;
      return gender;
    } else {
      throw Exception('Failed to retrieve gender.');
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    input.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text(
              'Genderize',
              style: TextStyle(fontSize: 30),
            ),
          
          Container(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  child: Image.asset(
                    'lib/assets/images/fem.png',
                    color: resultado == 'female' ? Colors.pink : Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 50,
                  height: 50,
                  child: Image.asset('lib/assets/images/male.png' , color:  resultado == 'male' ? Colors.blue : Colors.grey ,),
                ),
              ],
            ),
          ),
          const Text('Por favor ingrese un nombre para saber su género'),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: TextField(
              controller: input,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nombre',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              getGender(input.text).then((result) {
                setState(() {
                  resultado = result;
                });
              });
            },
            child: const Text('Enviar'),
          ),
        ],
      ),
    );
  }
}
