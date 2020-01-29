
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';



import 'package:pocket_sommelier/src/models/vino.dart';
import 'package:pocket_sommelier/src/utils/mapa.dart';

class VinoProvider{


  Future<Vino> findWine(int id) async {

  var data = await http.get("http://${IP}/foundone/${id}");
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
  
  var data  = await  http.get("http://${IP}/allwines/");
  var jsonfiles =  json.decode(data.body);
  List<Vino> newslist = [];
  for (var data in jsonfiles) {
      print(data);
  }
  return newslist; 
}


}