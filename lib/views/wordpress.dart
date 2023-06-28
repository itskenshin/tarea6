import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WordPress extends StatefulWidget {
  const WordPress({super.key});

  @override
  State<WordPress> createState() => _WordPressState();
}

class _WordPressState extends State<WordPress> {
  Future<List<dynamic>> getwordpress() async {
    const apiUrl = 'https://sylvesterstallone.com/wp-json/wp/v2/posts';

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
    RegExp exp = RegExp(r'[^a-zA-Z\s]');

    return Scaffold(
      body: FutureBuilder(
          future: getwordpress(),
          builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    const Text(
                      'WordPress',
                      style: TextStyle(fontSize: 30),
                    ),
                    SizedBox(
                      height: 200,
                      child: Image.network(
                        snapshot.data![0]['jetpack_featured_media_url'],
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Titulares',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                      child: Column(
                        children: [
                          Text(
                            snapshot.data![0]['title']['rendered']
                                .replaceAll(exp, ''),
                            style: const TextStyle(fontSize: 13),
                          ),
                          GestureDetector(
                            child: Text(
                              snapshot.data![0]['link'],
                              style: const TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                      child: Column(
                        children: [
                          Text(
                            snapshot.data![1]['title']['rendered']
                                .replaceAll(exp, ''),
                            style: const TextStyle(fontSize: 13),
                          ),
                          GestureDetector(
                            child: Text(
                              snapshot.data![1]['link'],
                              style: const TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                      child: Column(
                        children: [
                          Text(
                            snapshot.data![3]['title']['rendered']
                                .replaceAll(exp, ''),
                            style: const TextStyle(fontSize: 13),
                          ),
                          GestureDetector(
                            child: Text(
                              snapshot.data![3]['link'],
                              style: const TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
