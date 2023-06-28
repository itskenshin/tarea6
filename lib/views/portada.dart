import 'package:flutter/material.dart';

class Portada extends StatelessWidget {
  const Portada({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.network(
        fit: BoxFit.cover,
        'https://static.vecteezy.com/system/resources/previews/017/369/747/non_2x/wooden-classic-toolbox-full-of-equipment-flat-cartoon-isolated-illustration-vector.jpg');
  }
}
