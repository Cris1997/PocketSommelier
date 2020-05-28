

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pocket_sommelier/src/pages/envia_foto.dart';
  
class CamaraPage extends StatefulWidget {
  @override
  _CamaraPageState createState() => _CamaraPageState();
}

class _CamaraPageState extends State<CamaraPage> {

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
          Navigator.push(context, new MaterialPageRoute(builder: (context) => new EnviaFotoVinoPage(foto:foto)));
        }else{
          Navigator.pushNamed(context, '/inicio');
        }
      });
  }
  
}