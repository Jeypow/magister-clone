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
import 'package:magister_clone/screens/home/home.dart';

class perfilsTile extends StatelessWidget {
  final Horarios horarios;
  perfilsTile({required this.horarios});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(horarios.foto),
          ),
          SizedBox(height: 16),
          Text(
            horarios.matricula,
            style: TextStyle(
                color: Colors.blue[300],
                fontSize: 20,
                fontWeight: FontWeight.normal),
          ),
          Text(
            horarios.aluno,
            style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.normal),
          ),
          Text(
            horarios.curso,
            style: TextStyle(fontSize: 18, height: 2, color: Colors.white),
          ),
          SizedBox(height: 32),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            padding: EdgeInsets.all(8),
            constraints: BoxConstraints(minWidth: 500, maxWidth: 500),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(12),
                  constraints: BoxConstraints(minWidth: 500, maxWidth: 500),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.blue,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'MGP',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  horarios.mgp,
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
