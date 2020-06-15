

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pocket_sommelier/src/pages/listavino_page.dart';
  
/*Esta clase permite tomar la fotografía a la lista de vinos y procesarla para que
otra clase haga la peticion a la API */
class CamaraListaPage extends StatefulWidget {
  @override
  _CamaraListaPageState createState() => _CamaraListaPageState();
}

class _CamaraListaPageState extends State<CamaraListaPage> {

  @override
  void initState() {
      _tomarFoto(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
    );
  }

  _tomarFoto(BuildContext context) async  {
      var foto = await ImagePicker.pickImage(source: ImageSource.camera);
      setState(() {
        if( foto != null ){
          Navigator.push(context, new MaterialPageRoute(builder: (context) => new ListaVinosPage(foto:foto)));
        }else{
          Navigator.pushNamed(context, '/inicio');
        }
      });
  }
  
}