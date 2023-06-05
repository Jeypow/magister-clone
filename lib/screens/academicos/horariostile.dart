import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:magister_clone/screens/home/home.dart';
import 'package:magister_clone/screens/home/navegacao.dart';
import 'package:magister_clone/screens/whapper.dart';
import 'package:magister_clone/services/auth.dart';
import 'package:magister_clone/widgets/textos.dart';
import 'package:provider/provider.dart';
import 'package:magister_clone/models/users.dart';
import 'package:magister_clone/screens/academicos/horarioslist.dart';
import 'package:magister_clone/services/horariosdb.dart';
import 'package:magister_clone/screens/academicos/horarios.dart';
/*
class horariosTile extends StatelessWidget {
  final Horarios horarios;
  horariosTile({required this.horarios});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextContainer(texto: '28/03/2023- dia semana'),
          SizedBox(height: 10),
          textocinza(
            texto: 'campus aracaju Farolandia',
          ),
          SizedBox(height: 5),
          Card(
              margin: EdgeInsets.fromLTRB(10, 6, 10, 0),
              child: ListTile(
                leading: hora(texto: '20:30'),
                title: Text(horarios.campos),
                subtitle: Text(horarios.nome),
              )),
          Card(
              margin: EdgeInsets.fromLTRB(10, 6, 10, 0),
              child: ListTile(
                leading: hora(texto: '20:30'),
                title: Text(horarios.campos),
                subtitle: Text(horarios.nome),
              )),
        ],
      ),
    );
  }
}
*/