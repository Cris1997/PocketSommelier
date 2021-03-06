import 'dart:io';
import  'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pocket_sommelier/src/pages/camara_listapage.dart';
import 'package:pocket_sommelier/src/pages/listavino_page.dart';

/*Esta pantalla muestra la notificacion de enfocar la camara a la lista de vinos*/
class CartaVinosPage extends StatelessWidget {
  File foto; //Almacena la foto que toma el usuario desde su celular
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,//Fondo color negro
        body: Center(//Alineación del Widget
          child: Column( // Creación de columnas de widgets
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                  color: Colors.deepOrangeAccent,
                  width: 8,
                        ),
              borderRadius: BorderRadius.circular(12),
              ),
              height: 200,
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text('Enfoca la cámara hacia la carta de vinos',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                        FlatButton(
                              color: Colors.deepOrangeAccent,
                              focusColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                          color: Colors.deepOrangeAccent,
                                          width: 1,
                                          style: BorderStyle.solid
                                      ), 
                                  borderRadius: BorderRadius.circular(30)
                              ),
                              child: Text('Continuar', 
                                          style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold
                                                  )
                                          ),
                              onPressed:(){
                                Navigator.push(context, new MaterialPageRoute(builder: (context) => new CamaraListaPage()));
                          },
                        ),
                        FlatButton(
                              color: Colors.deepOrangeAccent,
                              focusColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                          color: Colors.deepOrangeAccent,
                                          width: 1,
                                          style: BorderStyle.solid
                                      ), 
                                  borderRadius: BorderRadius.circular(30)
                              ),
                              child: Text('Cancelar', 
                                          style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold
                                                  )
                                          ),
                              onPressed:(){
                                Navigator.pop(context);
                          },
                        )
                    ],
                  )
                  
                ],
              ),
            ),
          ],
        ),
        )
        
    );
  }
}