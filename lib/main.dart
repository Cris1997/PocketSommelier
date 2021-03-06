import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pocket_sommelier/src/pages/carta_vinopage.dart';
import 'package:pocket_sommelier/src/pages/edad_page.dart';
import 'package:pocket_sommelier/src/pages/error_page.dart';
import 'package:pocket_sommelier/src/pages/etiquetavino_page.dart';
import 'package:pocket_sommelier/src/pages/inicio_page.dart';
import 'package:pocket_sommelier/src/pages/procesando_page.dart';
import 'package:pocket_sommelier/src/pages/vinodetail_page.dart';


//Función  principal 
void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
    title: 'Pocket Sommelier',
    color: Colors.deepOrangeAccent,
    debugShowCheckedModeBanner: false,
    theme: ThemeData(accentColor: Colors.deepOrangeAccent),
    initialRoute: '/',
    routes: {
      // Pantalla inicial al arrancar el app
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
    );
  }
}


