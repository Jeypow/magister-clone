import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:magister_clone/models/users.dart';
import 'package:magister_clone/screens/Perfil/perfil.dart';
import 'package:magister_clone/services/auth.dart';
import 'package:magister_clone/services/horariosdb.dart';
import 'package:magister_clone/widgets/textos.dart';
import 'package:provider/provider.dart';
import 'package:magister_clone/services/database.dart';
import 'package:magister_clone/screens/academicos/horariostile.dart';
import 'package:magister_clone/screens/Perfil/perfilsTile.dart';
import 'package:firebase_auth/firebase_auth.dart';

class perfillist extends StatefulWidget {
  @override
  State<perfillist> createState() => _perfillistState();
}

class _perfillistState extends State<perfillist> {
  @override
  Widget build(BuildContext context) {
    final horario = Provider.of<List<Horarios>?>(context);
    final uidAtual =
        Provider.of<Myuser?>(context)?.uid; // Obtenha o UID atual do usuário

    return ListView.builder(
      itemCount: horario?.length ?? 0,
      itemBuilder: (context, index) {
        if (horario != null && index < horario.length) {
          print("UID atual: $uidAtual");
          if (horario[index].uid == uidAtual) {
            return perfilsTile(
              horarios: horario[index],
            );
          }
        } else {
          return Container();
        }
      },
    );
  }
}
