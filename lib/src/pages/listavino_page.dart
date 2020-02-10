
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
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
var _result;
@override
    void initState() {
        sendImagetoServer(widget.foto).then((result) {
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
             // return new VinoDetailPage2(id:int.parse(_result) );
           }else{
              return new ErrorPage();
           } 
            
        }
        // Do something with the `_result`s here
        return new ProcesandoPage();
  }

  sendImagetoServer(File foto) async{

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
       }  



}