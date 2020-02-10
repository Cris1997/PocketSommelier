

import 'package:flutter/material.dart';
import 'package:pocket_sommelier/src/models/vino.dart';
import 'package:pocket_sommelier/src/pages/vinos_similarespage.dart';
import 'package:pocket_sommelier/src/providers/vino_provider.dart';
import 'package:pocket_sommelier/src/utils/mapa.dart';

class VinoDetailPage extends StatefulWidget{
  Vino vino;
  VinoDetailPage({this.vino});
  @override
  _VinoDetailPageState createState() => _VinoDetailPageState();
}

class _VinoDetailPageState extends State<VinoDetailPage> {
  //Vino  vino = new Vino(); //Guardar los datos del vino que se le solicita a la API
  final vinoProvider = new VinoProvider();// Clase para hacer las peticionnes al servidor
  //int id ;//Identificador del vino que ha de solicitarse al servidor
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("HOLAR");
    //print(id);
    //print(value.nombre);
    return Scaffold(
      backgroundColor: Color(10),
      body: _crearVinoPage(context),
    );
  }

  Widget _crearVinoPage(BuildContext context) {
    //print("hola");
    return SingleChildScrollView(
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 40),
                      _mostrarLetrero(),
                      SizedBox(height: 10),
                      _mostrarImagen(),
                      SizedBox(height: 10),
                      _mostrarNombre(),
                      SizedBox(height: 15),
                      _crearBotonRecomendacion(),
                      SizedBox(height: 15),
                      _desplegarInformacion(),
                       SizedBox(height: 15),
                      _crearBotonesFinales(context),
                    ],
                  ),
             );
          /*else { 
            return Center(child: CircularProgressIndicator());
          }*/
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
    return 
    FadeInImage(
            image: NetworkImage(Uris[widget.vino.identificador]),
            placeholder:AssetImage('assets/loading-gear-3.gif',),
            height: 300.0,
            width: 200,
            fit: BoxFit.contain,
            
          ); 
  }

  Widget _mostrarNombre(){
    return Text('${widget.vino.nombre}',
                  style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24
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
          Navigator.push(context,
                          MaterialPageRoute(
                            builder: (context) => CatalogoSimilaresPage(vinoid:widget.vino.identificador),
                           ),
          );
          //vinoProvider.obtenerRecomendaciones(widget.id);
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("VARIEDAD:",
             style: TextStyle(
               color: Colors.deepOrangeAccent,
               fontSize: 20,
             ),),
         Text("${widget.vino.variedad} \n", //VARIEDAD DEL VINO
             style: TextStyle(
               color: Colors.white,
               fontSize: 20
             ),),
          Text("GRADO ALCOHÓLICO:",
             style: TextStyle(
               color: Colors.deepOrangeAccent,
               fontSize: 20
             ),),
        Text("${widget.vino.porcentaje_alcohol}\n", //GRADO ALCOHOLICO
              style: TextStyle(
               color: Colors.white,
               fontSize: 20
             ),),
        Text("PAÍS:",
             style: TextStyle(
               color: Colors.deepOrangeAccent,
               fontSize: 20
             ),),
        Text("${widget.vino.pais} \n", //PAIS
              style: TextStyle(
               color: Colors.white,
               fontSize: 20
             ),),
        Text("REGIÓN:",
             style: TextStyle(
               color: Colors.deepOrangeAccent,
               fontSize: 20
             ),),
        Text("${widget.vino.region} \n", //REGIÓN
              style: TextStyle(
               color: Colors.white,
               fontSize: 20
             ),),
        Text("GUARDA:",
             style: TextStyle(
               color: Colors.deepOrangeAccent,
               fontSize: 20
             ),),
        Text("${widget.vino.guarda} \n",
              style: TextStyle(
               color: Colors.white,
               fontSize: 20
             ),),
        Text("TEMPERATURA DE CONSUMO:",
             style: TextStyle(
               color: Colors.deepOrangeAccent,
               fontSize: 20
             ),),
        Text("${widget.vino.temperatura_consumo} °C\n",
              style: TextStyle(
               color: Colors.white,
               fontSize: 20
             ),),
        Text("COLOR:",
             style: TextStyle(
               color: Colors.deepOrangeAccent,
               fontSize: 20
        ),),
        Text("${widget.vino.color} \n",
              style: TextStyle(
               color: Colors.white,
               fontSize: 20
             ),),
        Text("NOTAS AROMÁTICAS:",
             style: TextStyle(
               color: Colors.deepOrangeAccent,
               fontSize: 20
             ),),
        Text("${widget.vino.aroma} \n",
              style: TextStyle(
               color: Colors.white,
               fontSize: 20
             ),),
        Text("SABOR:",
             style: TextStyle(
               color: Colors.deepOrangeAccent,
               fontSize: 20
             ),),
        Text("${widget.vino.sabor} \n",
              style: TextStyle(
               color: Colors.white,
               fontSize: 20
             ),),
        Text("MARIDAJE:",
             style: TextStyle(
               color: Colors.deepOrangeAccent,
               fontSize: 20
             ),),
        Text("${widget.vino.maridaje} \n",
              style: TextStyle(
               color: Colors.white,
               fontSize: 20
             ),)
      ],
    );
  }

  Widget _crearBotonesFinales(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
      padding: EdgeInsets.all(10.0),
      onPressed:(){
          setState(() {
            
          });
          Navigator.pop(context);
          //Navigator.pushNamed(context, '/catalogo');
      }, 
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