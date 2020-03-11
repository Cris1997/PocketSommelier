import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';

import 'error_page.dart';

class ProcesandoPage extends StatefulWidget {
  int idprocess;//Identificaro del vino proveniente de la pantalla anterior
  ProcesandoPage({this.idprocess});
  @override
  _ProcesandoPageState createState() => _ProcesandoPageState();
}

class _ProcesandoPageState extends State<ProcesandoPage> {

   @override
  initState() {
    super.initState();
    new Timer(const Duration(seconds: 10), onClose);
  }
  
  @override
  //File foto;
  Widget build(BuildContext context) {
    //foto = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          children: <Widget>[
             _espectacularApp(),
             _procesandoGif(),
             _labelProcess(),
           ],
          ),
      ),
    );
  }

void onClose() {
    Navigator.of(context).pushReplacement(new PageRouteBuilder(
        maintainState: true,
        opaque: true,
        pageBuilder: (context, _, __) => (widget.idprocess ==0) ? new ErrorPage(iderror: 0,): new ErrorPage(iderror: 1,),
        transitionDuration: const Duration(seconds: 2),
        transitionsBuilder: (context, anim1, anim2, child) {
          return new FadeTransition(
            child: child,
            opacity: anim1,
          );
        }));
}

Widget _espectacularApp(){
  return Container(
                  height: 100,
                  child: Center(child: Text('Pocket Sommelier',
                  style: TextStyle(
                  color: Colors.deepOrangeAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 28
                ),
        )
        ),
  );
}

Widget _procesandoGif(){
  return Image(
                  height: 250,
                  image: AssetImage('assets/loader.gif'),
                  fit: BoxFit.cover,
              );
}

Widget _labelProcess(){
  return Container(
                height: 100,
                child: Center(
                  child: Text(
                    'Procesando...',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    ),)),
              );
}
}