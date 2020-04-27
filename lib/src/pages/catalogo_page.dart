
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:pocket_sommelier/src/models/vino.dart';
import 'package:pocket_sommelier/src/pages/vinodetail_page.dart';
import 'package:pocket_sommelier/src/providers/vino_provider.dart';
import 'package:pocket_sommelier/src/utils/mapa.dart';

class CatalogoVinosPage extends StatefulWidget {
   int vinoid;//Identificaro del vino proveniente de la pantalla anterior
   CatalogoVinosPage({this.vinoid});//Constructor de la clase
   @override
  _CatalogoVinosPageState createState() => _CatalogoVinosPageState();
}

class _CatalogoVinosPageState extends State<CatalogoVinosPage> {
  int _current = 0; // Índice que almacena el número de la tarjeta actual del carrusel
  List<Vino> listaVinos = new List();//Lista que almacena los datos que provienen de la respuesta del servidor
  Vino  vino = new Vino(); //Guardar los datos del vino que se le solicita a la API
  final vinoProvider = new VinoProvider();// Clase para hacer las peticionnes al servidor
  //int id ;//Identificador del vino que ha de solicitarse al servidor
  Future<List<Vino>> _mywines;//Respuesta de convocar el future builder de findWine en vinoProvider
  @override
  void initState() {
    super.initState();
    if(widget.vinoid == 0){
      //Si el identificador del vino es 0 el usuario desea ver el catálogo de todos los vinos del sistema
      _mywines = vinoProvider.findAllWines();
    }else{
      //Si el identificador es diferente de cero, entonces el usuario desea un recomendación de vinos similiares
      _mywines = vinoProvider.obtenerRecomendaciones(widget.vinoid);
    }
    
  }

  @override
  Widget build(BuildContext context) {
 
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
                      /*Si el usuario desea ver un vino en particular 
                      convocamos a la pantalla que despliega el detalle del vino seleccionado,
                      para eso tenemos que mandarle el objeto vino de la lista que corresponde
                      al que seleccionó el usuario*/
                      Navigator.push(context,
                          MaterialPageRoute(
                            builder: (context) => VinoDetailPage(vino:listaVinos[_current],flag: 1,),
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
                  /*Si el usuario presiona el votón "Inicio",
                  desplegamos la pantalla de inicio */
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

  Widget _dibujaCarrusel(){
      return FutureBuilder(
      future: _mywines,
      builder : (BuildContext context, AsyncSnapshot<List<Vino>> snapshot){
          if( snapshot.hasData ) {
            listaVinos = snapshot.data;
            var litems = listaWidgets(listaVinos);
            return CarouselSlider(
                  height: 300.0,
                  autoPlay: true,
                  autoPlayAnimationDuration: new Duration(milliseconds:800),
                  onPageChanged: (index) {
                              setState(() {
                                _current = index;
                                //print(index);
                              });
                  },
                  items: litems,
                );
          }else { 
            return Center(child: CircularProgressIndicator());
          }
      },
    );

  }

  //Método que construye la lista de widgets para dibujar el carrusel en la app
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