
import 'package:pocket_sommelier/src/pages/inicio_page.dart';

import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange[300],
      body: Center(child: _mostrarWidget())
    );
  }

  Widget _mostrarWidget(){

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
            height: 300,
            width: 200,
            image: AssetImage('assets/not.png'),
          ),
          SizedBox(height: 30.0,),
          Text("No se encontraron coincidencias",style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold
          ),),
          SizedBox(height: 30.0,),
          _botonCatalogo(),
          SizedBox(height: 20.0,),
          _botonFoto(),
        ],
    );
  }

  Widget _botonCatalogo(){

    return SizedBox(
        width: 260, 
        height: 60,// specific value
        child: RaisedButton(
        color: Colors.black,
        hoverColor: Colors.white,
        focusColor: Colors.white,
        highlightColor: Colors.white,
        splashColor: Colors.white,
        child: Text("Conocer otros vinos",
              style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
              ),),
        onPressed: (){

        },
    )
  );

  }

  Widget _botonFoto(){
    return SizedBox(
          width: 260,
          height: 60,
          child: RaisedButton(
          color: Colors.black,
          highlightColor: Colors.white,
          splashColor: Colors.white,
          child: Text("Volver a tomar fotografía",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),),
          onPressed: (){
           
          }
    )
    );
  }
}