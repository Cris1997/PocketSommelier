
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pocket_sommelier/src/models/vino.dart';
import 'package:pocket_sommelier/src/pages/catalogo_ocrpage.dart';
import 'package:pocket_sommelier/src/pages/error_page.dart';
import 'package:pocket_sommelier/src/pages/procesando_page.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'package:path/path.dart' as Path;
import 'package:pocket_sommelier/src/utils/mapa.dart';


class ListaVinosPage extends StatefulWidget {
  File foto;
  ListaVinosPage({this.foto});

  _ListaVinosPage createState() => _ListaVinosPage();
}

class _ListaVinosPage extends State<ListaVinosPage> {
String _result;
@override
    void initState() {
            enviarFotoOCR(widget.foto).then((result) {
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
           if(_result.compareTo("error")==0){
              return new ErrorPage(iderror: 1,);
           }else{
                  //Decodificar los datos a JSON y generar la lista para mostrar en el carrusel
                  var jsonfiles  = json.decode(_result);
                  List<Vino> vinosCarta = new List(); 
                  for (var data in jsonfiles) {
                      final temporal = Vino.fromJson(data);
                      //print(temporal.identificador);
                      //print(temporal.nombre);
                      vinosCarta.add(temporal);
                  }
                  return new CatalogoOCRVinosPage(vinos: vinosCarta);
           } 
        }
        // Mientras no se obtenga respuesta la aplicación mostrara la interfaz gráfica de procesando
        return new ProcesandoPage(idprocess: 1,);
    }

  enviarFotoOCR(File foto) async{
     //print("HOLA");
     var stream  = new http.ByteStream(DelegatingStream.typed(foto.openRead()));
     var length = await foto.length();
     var uri = Uri.parse('http://${IP}/ocr');
     var request = new http.MultipartRequest('POST', uri);
     var multipartFile =  new http.MultipartFile('file', stream, length, filename: Path.basename(foto.path));
     request.files.add(multipartFile);
     var response =  await request.send();
     final respStr = await response.stream.bytesToString();
     if (response.statusCode == 200) {
        return respStr;
     }else{
        return "error";
     }
  } 
  /*sendImagetoServer(File foto) async{

     var stream  = new http.ByteStream(DelegatingStream.typed(foto.openRead()));
     var length = await foto.length();
     var uri = Uri.parse('http://${IP}/ocr');
     var request = new http.MultipartRequest('POST', uri);
     var multipartFile =  new http.MultipartFile('file', stream, length, filename: Path.basename(foto.path));
     request.files.add(multipartFile);
     var response =  await request.send().timeout(Duration(seconds: 8)).then(_merror());
          final respStr = await response.stream.bytesToString();
          if (response.statusCode == 200) {
                return respStr;
           } else {
              return respStr;
           }
          
       }
     
  FutureOr Function(http.StreamedResponse value) _merror() {
          print("Servidor no disponible");
       }  */




}