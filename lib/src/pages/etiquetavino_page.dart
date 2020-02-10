import 'dart:io';
import  'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pocket_sommelier/src/pages/otro.dart';

class EtiquetaVinoPage extends StatelessWidget {
  File foto;
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
                          _tomarFoto(context);
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

  _tomarFoto(BuildContext context) async {
      _procesarImagen(ImageSource.camera,context);
  }

  _procesarImagen(ImageSource origen, BuildContext context) async  {

      foto = await ImagePicker.pickImage(
          source: origen
      );

      if( foto != null ){
        Navigator.push(context, new MaterialPageRoute(builder: (context) => new IntentoPage(foto:foto)));
      }
  }

  /*  uploadImageToServer(File foto, BuildContext context) async {
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
     //print(response);
     final respStr = await response.stream.bytesToString();
     Vino wine_found = Vino.fromJson(json.decode(respStr));
     print(wine_found.maridaje);
     /*
     final respStr = await response.stream.bytesToString();
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
      */



     //print(response.statusCode);
  }*/

}