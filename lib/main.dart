import 'package:flutter/material.dart';
import 'package:marcoapp/views/agefilter.dart';
import 'package:marcoapp/views/clima.dart';
import 'package:marcoapp/views/contactame.dart';
import 'package:marcoapp/views/gender.dart';
import 'package:marcoapp/views/portada.dart';
import 'package:marcoapp/views/univer.dart';
import 'package:marcoapp/views/wordpress.dart';

const TextStyle tabtextstyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    fontFamily: 'Manrope',
    color: Colors.white);

const TextStyle subtitleStyleText = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    fontFamily: 'Arial',
    color: Colors.white);

const TextStyle paragraphTextStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w200,
  fontFamily: 'Arial',
  letterSpacing: 1,
  height: 1.3,
  color: Color.fromRGBO(255, 255, 255, 1),
);

void main() {
  runApp(const MainApp());
}

class TextSubtitle extends StatelessWidget {
  final String text;
  final TextStyle estilos;

  const TextSubtitle(
      {super.key, required this.text, this.estilos = subtitleStyleText});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: estilos);
  }
}

class TextParagraph extends StatelessWidget {
  final String text;
  final TextStyle estilos;

  const TextParagraph(
      {super.key, required this.text, this.estilos = paragraphTextStyle});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: estilos);
  }
}

// class ContenedorPersonaje extends StatelessWidget {
//   final String nombre;
//   final AssetImage imagen;

//   const TextParagraph(
//       {super.key, required this.text, this.estilos = paragraphTextStyle});

//   @override
//   Widget build(BuildContext context) {
//     return ;
//   }
// }

//!  Estilos para los parrafos con titulo
class Parrafo extends StatelessWidget {
  final String titulo;
  final String descripcion;
  final TextStyle estiloParrafo;
  final TextStyle estiloTitulo;

  const Parrafo(
      {super.key,
      required this.titulo,
      required this.descripcion,
      this.estiloParrafo = paragraphTextStyle,
      this.estiloTitulo = subtitleStyleText});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 20,
            bottom: 20,
          ),
          child: Text(
            titulo,
            style: subtitleStyleText,
          ),
        ),
        Text(
          descripcion,
          style: paragraphTextStyle,
        )
      ],
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(29, 30, 36, 1),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 7, // Número total de pestañas
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(100), // Altura del TabBar
                child: Container(
                    width: double.infinity,
                    color: const Color.fromRGBO(29, 30, 36, 1),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(top: 30, bottom: 20, left: 30),
                          child: Text(
                            "Utility",
                            style: tabtextstyle,
                            textAlign: TextAlign.left,
                          ),
                        ),
                        TabBar(
                          isScrollable: true,
                          tabs: [
                            Center(
                                child: Text(
                              "Utility",
                              style: TextStyle(fontSize: 14),
                            )),
                            Tab(text: 'Gender'),
                            Tab(text: 'Age Filter'),
                            Tab(text: 'Universidades'),
                            Tab(text: 'Clima'),
                            Tab(text: 'Wordpress'),
                            Tab(text: 'Contactame'),
                          ],
                        ),
                      ],
                    )),
              ),
            ),
            SliverFillRemaining(
              child: TabBarView(
                children: [
                  const Portada(),
                  const GenderizeScreen(),
                  const AgeFilterScreen(),
                  const UniversidadScreen(),
                  const ClimaScreen(),
                  const WordPress(),
                  contcontactame,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
