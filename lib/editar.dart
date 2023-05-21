import 'db.dart';
import 'persona.dart';
import 'package:flutter/material.dart';

class Editar extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final nombreController = TextEditingController();
  final especieController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Persona persona = ModalRoute.of(context)?.settings.arguments as Persona;
    nombreController.text = persona.nombre as String;
    especieController.text = persona.apellidos as String;

    return Scaffold(
        appBar: AppBar(title: Text("Guardar")),
        body: Container(
            child: Padding(
          child: Form(
              key: _formKey,
              child: Column(children: <Widget>[
                TextFormField(
                  controller: nombreController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "El nombre es obligatorio";
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: "Nombre"),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: especieController,
                  validator: (value) {
                    if (value!.isEmpty) return "El apellido es obligatoria";
                    return null;
                  },
                  decoration: InputDecoration(labelText: "Apellido"),
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        if (persona.id! > 0) {
                          persona.nombre = nombreController.text;
                          persona.apellidos = especieController.text;
                          DB.update(persona);
                        } else
                          DB.insert(Persona(
                              nombre: nombreController.text,
                              apellidos: especieController.text));
                        Navigator.pushNamed(context, "/");
                      }
                    },
                    child: Text("Guardar"))
              ])),
          padding: EdgeInsets.all(15),
        )));
  }
}
