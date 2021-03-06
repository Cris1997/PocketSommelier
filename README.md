<p align="center">
  <img src="https://github.com/Cris1997/GUIS/blob/master/12.png">
</p>

<p align="center">El presente proyecto contiene la implementación en su totalidad de la aplicación móvil Pocket Sommelier. En la siguiente tabla se listan las interfaces gráficas con su codificación correspondiente y la ruta para su consulta inmediata por parte de el lector. La visualización de cada una de las interfaces que aparecen en la tabla puede ser consultada al final de este README.</p>

<p align="center">
En el punto dos, presentamos al lector la serie de llamadas que es capaz de disparar la aplicación para ejecutar sus funcionalidades. Del mismo modo, se invita a consultar el repositorio de la API para la comprensión en su totalidad de este repositorio.Finalmente, en el punto tres se describe una clase diseñada para el manejo de datos en la aplicación.
</p>

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



| Método | Descripción |Tipo de petición|
| --- | --- | --- |
| <a href="https://github.com/Cris1997/PocketSommelier/blob/master/lib/src/providers/vino_provider.dart">findAllWines()</a> | Solicita al servicio la información de todos los vinos que hay en la base de datos.|GET|
|<a href="https://github.com/Cris1997/PocketSommelier/blob/master/lib/src/providers/vino_provider.dart">obtenerRecomendaciones(int id_vino)</a> | Realiza una petición al API para obtener cinco recomendaciones enviando el identificador del vino respecto al que se quieren recomendaciones.|GET|
|<a href="https://github.com/Cris1997/PocketSommelier/blob/master/lib/src/pages/envia_foto.dart">loadAsyncData(File foto)</a> |Esta petición envía la fotografía que captura el usuario para ser clasificada por la red neuronal.|POST|
| <a href="https://github.com/Cris1997/PocketSommelier/blob/master/lib/src/pages/listavino_page.dart">enviarFotoOCR(File foto)</a>|Proporciona al API la fotografía de la lista de vinos para encontrar los vinos que se encuentran en ella.|POST|



Conoce más sobre el API en: <a href="https://github.com/Cris1997/API">API Pocket Sommelier</a>


## 3.- Clase Vino

Esta clase fue creada para manejar de una manera más eficiente los datos que llegan a la aplicación. Su estructura tiene todas las propiedades vinícolas que se van a mostrar en la aplicación, junto con dos métodos: un constructor para inicializar los objetos de este tipo y otro que convertirá cada uno de los archivos JSON en una instancia de esta clase. Su declaración se puede consultar <a href="https://github.com/Cris1997/PocketSommelier/blob/master/lib/src/models/vino.dart">aquí</a>


<p align = "center">
   <img src= "https://github.com/Cris1997/Assets/blob/master/vino.png" width="250" height="400">
</p>
<p align  = "center">
  Imagen 3.1. Clase Vino
</p>

## 4.- Interfaces Gráficas
<p align = "center">
<b>Imagen 4.1 Edad usuario</b>
</p>
<p align="center">
  <img src="https://github.com/Cris1997/GUIS/blob/master/2.png" width="200" height="400">
</p>

<p align = "center">
<b>Imagen 4.2 Menú inicio</b>
</p>
<p align = "center">
   <img src="https://github.com/Cris1997/GUIS/blob/master/1.png" width="200" height="400">
</p>

<p align = "center">
<b>Imagen 4.3 Procesando</b>
</p>
<p align = "center">
  <img src="https://github.com/Cris1997/GUIS/blob/master/7.png" width="200" height="400">
</p>

<p align = "center">
<b>Imagen 4.4 Error</b>  
</p>
<p align = "center">
  <img src="https://github.com/Cris1997/GUIS/blob/master/11.png" width="200" height="400">
</p>

<p align = "center">
<b>Imagen 4.5 Detalle vino</b>  
</p>
<p align = "center">
  <img src="https://github.com/Cris1997/GUIS/blob/master/5.png" width="200" height="400">
</p>

<p align = "center">
<b>Imagen 4.6 Catálogo de vinos</b>  
</p>
<p align = "center">
  <img src="https://github.com/Cris1997/GUIS/blob/master/4.png" width="200" height="400">
</p>

<p align = "center">
<b>Imagen 4.7 Notificación etiqueta de vino</b>  
</p>
<p align = "center">
  <img src="https://github.com/Cris1997/GUIS/blob/master/3.png" width="200" height="400">
</p>

<p align = "center">
<b>Imagen 4.8 Notificación carta de vinos</b> 
</p>
<p align = "center">
  <img src="https://github.com/Cris1997/GUIS/blob/master/9.png" width="200" height="400">
</p>

<p align = "center">
<b>Imagen 4.9 Captura a botella</b>  
</p>
<p align = "center">
  <img src="https://github.com/Cris1997/GUIS/blob/master/8.png" width="200" height="400">
</p>

<p align = "center">
<b>Imagen 4.10 Captura a menú</b> 
</p>
<p align = "center">
  <img src="https://github.com/Cris1997/GUIS/blob/master/10.png" width="200" height="400">
</p>



   

  
  
  
  
  
  
  
  

