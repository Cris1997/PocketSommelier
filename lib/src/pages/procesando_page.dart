import 'package:flutter/material.dart';

class ProcesandoPage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
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