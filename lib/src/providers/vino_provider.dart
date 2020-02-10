
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
  print(data);
  //var jsondata = json.decode(data.body);
  if (data.statusCode == 200) {
    // EL codigo 200 indica que la operacion se llevo cabo de manera adecuada, parsear the JSON.
    Vino wine_found = Vino.fromJson(json.decode(data.body));
    //print(wine_found.maridaje);
    return wine_found;

  } else {
    // If that response was not OK, throw an error.
    throw Exception('Fallo al realizar la peticion al servidor');
  }
  //print(jsondata);
}

Future<List<Vino>> findAllWines() async {

  final url = "http://${IP}/allwines/";
  final resp = await http.get(url);

  var jsonfiles  = json.decode(resp.body);

  final List<Vino> vinos_todo = new List(); 

  for (var data in jsonfiles) {
      final temporal = Vino.fromJson(data);
      //print(temporal.identificador);
      //print(temporal.nombre);
      vinos_todo.add( temporal );
  }
  return vinos_todo;
}


Future<List<Vino>> obtenerRecomendaciones(int id_vino) async {
  
  final url = "http://${IP}/recomendador/${id_vino}";
  final resp = await http.get(url);

  var jsonfiles  = json.decode(resp.body);

  final List<Vino> vinos_similares = new List(); 

  for (var data in jsonfiles) {
      final temporal = Vino.fromJson(data);
      //print(temporal.identificador);
      //print(temporal.nombre);
      vinos_similares.add( temporal );
  }
  return vinos_similares;
}
  
}