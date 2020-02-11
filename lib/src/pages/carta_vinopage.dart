import 'dart:io';
import  'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pocket_sommelier/src/pages/listavino_page.dart';

class CartaVinosPage extends StatelessWidget {
  File foto; //Almacena la foto que toma el usuario desde su celular
  @override
  Widget build(BuildContext context) {
    //_procesarImagen(ImageSource.camera);
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
              //color: Colors.white,
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
                    mainAxisAlignment: MainAxisAlignment.center,
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
                              _tomarFotoLista(context);
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


  _tomarFotoLista(BuildContext context) async {
      _procesarImagenOCR(ImageSource.camera,context);
  }

  _procesarImagenOCR(ImageSource origen, BuildContext context) async  {
      File foto;
      foto = await ImagePicker.pickImage(
          source: origen
      );
      //La aplicación espera a que el usuario tome una fotografía para poder lanzar una petición al servidor
      if( foto != null ){
        Navigator.push(context, new MaterialPageRoute(builder: (context) => new ListaVinosPage(foto:foto)));
      }
  }
}