class Persona {
  int? id;
  String nombre;
  String apellidos;

  Persona({this.id, required this.nombre, required this.apellidos});

  Map<String, dynamic> toMap() {
    return {'id': id, 'nombre': nombre, 'apellidos': apellidos};
  }
}
