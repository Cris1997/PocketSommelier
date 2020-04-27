import 'dart:io';
import  'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pocket_sommelier/src/pages/camara_page.dart';

class EtiquetaVinoPage extends StatefulWidget {
  @override
  _EtiquetaVinoPageState createState() => _EtiquetaVinoPageState();
}

class _EtiquetaVinoPageState extends State<EtiquetaVinoPage> {
  File _foto;

  @override
  Widget build(BuildContext context) {
    //_procesarImagen(ImageSource.camera);
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
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
                  Text('Esta aplicación solamente puede identificar vinos de la marca Concha y Toro',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    //fontWeight: FontWeight.bold,
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
                                  Navigator.push(context, new MaterialPageRoute(builder: (context) => new CamaraPage()));
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
                              onPressed: ()=>Navigator.of(context).pop(),
                        ),
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