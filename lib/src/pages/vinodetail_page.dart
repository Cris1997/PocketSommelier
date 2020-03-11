

import 'package:flutter/material.dart';
import 'package:pocket_sommelier/src/models/vino.dart';
import 'package:pocket_sommelier/src/pages/catalogo_page.dart';
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
    return Scaffold(
      backgroundColor: Color(10),
      body: _crearVinoPage(context),
    );
  }

  Widget _crearVinoPage(BuildContext context) {
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
    return Container( 

                                height: 300,
                                width: 150,
                                padding: EdgeInsets.all(15.0) ,
                                margin: EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(width: 6.0, color: Colors.deepOrangeAccent),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(30.0) //         
                                      ),),
                                child: Image.network(Uris[widget.vino.identificador], fit: BoxFit.contain,),
                                //Text('text $i', style: TextStyle(fontSize: 16.0),)
                                
      ); 
    
    
    
    
    /*FadeInImage(
                        image: NetworkImage(Uris[widget.vino.identificador]),
                        placeholder:AssetImage('assets/loading-gear-3.gif',),
                        fit: BoxFit.contain,
                        height: 330.0,
                        width: 250,
                  );*/
                
  }

  Widget _mostrarNombre(){
    return Text('${widget.vino.nombre}',
                  textAlign: TextAlign.center,
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
                            builder: (context) => CatalogoVinosPage(vinoid:widget.vino.identificador),
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
    //Eliminar corchetes de la lista para fines de visualización
    String s = widget.vino.variedad.join(', ');
    String s2 = widget.vino.aroma.join(', ');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left:25.0,bottom: 10.0),
            child: Text("VARIEDAD:",
             style: TextStyle(
               color: Colors.deepOrangeAccent,
               fontSize: 20,
             ),
             ),
          ),
          Padding(
            padding: EdgeInsets.only(left:30.0),
            child: Text("${s} \n", //VARIEDAD DEL VINO
             style: TextStyle(
               color: Colors.white,
               fontSize: 20
             ),
             ),
          ),
          Padding(
            padding: EdgeInsets.only(left:25.0, bottom: 10.0),
            child: Text("GRADO ALCOHÓLICO:",
             style: TextStyle(
               color: Colors.deepOrangeAccent,
               fontSize: 20
             ),
             ),
          ),
          Padding(
            padding: EdgeInsets.only(left:30.0),
            child: Text("${widget.vino.porcentaje_alcohol}\n", //GRADO ALCOHOLICO
              style: TextStyle(
               color: Colors.white,
               fontSize: 20
             ),),
          ),
          Padding(
            padding: EdgeInsets.only(left:25.0,bottom: 10.0),
            child: Text("PAÍS:",
             style: TextStyle(
               color: Colors.deepOrangeAccent,
               fontSize: 20
             ),),
          ),
          Padding(
            padding: EdgeInsets.only(left:30.0),
            child: Text("${widget.vino.pais} \n", //PAIS
              style: TextStyle(
               color: Colors.white,
               fontSize: 20
             ),),
          ),
          Padding(
            padding: EdgeInsets.only(left:25.0,bottom: 10.0),
            child: Text("REGIÓN:",
             style: TextStyle(
               color: Colors.deepOrangeAccent,
               fontSize: 20
             ),),
          ),
          Padding(
            padding: EdgeInsets.only(left:30.0),
            child: Text("${widget.vino.region} \n", //REGIÓN
              style: TextStyle(
               color: Colors.white,
               fontSize: 20
             ),),
          ),
          Padding(
            padding: EdgeInsets.only(left:25.0,bottom: 10.0),
            child: Text("GUARDA:",
             style: TextStyle(
               color: Colors.deepOrangeAccent,
               fontSize: 20
             ),),
          ),
          Padding(
            padding: EdgeInsets.only(left:30.0),
            child:  Text("${widget.vino.guarda} \n",
              style: TextStyle(
               color: Colors.white,
               fontSize: 20
             ),),
          ),
          
          Padding(
            padding: EdgeInsets.only(left:25.0,bottom: 10.0),
            child: Text("TEMPERATURA DE CONSUMO:",
             style: TextStyle(
               color: Colors.deepOrangeAccent,
               fontSize: 20
             ),),
          ),
          Padding(
            padding: EdgeInsets.only(left:30.0),
            child: Text("${widget.vino.temperatura_consumo} °C\n",
              style: TextStyle(
               color: Colors.white,
               fontSize: 20
             ),),
          ),
          Padding(
            padding: EdgeInsets.only(left:25.0,bottom: 10.0),
            child: Text("COLOR:",
             style: TextStyle(
               color: Colors.deepOrangeAccent,
               fontSize: 20
            ),),
          ),
          Padding(
            padding: EdgeInsets.only(left:30.0),
            child: Text("${widget.vino.color} \n",
              style: TextStyle(
               color: Colors.white,
               fontSize: 20
             ),),
          ),
          Padding(
            padding: EdgeInsets.only(left:25.0,bottom: 10.0),
            child: Text("NOTAS AROMÁTICAS:",
             style: TextStyle(
               color: Colors.deepOrangeAccent,
               fontSize: 20
             ),),
          ),
          Padding(
            padding: EdgeInsets.only(left:30.0),
            child: Text("${s2} \n",
              style: TextStyle(
               color: Colors.white,
               fontSize: 20
             ),),
          ),
          Padding(
            padding: EdgeInsets.only(left:25.0, bottom: 10.0),
            child: Text("SABOR:",
             style: TextStyle(
               color: Colors.deepOrangeAccent,
               fontSize: 20
             ),),
          ),
          Padding(
            padding: EdgeInsets.only(left:30.0),
            child: Text("${widget.vino.sabor} \n",
              style: TextStyle(
               color: Colors.white,
               fontSize: 20
             ),),
          ),
          Padding(
            padding: EdgeInsets.only(left:25.0, bottom: 10.0),
            child: Text("MARIDAJE:",
             style: TextStyle(
               color: Colors.deepOrangeAccent,
               fontSize: 20
             ),),
          ),
          Padding(
            padding: EdgeInsets.only(left:30.0, right: 30.0),
            child: Text("${widget.vino.maridaje} \n",
              style: TextStyle(
               color: Colors.white,
               fontSize: 20
             ),),
          ),
          Padding(
            padding: EdgeInsets.only(left:25.0, bottom: 10.0),
            child: Text("PRECIO:",
             style: TextStyle(
               color: Colors.deepOrangeAccent,
               fontSize: 20
             ),),
          ),
          Padding(
            padding: EdgeInsets.only(left:30.0),
            child: Text("\$${widget.vino.precio} \n",
              style: TextStyle(
               color: Colors.white,
               fontSize: 20
             ),),
          ),
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