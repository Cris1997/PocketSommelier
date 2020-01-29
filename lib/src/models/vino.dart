class Vino {

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
    this.name_image
    });

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
      name_image: json['name_image']
      );
   }
}