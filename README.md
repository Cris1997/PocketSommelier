<p align="center">
  <img src="https://github.com/Cris1997/Assets/blob/master/Pocket%20Sommelier.png">
</p>

<p align="center">El presente proyecto contiene la implementación en su totalidad de la aplicación móvil Pocket Sommelier. En la siguiente tabla se listan las interfaces gráficas con su codificación correspondiente y la ruta para su consulta inmediata por parte de el lector. La visualización de cada una de las interfaces que aparecen en la tabla puede ser consultada al final de este README.</p>

## 1.- Código de interfaces

|Nombre de la interfaz|Archivo de implementación|
| ------------- | ------------- |
|Edad usuario|<a href="https://github.com/Cris1997/PocketSommelier/blob/master/lib/src/pages/edad_page.dart">edad_page.dart</a>|
|Menú de inicio|<a href="https://github.com/Cris1997/PocketSommelier/blob/master/lib/src/pages/inicio_page.dart">inicio_page.dart</a>|
|Procesando|<a href="https://github.com/Cris1997/PocketSommelier/blob/master/lib/src/pages/procesando_page.dart">procesando_page.dart</a>|
|Error|<a href="https://github.com/Cris1997/PocketSommelier/blob/master/lib/src/pages/error_page.dart">error_page.dart</a>|
|Detalle vino|<a href="https://github.com/Cris1997/PocketSommelier/blob/master/lib/src/pages/vinodetail_page.dart">vinodetail_page.dart</a>|
|Catálogo de vinos|<a href="https://github.com/Cris1997/PocketSommelier/blob/master/lib/src/pages/catalogo_page.dart">catalogo_page.dart</a>|
|Notificación etiqueta de vino |<a href="https://github.com/Cris1997/PocketSommelier/blob/master/lib/src/pages/etiquetavino_page.dart">etiquetavino_page.dart</a>|
|Notificación carta de vinos|<a href="https://github.com/Cris1997/PocketSommelier/blob/master/lib/src/pages/carta_vinopage.dart">carta_vinopage.dart</a>|
|Captura a botella|<a href="https://github.com/Cris1997/PocketSommelier/blob/master/lib/src/pages/camara_page.dart">camara_page.dart</a>|
|Captura a menú|<a href="https://github.com/Cris1997/PocketSommelier/blob/master/lib/src/pages/camara_listapage.dart">camara_listapage.dart</a>|

## 2.- Llamadas al API
https://github.com/Cris1997/PocketSommelier/blob/master/lib/src/providers/vino_provider.dart
https://github.com/Cris1997/PocketSommelier/blob/master/lib/src/pages/envia_foto.dart
https://github.com/Cris1997/PocketSommelier/blob/master/lib/src/pages/listavino_page.dart
| Nombre del método | Descripción |Tipo de petición|
| --- | --- | --- |
| findAllWines() | Solicita al servicio la información de todos los vinos que hay en la base de datos |GET|
| obtenerRecomendaciones(int id_vino) | Realiza una petición al API para obtener cinco recomendaciones enviando ek identificador del vino|GET|
| loadAsyncData(File foto) |Esta petición envía la fotografía que captura el usuario para ser clasificada por la red neuronal|POST|
| enviarFotoOCR(File foto)|Proporciona al API la fotografía de la lista de vinos para encontrar los vinos que se encuentran en ella|POST|











# pocket_sommelier

A new Flutter project.

## 5.- Interfaces Gráficas
El código correspondiente a esta pantalla se encuentra en: ,
<p align="center">
  <img src="https://github.com/Cris1997/Assets/blob/master/1.png" width="250" height="400">
   &nbsp; 
   &nbsp; 
   &nbsp; 
   &nbsp; 
  <img src="https://github.com/Cris1997/Assets/blob/master/2.png" width="250" height="400">
   &nbsp; 
   &nbsp; 
   &nbsp; 
   &nbsp;
  <img src="https://github.com/Cris1997/Assets/blob/master/IMG_1125.PNG" width="250" height="400">
</p5


