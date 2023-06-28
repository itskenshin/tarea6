import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UniversidadScreen extends StatefulWidget {
  const UniversidadScreen({super.key});

  @override
  State<UniversidadScreen> createState() => _UniversidadScreenState();
}

class _UniversidadScreenState extends State<UniversidadScreen> {
  final input = TextEditingController();
  late final resultado = [];

  Future<List<dynamic>> getUniv(String name) async {
    final apiUrl = 'http://universities.hipolabs.com/search?country=$name';

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return jsonResponse;
    } else {
      throw Exception('Failed to retrieve gender.');
    }
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              'Universidad',
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text('Por favor ingrese un nombre del pais en ingles'),
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
            SizedBox(
              height: 300,
              child: CustomCard(resultado),
            ),
            ElevatedButton(
              onPressed: () {
                getUniv(input.text).then((result) {
                  setState(() {
                    resultado.clear();
                    resultado.addAll(result);
                  });
                });
              },
              child: const Text('Enviar'),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final List<dynamic> resultado;
  const CustomCard(this.resultado, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: resultado.length,
      itemBuilder: (context, index) {
        return Card(
          child: Column(children: [
            ListTile(
              leading:  const Icon(Icons.school),
              title: Container(child: Text(resultado[index]['name'], softWrap: true, style: const TextStyle(fontSize: 15),)),
              subtitle: Text(resultado[index]['domains'][0] , softWrap: true, style: const TextStyle(fontSize: 10),),
              trailing: Text(resultado[index]['web_pages'][0] , softWrap: true, style: const TextStyle(fontSize: 10)),
            ),
          ]),
        );
      },
    );
  }
}
