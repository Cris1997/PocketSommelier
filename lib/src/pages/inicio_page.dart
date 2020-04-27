import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'package:path/path.dart' as Path;
import 'package:pocket_sommelier/src/pages/carta_vinopage.dart';
import 'package:pocket_sommelier/src/pages/catalogo_page.dart';
import 'package:pocket_sommelier/src/providers/vino_provider.dart';
import 'package:pocket_sommelier/src/utils/mapa.dart';
 
class InicioPage extends StatefulWidget {
  @override
  _InicioPageState createState() => _InicioPageState();
}

class _InicioPageState extends State<InicioPage> {
  
  File foto;
  VinoProvider vp = new VinoProvider();
  @override
  Widget build(BuildContext context) {
    var column = Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
              _mostrarLogo(),
              Container(
              height: 200,
              margin: EdgeInsets.all(10),
              color: Colors.black,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                      width: 200, // match_parent
                      child: _botonEtiqueta()
                  ),
                  SizedBox(
                      width: 200, // match_parent
                      child: _botonLista()
                  ),
                  SizedBox(
                      width: 200, // match_parent
                      child: _botonConoce()
                  ),
                  SizedBox(
                      width: 200, // match_parent
                      child: _botonRegresar()
                  ),
                ],
              ),
            ),
              ],
            );
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: <Widget>[
            Container(
                  height: 100,
                  child: Center(child: Text('Pocket Sommelier',
                  style: TextStyle(
                  color: Colors.deepOrangeAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 28
                ),
            )),
            ),
            column
        ],)
    );
  }
  //Métodos para mostrar organizadamente los elementos de la interfaz gráfica
  Widget _mostrarLogo(){
      return Image(
                  height: 250,
                  image: AssetImage('assets/iconoPS.JPG'),
                  fit: BoxFit.cover,
              );
  }
  Widget _botonEtiqueta(){

  return RaisedButton(
        //padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 60.0),
        textColor: Colors.white,
        child: Text(
                    "Etiqueta de vino",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0
                    ),
                    ),
        color: Colors.deepOrangeAccent,
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(10.0),
        ),
        onPressed: () {
          //Navigator.push(context, new MaterialPageRoute(builder: (context) => new UIinfo()))
          //_mostrarAlert(context);
          Navigator.pushNamed(context,'/foto_etiqueta');
        },
      );
}

Widget _botonLista(){

  return RaisedButton(
        //padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 60.0),
        textColor: Colors.white,
        child: Text(
                "Lista de vinos",
                style: TextStyle( 
                   fontWeight: FontWeight.bold,
                   fontSize: 14.0,
                ),
                ),
        color: Colors.deepOrangeAccent,
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(10.0),
        ),
        onPressed:(){
          Navigator.pushNamed(context,'/foto_carta');
        },
      );
}


Widget _botonConoce(){
  
  return RaisedButton(
                
                //padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 60.0),
                color: Colors.deepOrangeAccent,
                shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0),
                ),
                textColor: Colors.white,
                child: Text('Conoce otros vinos',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    //fontStyle: FontStyle.,
                    textBaseline: TextBaseline.alphabetic
                ),),
                onPressed:(){
                  Navigator.push(context,
                          MaterialPageRoute(
                            builder: (context) => CatalogoVinosPage(vinoid: 0),
                           ),
                      );
                } 
              );


}

Widget _botonRegresar(){
    return RaisedButton(
              
                //padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 60.0),
                color: Colors.deepOrangeAccent,
                shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0),
                ),
                textColor: Colors.white,
                child: Text('Regresar',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    //fontStyle: FontStyle.,
                    textBaseline: TextBaseline.alphabetic
                ),),
                onPressed: ()=>Navigator.pushNamed(context, '/'),
              );
}



}

