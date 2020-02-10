import 'package:flutter/material.dart';
import 'package:pocket_sommelier/src/pages/carta_vinopage.dart';
import 'package:pocket_sommelier/src/pages/edad_page.dart';
import 'package:pocket_sommelier/src/pages/error_page.dart';
import 'package:pocket_sommelier/src/pages/etiquetavino_page.dart';
import 'package:pocket_sommelier/src/pages/inicio_page.dart';
import 'package:pocket_sommelier/src/pages/procesando_page.dart';
import 'package:pocket_sommelier/src/pages/vinodetail_page.dart';



void main() {
  runApp(MaterialApp(
    title: 'Pocket Sommelier',
    color: Colors.deepOrangeAccent,
    // Start the app with the "/" named route. In this case, the app starts
    // on the FirstScreen widget.
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      // Pantalla inicial al abrir la app
      '/': (context) => EdadPage(),
      //Pantalla inicio de usuaerio
      '/inicio': (context) => InicioPage(),
      //Pantalla que muestra la información de un vino
      '/infovino': (context) => VinoDetailPage(),
      //Pantalla para la camara de etiqueta de vino
      '/foto_etiqueta': (context) => EtiquetaVinoPage(),
      //Pantalla para la camara de la carta de vinos
      '/foto_carta':  (context) => CartaVinosPage(),
      //Pantalla de error al reconocer vinos en la carta o en la foto de etiqueta
      '/error': (context) => ErrorPage(),
      //Pantalla que muestra al usuario que se está procesando una fotografía
      '/procesando': (context) => ProcesandoPage(),
    },
  ));
}
