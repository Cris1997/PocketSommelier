
import  'package:flutter/material.dart';
 
class EdadPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold( 
         backgroundColor: Colors.black, 
         body: Column( 
            children: <Widget>[
              Container(
                  height: 150,
                  child: Center(child: Text('Pocket Sommelier',
                  style: TextStyle(
                  color: Colors.deepOrangeAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 28
                ),
               )),
              ),
              Image(
                  height: 250,
                  image: AssetImage('assets/iconoPS.JPG'),
                  fit: BoxFit.cover,
              ),
              Container(
                height: 100,
                child: Center(
                  child: Text(
                    '¿Eres mayor de 18 años?',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    ),)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  MaterialButton( 
                      height: 40.0, 
                      shape: RoundedRectangleBorder(
                                     borderRadius: new BorderRadius.circular(10.0),
                      ),
                      minWidth: 70.0, 
                      color: Colors.deepOrangeAccent, 
                      textColor: Colors.white, 
                      child: Text(
                              "Si",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                              ), 
                      splashColor: Colors.orange,
                      onPressed: () => {
                           //Navigator.push(context, new MaterialPageRoute(builder: (context) => new Inicio()))
                           Navigator.pushNamed(context, '/inicio')
                      },
                  ),
                  MaterialButton( 
                      height: 40.0, 
                      shape: RoundedRectangleBorder(
                                     borderRadius: new BorderRadius.circular(10.0),
                              ),
                      minWidth: 70.0, 
                      color: Colors.deepOrangeAccent, 
                      textColor: Colors.white, 
                      child: Text(
                              "No",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                              ), 
                      onPressed: () {
                          _mensajeAlert(context);
                      }, 
                      splashColor: Colors.redAccent,
                  ),  
              ],)
            ],
         )
       );
  }


  void _mensajeAlert(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context){
        return AlertDialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              //title: Text('Informacion'),
              content : Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text('En México, es necesario tener más de 18 años para consumir bebidas alcohólicas.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    //fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                        FlatButton(
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
                    ],)
                  //FlutterLogo( size:100.0)
                ],
              ),
          );
      }
    );
  } 
}