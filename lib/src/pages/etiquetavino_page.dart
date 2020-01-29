import 'dart:io';
import  'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'package:path/path.dart' as Path;

class EtiquetaVinoPage extends StatelessWidget {
  File foto;
  @override
  Widget build(BuildContext context) {
    _procesarImagen(ImageSource.camera);
    return Container(
      child: Text("HOLLAA"),
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

      //setState(() {
        
      //});
  }

  uploadImageToServer(File foto) async {
     //print("Conectando con el servidor....");

     var stream  = new http.ByteStream(DelegatingStream.typed(foto.openRead()));
     var length = await foto.length();
     //print(length);
     var uri = Uri.parse('http://192.168.1.71:5000/predict');
     //print(uri);
     //print("conexion exitosa");
     var request = new http.MultipartRequest('POST', uri);
     var multipartFile =  new http.MultipartFile('file', stream, length, filename: Path.basename(foto.path));
     request.files.add(multipartFile);
     var response =  await request.send();
     //print(response.statusCode);
  }



}