import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ClimaScreen extends StatefulWidget {
  const ClimaScreen({super.key});

  @override
  State<ClimaScreen> createState() => _ClimaScreenState();
}

class _ClimaScreenState extends State<ClimaScreen> {
  Future<Map<String, dynamic>> getClima() async {
    const apiUrl =
        "https://api.openweathermap.org/data/2.5/weather?q=Santo%20Domingo,%20DO,uk&APPID=977d3ec1e536480c284b5630817ede6c";

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
    getClima().then((value) {
      print(value);
    });
    return Scaffold(
      body: FutureBuilder(
        future: getClima(),
        builder: (builder, AsyncSnapshot<Map<String, dynamic>> context) {
          if (context.hasData) {
            return Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Text(
                      'Clima',
                      style: TextStyle(fontSize: 30),
                    ),
                    SizedBox(
                      height: 200,
                      child: Image.network(
                        'https://openweathermap.org/img/w/${context.data!['weather'][0]['icon']}.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Santo Domingo , DO',
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text('Resultado'),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'humedad: ${context.data!['main']['humidity']}',
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
