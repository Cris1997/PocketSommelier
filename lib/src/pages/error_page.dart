
import 'package:pocket_sommelier/src/pages/catalogo_page.dart';
import 'package:pocket_sommelier/src/pages/inicio_page.dart';

import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {

   int iderror;//Identificaro del vino proveniente de la pantalla anterior
   ErrorPage({this.iderror});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange[300],
      body: Center(child: _mostrarWidget(context))
    );
  }

  Widget _mostrarWidget(BuildContext context){

    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 60.0,),
          Text("Pocket Sommelier",style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.bold
          ),),
          SizedBox(height: 30.0,),
          Image(
            height: 150,
            width: 100,
            image: AssetImage('assets/not.png'),
          ),
          SizedBox(height: 30.0,),
          Text("No se encontraron coincidencias",style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),),
          SizedBox(height: 30.0,),
          _botonCatalogo(context),
          SizedBox(height: 20.0,),
          _botonFoto(context),
        ],
    );
  }

  Widget _botonCatalogo(BuildContext context ){

    return SizedBox(
        width: 250, 
        height: 50,// specific value
        child: RaisedButton(
        color: Colors.black,
        hoverColor: Colors.white,
        focusColor: Colors.white,
        highlightColor: Colors.white,
        splashColor: Colors.white,
        child: Text("Conoce otros vinos",
              style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
              ),),
        onPressed: (){
          Navigator.push(context,
                          MaterialPageRoute(
                            builder: (context) => CatalogoVinosPage(vinoid: 0),
                           ),
                      );
        }
    )
  );

  }

  Widget _botonFoto(BuildContext context){
    return SizedBox(
          width: 250,
          height: 50,
          child: RaisedButton(
          color: Colors.black,
          highlightColor: Colors.white,
          splashColor: Colors.white,
          child: Text("Volver a tomar fotografía",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),),
          onPressed: (){
            if(iderror == 0){
              //El error se presento cuando no se identifico la etiqueta del vinno
              Navigator.pushNamed(context, "/foto_etiqueta");

            }else{
              //El error se presento cuando no encontro algo en la carta de vinos
              Navigator.pushNamed(context, "/foto_carta");
            }
          }
    )
    );
  }
}