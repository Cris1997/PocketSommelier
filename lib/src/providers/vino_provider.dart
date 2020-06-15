
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'package:path/path.dart' as Path;
import 'package:async/async.dart';


import 'package:pocket_sommelier/src/models/vino.dart';
import 'package:pocket_sommelier/src/pages/listavino_page.dart';
import 'package:pocket_sommelier/src/utils/mapa.dart';

class VinoProvider{



Future<Vino> findWine(int id) async {
  var data = await http.get("http://${IP}/foundone/${id}");
  if (data.statusCode == 200) {
    // El codigo 200 indica que la operacion se llevo cabo de manera adecuada, parsear the JSON.
    Vino wine_found = Vino.fromJson(json.decode(data.body));
    return wine_found;
  } else {
    throw Exception('Fallo al realizar la peticion al servidor');
  }
}

/*Este metodo hace la peticion al API para obtener toda la informacion en conjunto 
de todos los vinos que hay en la base de datos */
Future<List<Vino>> findAllWines() async {
  /*EndPoint para obtener la informacion de los vinos  */
  final url = "http://${IP}/allwines/";
  final resp = await http.get(url);
  //Decodificar la respuesta del servidor a una serie de archivos JSON
  var jsonfiles  = json.decode(resp.body);

  final List<Vino> vinos_todo = new List(); 

  for (var data in jsonfiles) {
      final temporal = Vino.fromJson(data);;
      vinos_todo.add( temporal );
  }
  return vinos_todo;
}


//Este metodo invoca al API y hace una solicitud para obtener las recomendaciones
Future<List<Vino>> obtenerRecomendaciones(int id_vino) async {
  /*Se construye la peticion anexando como parametro el identificador del vino 
  que tomara el sistema de recomendacion como referencia para encontrar
  productos similares*/
  final url = "http://${IP}/recomendador?id=${id_vino}";
  final resp = await http.get(url);
  /*Cuando llega la respuesta por parte del servidor decodificamos su contenido a un formato JSON*/ 
  var jsonfiles  = json.decode(resp.body);
  /**Lista de objetos  Vino para guardar los datos de cada producto similar que entrego el recomendador*/
  final List<Vino> vinos_similares = new List(); 
  /**Por cada conjunto de datos se construirá un objeto de tipo Vino */
  for (var data in jsonfiles) {
      final temporal = Vino.fromJson(data);
      vinos_similares.add( temporal );
  }
  return vinos_similares;
}
  
}