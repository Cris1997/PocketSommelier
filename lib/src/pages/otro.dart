

import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'package:path/path.dart' as Path;
import 'package:flutter/material.dart';
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
        // This is the proper place to make the async calls
        // This way they only get called once

        // During development, if you change this code,
        // you will need to do a full restart instead of just a hot reload
        
        // You can't use async/await here,
        // We can't mark this method as async because of the @override
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
            print(_result);
            int d = _result.compareTo("error");
            if(d < 0){
              return new VinoDetailPage2(id:int.parse(_result) );
           }else{
              return new ErrorPage();
           } 
            
        }
        // Do something with the `_result`s here
        return new ProcesandoPage();
  }

  loadAsyncData(File foto) async{

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
     if (response.statusCode == 200) {
           return respStr;
      } else {
         return respStr;
        // Navigator.pushNamed(context, '/error');
        // If that response was not OK, throw an error.
        //throw Exception('Fallo al realizar la peticion al servidor');
      }
     //print(response.statusCode);
  }



}