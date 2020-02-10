

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'package:path/path.dart' as Path;
import 'package:flutter/material.dart';
import 'package:pocket_sommelier/src/models/vino.dart';
import 'package:pocket_sommelier/src/pages/error_page.dart';
import 'package:pocket_sommelier/src/pages/procesando_page.dart';
import 'package:pocket_sommelier/src/pages/vino_detailpage2.dart';
import 'package:pocket_sommelier/src/pages/vinodetail_page.dart';
import 'package:pocket_sommelier/src/utils/mapa.dart';

class IntentoPage extends StatefulWidget {
  File foto;

  IntentoPage({this.foto});

  _IntentoPageState createState() => _IntentoPageState();
}

class _IntentoPageState extends State<IntentoPage> {
var _result;
@override
    void initState() {
        loadAsyncData(widget.foto).then((result) {
            // If we need to rebuild the widget with the resulting data,
            // make sure to use `setState`
            setState(() {
                _result = result;
                  
            });
        });
    }

  @override
  Widget build(BuildContext context) {
     if (_result != null) {
            // This is what we show while we're loading
            //print(_result);
            return new VinoDetailPage2(id:28 );
           /* if(_result){
              
           }else{
              return new ErrorPage();
           } */
            
        }
        // Do something with the `_result`s here
        return new ProcesandoPage();
  }

  loadAsyncData(File foto) async{
    var error;
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
     print(response);
              final respStr = await response.stream.bytesToString();
               Vino wine_found = Vino.fromJson(json.decode(respStr));
     print(wine_found.maridaje);
          if (response.statusCode == 200) {
                return wine_found;
           } else {
              return "error";
             // Navigator.pushNamed(context, '/error');
             // If that response was not OK, throw an error.
             //throw Exception('Fallo al realizar la peticion al servidor');
           }
          //print(response.statusCode);
       } 



}