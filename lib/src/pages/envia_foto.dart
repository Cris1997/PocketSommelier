

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

class EnviaFotoVinoPage extends StatefulWidget {
  File foto;
  EnviaFotoVinoPage({this.foto});
  _EnviaFotoVinoPageState createState() => _EnviaFotoVinoPageState();
}

class _EnviaFotoVinoPageState extends State<EnviaFotoVinoPage> {
String _result;
@override
void initState() {
          loadAsyncData(widget.foto).then((result) {
            setState(() {
                _result = result;
            });
        });
}

@override
Widget build(BuildContext context) {
    if (_result != null) {
          // This is what we show while we're loading
          if(_result.compareTo("error")==0){
              return new ErrorPage(iderror: 0,);
          }else{
            Vino wine_found = Vino.fromJson(json.decode(_result));
            return new VinoDetailPage(vino: wine_found, flag: 0,);
          } 
        }
        // Mientras no se obtenga respuesta la aplicación mostrara la interfaz gráfica de procesando
        return new ProcesandoPage(idprocess: 0,);
  }

  /*Metodo encargado de convocar al API con el endpoint para clasidficar la fotografía que tomo el usuario */
  loadAsyncData(File foto) async{
    //Abrir la imagen
    var stream  = new http.ByteStream(DelegatingStream.typed(foto.openRead()));
    var length = await foto.length();
    var uri = Uri.parse('http://${IP}/clasificar');
    var request = new http.MultipartRequest('POST', uri);
    var multipartFile =  new http.MultipartFile('file', stream, length, filename: Path.basename(foto.path));
    //Agregramos el archivo a la peticion
    request.files.add(multipartFile);
    var response =  await request.send();
    final respStr = await response.stream.bytesToString();
    //Verificar que la petición se realizó correctamente al servidor     
    if (response.statusCode == 200) {
      return respStr;
    }else{
      return "error";
    }
  } 
}