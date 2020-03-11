/*Esta clase permite almacenar los datos que 
llegan en formato JSON a la aplicación 
después de ejecutar determinadas funciones. C
Cada archivo JSON es */


class Vino {
    /*Los atributos de la clase
    hacen referencia a cada uno de los campos
    que hay en la base de datos*/
    int identificador;
    String nombre;
    List<dynamic> variedad;
    double porcentaje_alcohol;
    String pais;
    String region;
    String guarda;
    String temperatura_consumo;
    String color;
    List<dynamic> aroma;
    String sabor;
    String maridaje;
    String name_image;
    int precio;
    /*Constructor de la clase*/
    Vino({this.identificador, 
    this.nombre, 
    this.variedad,
    this.porcentaje_alcohol,
    this.pais,
    this.region,
    this.guarda,
    this.temperatura_consumo,
    this.color,
    this.aroma, 
    this.sabor,
    this.maridaje,
    this.name_image,
    this.precio
    });
   /*
   Este método funciona para convertir los datos JSON en 
   instancias de tipo Vino.
   */
   factory Vino.fromJson(Map<String, dynamic> json) {
    return Vino(
      identificador: json['_id'],
      nombre: json['nombre'],
      variedad: json['variedad'],
      porcentaje_alcohol: json['porcen_alch'],
      pais: json['pais'],
      region: json['region'],
      guarda: json['guarda'],
      temperatura_consumo: json['temp_consumo'],
      color: json['color'],
      aroma: json['aroma'],
      sabor: json['sabor'],
      maridaje: json['maridaje'],
     // name_image: json['name_image'],
      precio: json['precio']
      );
   }
}