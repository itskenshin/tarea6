import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';


Padding contcontactame =  Padding(
    padding: const EdgeInsets.only(
      top: 5,
      bottom: 40,
      left: 30,
      right: 30,
    ),
    child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Titulo ("Acerca de")
            const Padding(
              padding: EdgeInsets.only(top: 22, bottom: 10, right: 20),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 12.25),
                    child: Icon(
                      Ionicons.call,
                      color: Colors.black,
                      size: 24,
                    ),
                  ),
                  Text(
                    "Contactame",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            // Subtitulo ("Tal")
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 350,
                    child: const Image(
                      image: AssetImage("lib/assets/images/Perfil3.jpg"),
                    ),
                  ),
                  const Text(
                    "Jonathan Montero Olivo",
                    style: TextStyle(
    
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
    
                    "809-973-0324",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
