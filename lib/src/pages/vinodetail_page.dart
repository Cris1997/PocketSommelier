

import 'package:flutter/material.dart';
import 'package:pocket_sommelier/src/models/vino.dart';
import 'package:pocket_sommelier/src/pages/catalogo_page.dart';
import 'package:pocket_sommelier/src/providers/vino_provider.dart';
import 'package:pocket_sommelier/src/utils/mapa.dart';

class VinoDetailPage extends StatefulWidget{
  Vino vino;
  int flag;
  VinoDetailPage({this.vino,this.flag});
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
                      _desplegarInformacion(context),
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
               fontSize: 16
             ),
      ),
    );
  }

  Widget _desplegarInformacion(BuildContext context){
    double tamaniofont = 16.0;
    //Eliminar corchetes de la lista para fines de visualización
    String s = widget.vino.variedad.join(', ');
    String s2 = widget.vino.aroma.join(', ');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
          Row(
            children: <Widget>[
            IconButton(
                        padding: EdgeInsets.only(left:25.0,bottom: 0.0),
                        icon: Icon(Icons.info_outline,color: Colors.deepOrangeAccent,),
                          onPressed: () {
                           info_usuario(context,"Variedad");
                        },
            ),
            Padding(
            padding: EdgeInsets.only(left:5.0,bottom: 0.0),
            child: Text("VARIEDAD:",
             style: TextStyle(
               color: Colors.deepOrangeAccent,
               fontSize: tamaniofont,
             ),
             ),
          ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left:30.0),
            child: Text("${s} \n", //VARIEDAD DEL VINO
             style: TextStyle(
               color: Colors.white,
               fontSize: tamaniofont
             ),
             ),
          ),
          Row(
            children: <Widget>[
              IconButton(
                        padding: EdgeInsets.only(left:25.0,bottom: 0.0),
                        icon: Icon(Icons.info_outline,color: Colors.deepOrangeAccent,),
                          onPressed: () {
                           info_usuario(context,"Grado alcohólico");
                        },
                ),
                Padding(
                    padding: EdgeInsets.only(left:5.0, bottom: 0.0),
                    child: Text("GRADO ALCOHÓLICO:",
                    style: TextStyle(
                    color: Colors.deepOrangeAccent,
                    fontSize: tamaniofont
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left:30.0),
            child: Text("${widget.vino.porcentaje_alcohol}\n", //GRADO ALCOHOLICO
              style: TextStyle(
               color: Colors.white,
               fontSize: tamaniofont
             ),),
          ),
          Row(
            children: <Widget>[
                  
                Padding(
                    padding: EdgeInsets.only(left:25.0,bottom: 10.0),
                    child: Text("PAÍS:",
                    style: TextStyle(
                    color: Colors.deepOrangeAccent,
                    fontSize: tamaniofont
             ),),
          ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left:30.0),
            child: Text("${widget.vino.pais} \n", //PAIS
              style: TextStyle(
               color: Colors.white,
               fontSize: tamaniofont
             ),),
          ),
          Row(
            children: <Widget>[
                IconButton(
                        padding: EdgeInsets.only(left:25.0,bottom: 0.0),
                        icon: Icon(Icons.info_outline,color: Colors.deepOrangeAccent,),
                          onPressed: () {
                           info_usuario(context,"Región");
                        },
                ),
                Padding(
                    padding: EdgeInsets.only(left:5.0,bottom: 0.0),
                    child: Text("REGIÓN:",
                    style: TextStyle(
                    color: Colors.deepOrangeAccent,
                    fontSize: tamaniofont
                  ),),
                ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left:30.0),
            child: Text("${widget.vino.region} \n", //REGIÓN
              style: TextStyle(
               color: Colors.white,
               fontSize: tamaniofont
             ),),
          ),
          Row(
            children: <Widget>[
                IconButton(
                        padding: EdgeInsets.only(left:25.0,bottom: 0.0),
                        icon: Icon(Icons.info_outline,color: Colors.deepOrangeAccent,),
                          onPressed: () {
                           info_usuario(context,"Guarda");
                        },
                ),
                Padding(
                  padding: EdgeInsets.only(left:5.0,bottom: 0.0),
                  child: Text("GUARDA:",
                  style: TextStyle(
                  color: Colors.deepOrangeAccent,
                  fontSize: tamaniofont
                ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left:30.0),
            child:  Text("${widget.vino.guarda} \n",
              style: TextStyle(
               color: Colors.white,
               fontSize: tamaniofont
             ),),
          ),
          Row(
            children: <Widget>[
                IconButton(
                        padding: EdgeInsets.only(left:25.0,bottom: 0.0),
                        icon: Icon(Icons.info_outline,color: Colors.deepOrangeAccent,),
                          onPressed: () {
                           info_usuario(context, "Temp. de consumo");
                        },
                ),
                Padding(
                    padding: EdgeInsets.only(left:5.0,bottom: 0.0),
                    child: Text("TEMPERATURA DE CONSUMO:",
                    style: TextStyle(
                    color: Colors.deepOrangeAccent,
                    fontSize: tamaniofont
                ),),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left:30.0),
            child: Text("${widget.vino.temperatura_consumo} °C\n",
              style: TextStyle(
               color: Colors.white,
               fontSize: tamaniofont
             ),),
          ),
          Row(
            children: <Widget>[
                IconButton(
                        padding: EdgeInsets.only(left:25.0,bottom: 0.0),
                        icon: Icon(Icons.info_outline,color: Colors.deepOrangeAccent,),
                          onPressed: () {
                           info_usuario(context, "Color");
                        },
                ),
                Padding(
                    padding: EdgeInsets.only(left:5.0,bottom: 0.0),
                    child: Text("COLOR:",
                    style: TextStyle(
                    color: Colors.deepOrangeAccent,
                    fontSize: tamaniofont
                ),),
              ),
            ],
          ),
          
          Padding(
            padding: EdgeInsets.only(left:30.0),
            child: Text("${widget.vino.color} \n",
              style: TextStyle(
               color: Colors.white,
               fontSize: tamaniofont
             ),),
          ),
          Row(
            children: <Widget>[
                IconButton(
                        padding: EdgeInsets.only(left:25.0,bottom: 0.0),
                        icon: Icon(Icons.info_outline,color: Colors.deepOrangeAccent,),
                          onPressed: () {
                           info_usuario(context, "Aromas");
                        },
                ),
                Padding(
                    padding: EdgeInsets.only(left:5.0,bottom: 0.0),
                    child: Text("NOTAS AROMÁTICAS:",
                    style: TextStyle(
                    color: Colors.deepOrangeAccent,
                    fontSize: tamaniofont
                ),),
          ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left:30.0),
            child: Text("${s2} \n",
              style: TextStyle(
               color: Colors.white,
               fontSize: tamaniofont
             ),),
          ),
          Row(
            children: <Widget>[
                IconButton(
                        padding: EdgeInsets.only(left:25.0,bottom: 0.0),
                        icon: Icon(Icons.info_outline,color: Colors.deepOrangeAccent,),
                          onPressed: () {
                           info_usuario(context, "Sabor");
                        },
                ),
                Padding(
                      padding: EdgeInsets.only(left:5.0, bottom: 0.0),
                      child: Text("SABOR:",
                      style: TextStyle(
                      color: Colors.deepOrangeAccent,
                      fontSize: tamaniofont
              ),
              ),
            ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left:30.0),
            child: Text("${widget.vino.sabor} \n",
              style: TextStyle(
               color: Colors.white,
               fontSize: tamaniofont
             ),),
          ),
          Row(
            children: <Widget>[
                IconButton(
                        padding: EdgeInsets.only(left:25.0,bottom: 0.0),
                        icon: Icon(Icons.info_outline,color: Colors.deepOrangeAccent,),
                          onPressed: () {
                           info_usuario(context,"Maridaje");
                        },
                ),
                Padding(
                      padding: EdgeInsets.only(left:5.0, bottom: 0.0),
                      child: Text("MARIDAJE:",
                      style: TextStyle(
                      color: Colors.deepOrangeAccent,
                      fontSize: tamaniofont
             ),),
          ),
            ],
          ),
          
          Padding(
            padding: EdgeInsets.only(left:30.0, right: 30.0),
            child: Text("${widget.vino.maridaje} \n",
              style: TextStyle(
               color: Colors.white,
               fontSize: tamaniofont
             ),),
          ),
          Row(
            children: <Widget>[
                IconButton(
                        padding: EdgeInsets.only(left:25.0,bottom: 0.0),
                        icon: Icon(Icons.info_outline,color: Colors.deepOrangeAccent,),
                          onPressed: () {
                           info_usuario(context, "Precio aproximado");
                        },
                ),
                Padding(
                      padding: EdgeInsets.only(left:5.0, bottom: 0.0),
                      child: Text("PRECIO APROXIMADO:",
                      style: TextStyle(
                      color: Colors.deepOrangeAccent,
                      fontSize: tamaniofont
                    ),),
                ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left:30.0),
            child: Text("\$${widget.vino.precio} \n",
              style: TextStyle(
               color: Colors.white,
               fontSize: tamaniofont
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
               fontSize: 16
             ),
      ),
    );
  }

  Widget _botonRegresar(BuildContext context) {
     return FlatButton(
      color: Colors.deepOrangeAccent,
      disabledColor: Colors.grey,
      textColor: Colors.white,
      padding: EdgeInsets.all(10.0),
      onPressed: widget.flag == 0 ? null:(){Navigator.pop(context);},
      //(){
          //setState(() {
            
          //});
          //Navigator.pop(context);
          //;
     // }, 
      child: Text("Regresar",
             style: TextStyle(
               color: Colors.white,
               fontWeight: FontWeight.bold,
               fontSize: 16
             ),
      ),
    );
  }

  Widget info_usuario(BuildContext context, String cat){
     showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context){
      return AlertDialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              title: Text(cat,textAlign: TextAlign.center ,),
              content : Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(alertas[cat],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    //fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left:5.0, bottom: 0.0,top: 15.0),
                          child: FlatButton(
                              color: Colors.deepOrangeAccent,
                              focusColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                          color: Colors.deepOrangeAccent,
                                          width: 1,
                                          style: BorderStyle.solid
                                      ), 
                                  borderRadius: BorderRadius.circular(30)
                              ),
                              child: Text('Entendido', 
                                          style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14
                                                  )
                                          ),
                              onPressed: ()=>Navigator.of(context).pop(),
                        ),
                        ),
                        
                        
                    ],)
                  //FlutterLogo( size:100.0)
                ],
              ),
          );
      }
    );
  }
}