import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:pocket_sommelier/src/pages/vinodetail_page.dart';
import 'package:pocket_sommelier/src/utils/mapa.dart';

class CatalogoPage extends StatefulWidget {
   @override
  _CatalogoPageState createState() => _CatalogoPageState();
}

class _CatalogoPageState extends State<CatalogoPage> {
  int _current = 0;
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
              CarouselSlider(
                  height: 250.0,
                  autoPlay: true,
                  autoPlayAnimationDuration: new Duration(milliseconds:800),
                  onPageChanged: (index) {
                              setState(() {
                                _current = index;
                                //print(index);
                              });
                  },
                  items:  urls.map((i) {
                      return Container(
                                padding: EdgeInsets.all(15.0) ,
                                margin: EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(width: 6.0, color: Colors.deepOrangeAccent),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(30.0) //         <--- border radius here
                                      ),),
                                child: Image.network(i, fit: BoxFit.contain,),
                                //Text('text $i', style: TextStyle(fontSize: 16.0),)
                                
                            );
                  
                    }
                    ).toList(),
                ),
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
                      Navigator.push(context,
                          MaterialPageRoute(
                            builder: (context) => VinoDetailPage(id: _current + 1),
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

}