import 'dart:io';
import 'dart:convert';
import  'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'package:path/path.dart' as Path;
import 'package:pocket_sommelier/src/models/vino.dart';
import 'package:pocket_sommelier/src/utils/mapa.dart';
 
class InicioPage extends StatefulWidget {
  @override
  _InicioPageState createState() => _InicioPageState();
}

class _InicioPageState extends State<InicioPage> {
  
  File foto;
  
  @override
  Widget build(BuildContext context) {
    var column = Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
              _mostrarLogo(),
              Container(
              height: 200,
              margin: EdgeInsets.all(10),
              color: Colors.black,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                      width: 200, // match_parent
                      child: _botonEtiqueta()
                  ),
                  SizedBox(
                      width: 200, // match_parent
                      child: _botonLista()
                  ),
                  SizedBox(
                      width: 200, // match_parent
                      child: _botonConoce()
                  ),
                  SizedBox(
                      width: 200, // match_parent
                      child: _botonRegresar()
                  ),
                ],
              ),
            ),
              ],
            );
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: <Widget>[
            Container(
                  height: 100,
                  child: Center(child: Text('Pocket Sommelier',
                  style: TextStyle(
                  color: Colors.deepOrangeAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 28
                ),
            )),
            ),
            column
        ],)
    );
  }

 void _mostrarAlert(BuildContext context) {

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context){
        return AlertDialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              //title: Text('Informacion'),
              content : Column(
                mainAxisSize: MainAxisSize.min,
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
                              child: Text('Cancelar', 
                                          style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold
                                                  )
                                          ),
                              onPressed: ()=>Navigator.of(context).pop(),
                        ),
                        FlatButton(
                            color:  Colors.deepOrangeAccent,
                            focusColor: Colors.black,
                            shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  side: BorderSide(
                                        color: Colors.deepOrangeAccent,
                                        width: 1,
                                        style: BorderStyle.solid
                                  )
                            ),
                            child: Text(
                                      'Continuar', 
                                      style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold
                                              )
                                              ),
                            
                        onPressed: _tomarFoto,
                            //Navigator.of(context).pop();
                        ),
                    ],)
                  //FlutterLogo( size:100.0)
                ],
              ),
          );
      }

    );

  } 

    _tomarFoto() async {
      _procesarImagen(ImageSource.camera);
  }

    _seleccionarFoto() async {
      _procesarImagen(ImageSource.gallery);
  }


  

  //Métodos para mostrar organizadamente los elementos de la interfaz gráfica
  Widget _mostrarLogo(){
      return Image(
                  height: 250,
                  image: AssetImage('assets/iconoPS.JPG'),
                  fit: BoxFit.cover,
              );
  }



  Widget _botonEtiqueta(){

  return RaisedButton(
        //padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 60.0),
        textColor: Colors.white,
        child: Text(
                    "Etiqueta de vino",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0
                    ),
                    ),
        color: Colors.deepOrangeAccent,
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(10.0),
        ),
        onPressed: () {
          //Navigator.push(context, new MaterialPageRoute(builder: (context) => new UIinfo()))
          //_mostrarAlert(context);
          Navigator.pushNamed(context,'/foto_etiqueta');
        },
      );
}

Widget _botonLista(){

  return RaisedButton(
        //padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 60.0),
        textColor: Colors.white,
        child: Text(
                "Lista de vinos",
                style: TextStyle( 
                   fontWeight: FontWeight.bold,
                   fontSize: 14.0,
                ),
                ),
        color: Colors.deepOrangeAccent,
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(10.0),
        ),
        onPressed: () {},
      );
}


Widget _botonConoce(){
  
  return RaisedButton(
                
                //padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 60.0),
                color: Colors.deepOrangeAccent,
                shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0),
                ),
                textColor: Colors.white,
                child: Text('Conoce otros vinos',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    //fontStyle: FontStyle.,
                    textBaseline: TextBaseline.alphabetic
                ),),
                onPressed:() => Navigator.pushNamed(context, '/catalogo',),
              );


}

Widget _botonRegresar(){
    return RaisedButton(
              
                //padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 60.0),
                color: Colors.deepOrangeAccent,
                shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0),
                ),
                textColor: Colors.white,
                child: Text('Regresar',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    //fontStyle: FontStyle.,
                    textBaseline: TextBaseline.alphabetic
                ),),
                onPressed: ()=>Navigator.pushNamed(context, '/'),
              );
}


_procesarImagen(ImageSource origen) async  {

      foto = await ImagePicker.pickImage(
          source: origen
      );

      if( foto != null ){
        //producto.fotoUrl = null;
        //print(foto.path);
        uploadImageToServer(foto);
       // Navigator.push(context, new MaterialPageRoute(builder: (context) => new Captura()));
      }

      setState(() {
        
      });
  }

  uploadImageToServer(File foto) async {
     //print("Conectando con el servidor....");

     var stream  = new http.ByteStream(DelegatingStream.typed(foto.openRead()));
     var length = await foto.length();
     //print(length);
     var uri = Uri.parse('http://${IP}/predict');
     //print(uri);
     //print("conexion exitosa");
     var request = new http.MultipartRequest('POST', uri);
     var multipartFile =  new http.MultipartFile('file', stream, length, filename: Path.basename(foto.path));
     request.files.add(multipartFile);
     var response =  await request.send();
     final respStr = await response.stream.bytesToString();
     print(respStr);
     if (response.statusCode == 200) {
           int d = respStr.compareTo("error");
           if(d < 0){
              Navigator.pushNamed(context, '/infovino',arguments: int.parse(respStr));
           }else{
              Navigator.pushNamed(context, '/error');
           } 
      } else {
         Navigator.pushNamed(context, '/error');
        // If that response was not OK, throw an error.
        //throw Exception('Fallo al realizar la peticion al servidor');
      }
     //print(response.statusCode);
  }

}

