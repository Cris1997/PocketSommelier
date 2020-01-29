
import 'package:flutter/material.dart';
import 'package:pocket_sommelier/src/models/vino.dart';
import 'package:pocket_sommelier/src/providers/vino_provider.dart';
import 'package:pocket_sommelier/src/utils/mapa.dart';

class VinoDetailPage extends StatelessWidget{
  
  Vino  vino = new Vino();
  final vinoProvider = new VinoProvider();
  int id ;

  @override
  Widget build(BuildContext context) {
    id = ModalRoute.of(context).settings.arguments;
    //print(id);
    //print(value.nombre);
    return Scaffold(
      backgroundColor: Color(10),
      body: _crearVinoPage(context),
    );
  }
  Widget _crearVinoPage(BuildContext context) {

    return FutureBuilder(
      future: vinoProvider.findWine(id),
      builder : (BuildContext context, AsyncSnapshot<Vino> snapshot){
          if( snapshot.hasData ) {
            vino = snapshot.data;
            return SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 60),
                      _mostrarLetrero(),
                      SizedBox(height: 10),
                      _mostrarImagen(),
                      SizedBox(height: 10),
                      _mostrarNombre(),
                      SizedBox(height: 15),
                      _crearBotonRecomendacion(),
                      SizedBox(height: 15),
                      _desplegarInformacion(),
                      _crearBotonesFinales(context),
                    ],
                  ),
             );
          }else { 
            return Center(child: CircularProgressIndicator());
          }
      },
    );
  }

  Widget _mostrarLetrero(){
    return Text('Pocket Sommelier',
                  style: TextStyle(
                  color: Colors.deepOrangeAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 28
                  )
    );
  }


  Widget _mostrarImagen(){
    //print(Uris[vino.identificador]);
    return FadeInImage(
            image: NetworkImage(Uris[vino.identificador]),
            placeholder:AssetImage('assets/loading-gear-3.gif',),
            height: 300.0,
            width: 200,
            fit: BoxFit.cover
          ); 
        
    /*Center(
        child: Container(
          margin: EdgeInsets.all(10.0),
          //color: Colors.white,
          width: 200.0,
          height: 300.0,
          decoration:BoxDecoration(
                     image: DecorationImage(
                     fit: BoxFit.fitHeight,
                     image: NetworkImage(Uris[vino.identificador]),
                    ),
                  ),
        ),*/
        
  }

  Widget _mostrarNombre(){
    return Text('${vino.nombre}',
                  style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                  )
    );
  }

  Widget _crearBotonRecomendacion(){
    return FlatButton(
      color: Colors.deepOrangeAccent,
      textColor: Colors.white,
      disabledColor: Colors.grey,
      disabledTextColor: Colors.black,
      padding: EdgeInsets.all(10.0),
      splashColor: Colors.deepOrange,
      onPressed: (){

      },
      child: Text("Ver similares",
             style: TextStyle(
               color: Colors.white,
               fontWeight: FontWeight.bold,
               fontSize: 20
             ),
      ),
    );
  }

  Widget _desplegarInformacion(){
    return Column(
      children: <Widget>[
        Text("Variedad de uva: ${vino.variedad}",
             style: TextStyle(
               color: Colors.white
             ),),
        Text("Grado Alcohólico: ${vino.porcentaje_alcohol} ",
              style: TextStyle(
               color: Colors.white
             ),),
        Text("País: ${vino.pais}",
              style: TextStyle(
               color: Colors.white
             ),),
        Text("Región: ${vino.region}",
              style: TextStyle(
               color: Colors.white
             ),),
        Text("Guarda: ${vino.guarda}",
              style: TextStyle(
               color: Colors.white
             ),),
        Text("Temperatura de consumo: ${vino.temperatura_consumo}",
              style: TextStyle(
               color: Colors.white
             ),),
        Text("Tipo de vino: ${vino.color}",
              style: TextStyle(
               color: Colors.white
             ),),
        Text("Notas aromáticas: ${vino.aroma}",
              style: TextStyle(
               color: Colors.white
             ),),
        Text("Sabor: ${vino.sabor}",
              style: TextStyle(
               color: Colors.white
             ),),
        Text("Maridaje: ${vino.maridaje} ",
              style: TextStyle(
               color: Colors.white
             ),)
      ],
    );
  }

  Widget _crearBotonesFinales(BuildContext context){
    return Row(
      children: <Widget>[
         _botonInicio(context),
         _botonRegresar(context),
      ],
    );
  }

  Widget _botonInicio(BuildContext context) {
     return FlatButton(
      color: Colors.deepOrangeAccent,
      textColor: Colors.white,
      disabledColor: Colors.grey,
      disabledTextColor: Colors.black,
      padding: EdgeInsets.all(10.0),
      splashColor: Colors.deepOrange,
      onPressed: () => Navigator.pushNamed(context, '/inicio'),
      child: Text("Inicio",
             style: TextStyle(
               color: Colors.white,
               fontWeight: FontWeight.bold,
               fontSize: 20
             ),
      ),
    );
  }

  Widget _botonRegresar(BuildContext context) {
     return FlatButton(
      color: Colors.deepOrangeAccent,
      textColor: Colors.white,
      disabledColor: Colors.grey,
      disabledTextColor: Colors.black,
      padding: EdgeInsets.all(10.0),
      splashColor: Colors.deepOrange,
      onPressed: ()=> Navigator.pushNamed(context, '/catalogo'),
      child: Text("Regresar",
             style: TextStyle(
               color: Colors.white,
               fontWeight: FontWeight.bold,
               fontSize: 20
             ),
      ),
    );
  }



}