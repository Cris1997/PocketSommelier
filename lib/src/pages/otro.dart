

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'package:path/path.dart' as Path;
import 'package:flutter/material.dart';
import 'package:pocket_sommelier/src/models/vino.dart';
import 'package:pocket_sommelier/src/pages/error_page.dart';
import 'package:pocket_sommelier/src/pages/procesando_page.dart';
import 'package:pocket_sommelier/src/pages/vinodetail_page.dart';
import 'package:pocket_sommelier/src/utils/mapa.dart';

class IntentoPage extends StatefulWidget {
  File foto;
  IntentoPage({this.foto});
  _IntentoPageState createState() => _IntentoPageState();
}

class _IntentoPageState extends State<IntentoPage> {
String _result;
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
           print(_result);
           if(_result.compareTo("error")==0){
              return new ErrorPage();
           }else{
             Vino wine_found = Vino.fromJson(json.decode(_result));
             print(wine_found.nombre);
             //return new VinoDetailPage2(id:28 );
             return new VinoDetailPage(vino: wine_found);
           } 
        }
        // Mientras no se obtenga respuesta la aplicación mostrara la interfaz gráfica de procesando
        return new ProcesandoPage();
  }

  loadAsyncData(File foto) async{
    
     var stream  = new http.ByteStream(DelegatingStream.typed(foto.openRead()));
     var length = await foto.length();
     var uri = Uri.parse('http://${IP}/clasificar');
     var request = new http.MultipartRequest('POST', uri);
     var multipartFile =  new http.MultipartFile('file', stream, length, filename: Path.basename(foto.path));
     request.files.add(multipartFile);
     var response =  await request.send();
     final respStr = await response.stream.bytesToString();
     //Vino wine_found = Vino.fromJson(json.decode(respStr));
     //Verificar que la petición se realizó correctamente al servidor     
     if (response.statusCode == 200) {
        //Si la petición tuvo una respuesta la 
        //Vino wine_found = Vino.fromJson(json.decode(respStr));
        //return wine_found;
        return respStr;
     }else{
        return "error";
        //Navigator.pushNamed(context, '/error');
    }
  } 
}