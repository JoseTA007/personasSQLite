import 'dart:core';

import 'persona.dart';
import 'db.dart';
import 'package:flutter/material.dart';

class Listado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Personas"),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.pushNamed(context, "/editar",
                arguments: Persona(id: 0, nombre: "", apellidos: ""));
          },
        ),
        body: Container(child: Lista()));
  }
}

class Lista extends StatefulWidget {
  @override
  _MiLista createState() => _MiLista();
}

class _MiLista extends State<Lista> {
  List<Persona> persona = [];

  @override
  void initState() {
    cargaPersonas();
    super.initState();
  }

  cargaPersonas() async {
    List<Persona> auxPersona = await DB.personas();

    setState(() {
      persona = auxPersona;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: persona.length,
        itemBuilder: (context, i) => Dismissible(
            key: Key(i.toString()),
            direction: DismissDirection.startToEnd,
            background: Container(
                color: Colors.red,
                padding: EdgeInsets.only(left: 5),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Icon(Icons.delete, color: Colors.white))),
            onDismissed: (direction) {
              DB.delete(persona[i]);
            },
            child: ListTile(
                title: Text(persona[i].nombre),
                trailing: MaterialButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/editar",
                          arguments: persona[i]);
                    },
                    child: Icon(Icons.edit)))));
  }
}
