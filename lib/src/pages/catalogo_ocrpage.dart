
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:pocket_sommelier/src/models/vino.dart';
import 'package:pocket_sommelier/src/pages/vinodetail_page.dart';
import 'package:pocket_sommelier/src/utils/mapa.dart';

class CatalogoOCRVinosPage extends StatefulWidget {
   List<Vino> vinos;
   CatalogoOCRVinosPage({this.vinos});
   @override
  _CatalogoOCRVinosPageState createState() => _CatalogoOCRVinosPageState();
}

class _CatalogoOCRVinosPageState extends State<CatalogoOCRVinosPage> {
  int _current = 0;//La variable que almacena el índice de la imagen actual del carrusel
  Vino  vino = new Vino(); //Guardar los datos del vino que se le solicita a la API
  //Estado inicial del widget
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //Construcción de la interfaz gráfica 
    return Scaffold(
      backgroundColor: Color(10),
      body:ListView(
          children: <Widget>[
            Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
              SizedBox(height: 40),
              Text("Pocket Sommelier", 
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.deepOrangeAccent,
                      fontWeight: FontWeight.bold
                    ),),
              SizedBox(height: 20),
              _dibujaCarrusel(),
              //_carrusel(),
              SizedBox(height: 60),
              SizedBox(
                  width: 200, 
                  height: 40,
                  child: RaisedButton(
                    child: Text("Ver selección",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),),
                    onPressed:(){
                      //Si el usuario presiona el botón 
                      //print("El usuario selecciona:${listaVinos[_current].identificador}");
                      Navigator.push(context,
                          MaterialPageRoute(
                            builder: (context) => VinoDetailPage(vino:widget.vinos[_current]),
                           ),
                      );
                    },
                    //=>Navigator.pushNamed(context, '/infovino',arguments: _current + 1),
                            //print(_current);
                    color: Colors.deepOrangeAccent,
                    ),
                ),
                SizedBox(height: 15),
                SizedBox(
                    width: 200, 
                    height: 40,
                    child: RaisedButton(
                  child: Text("Inicio",
                          style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),),
                  onPressed:()=> Navigator.pushNamed(context, '/inicio'),
                  color: Colors.deepOrangeAccent,
                )
                 )
          ],
        ),
      ),

          ],
      ) 
      
    );

  }
  //Método construye las tarjetas con las imágenes que aparecen en el carrusel
  Widget _dibujaCarrusel(){
            var litems = listaWidgets(widget.vinos);
            return CarouselSlider(
                  height: 300.0,
                  autoPlay: true,
                  autoPlayAnimationDuration: new Duration(milliseconds:800),
                  onPageChanged: (index) { //este método se dispara 
                              setState(() {
                                //Cada que el carrusel gira el _current cambia su valor 
                                _current = index;
                                //print(index);
                              });
                  },
                  items: litems,//Lista de widgets (tarjetas con imágenes que son los elementos del carrusel)
                );
   
  }

  List<Widget> listaWidgets(List<Vino> listaVinos){
  List<Widget>  widgets = new List();
  //print(listaVinos.length);
  for (var i = 0; i < listaVinos.length; i++) {
      widgets.add(new Container(
                                width: 200,
                                padding: EdgeInsets.all(15.0) ,
                                margin: EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(width: 6.0, color: Colors.deepOrangeAccent),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(30.0) //         
                                      ),),
                                child: Image.network(Uris[listaVinos[i].identificador], fit: BoxFit.contain,),
                                //Text('text $i', style: TextStyle(fontSize: 16.0),)
                                
      )
      );
  }
  return widgets;
  }
}