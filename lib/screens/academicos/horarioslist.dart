import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:magister_clone/services/auth.dart';
import 'package:magister_clone/services/horariosdb.dart';
import 'package:magister_clone/widgets/textos.dart';
import 'package:provider/provider.dart';
import 'package:magister_clone/services/database.dart';
import 'package:magister_clone/screens/academicos/horariostile.dart';
import 'package:magister_clone/services/aulasdb.dart';
import 'package:magister_clone/screens/academicos/aulaslist.dart';
/*
class horariolist extends StatefulWidget {
  @override
  State<horariolist> createState() => _horariolistState();
}

class _horariolistState extends State<horariolist> {
  @override
  Widget build(BuildContext context) {
    final horario = Provider.of<List<Horarios>?>(context);

    return ListView.builder(
      itemCount: horario?.length ?? 0,
      itemBuilder: (context, index) {
        if (horario != null && index < horario.length) {
          return horariosTile(
            horarios: horario[index],
          );
        } else {
          return Container(); // Ou qualquer outro widget vazio
        }
      },
    );
  }
}
*/