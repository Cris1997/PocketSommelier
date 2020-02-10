
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:pocket_sommelier/src/models/vino.dart';
import 'package:pocket_sommelier/src/pages/vinodetail_page.dart';
import 'package:pocket_sommelier/src/providers/vino_provider.dart';
import 'package:pocket_sommelier/src/utils/mapa.dart';

class CatalogoVinosPage extends StatefulWidget {
   int vinoid;
   CatalogoVinosPage({this.vinoid});
   @override
  _CatalogoVinosPageState createState() => _CatalogoVinosPageState();
}

class _CatalogoVinosPageState extends State<CatalogoVinosPage> {
  int _current = 0;
  List<Vino> listaVinos = new List();
  Vino  vino = new Vino(); //Guardar los datos del vino que se le solicita a la API
  final vinoProvider = new VinoProvider();// Clase para hacer las peticionnes al servidor
  //int id ;//Identificador del vino que ha de solicitarse al servidor
  Future<List<Vino>> _mywines;//Respuesta de convocar el future builder de findWine en vinoProvider

  @override
  void initState() {
    super.initState();
    if(widget.vinoid == 0){
      _mywines = vinoProvider.findAllWines();
    }else{
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
              _dibujaprueba(),
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
                      //print("El usuario selecciona:${listaVinos[_current].identificador}");
                      Navigator.push(context,
                          MaterialPageRoute(
                            builder: (context) => VinoDetailPage(vino:listaVinos[_current]),
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

  Widget _dibujaprueba(){
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