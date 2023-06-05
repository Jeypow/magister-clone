import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:magister_clone/services/aulasdb.dart';
import 'package:provider/provider.dart';
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

class AulasList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('aulas').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final aulasList = snapshot.data!.docs
              .map((doc) => Aulas.fromSnapshot(doc))
              .toList();
          return ListView.builder(
            itemCount: aulasList.length,
            itemBuilder: (context, index) {
              final aula = aulasList[index];
              if (aula.matri != "1231153595") {
                return Container(); // Ignorar a exibição deste item
              }

              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextContainer(texto: aula.semana),
                    SizedBox(height: 10),
                    textocinza(
                      texto: 'campus aracaju Farolandia',
                    ),
                    SizedBox(height: 5),
                    Card(
                        margin: EdgeInsets.fromLTRB(10, 6, 10, 0),
                        child: ListTile(
                          leading: hora(texto: aula.horas),
                          title: Text(
                            aula.local,
                            style: TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 15, 91, 153),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          subtitle: Text(
                            aula.aulas,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        )),
                    Card(
                        margin: EdgeInsets.fromLTRB(10, 6, 10, 0),
                        child: ListTile(
                          leading: hora(texto: aula.horas),
                          title: Text(
                            aula.local,
                            style: TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 15, 91, 153),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          subtitle: Text(
                            aula.aulas,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        )),
                  ],
                ),
              );
            },
          );
        } else if (snapshot.hasError) {
          return Text('Erro ao carregar as aulas');
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}

class Aulas {
  final String uid;
  final String aulas;
  final String horas;
  final String local;
  final String matri;
  final String semana;
  final String notas;
  final String faltas;

  Aulas({
    required this.uid,
    required this.aulas,
    required this.horas,
    required this.local,
    required this.matri,
    required this.semana,
    required this.notas,
    required this.faltas,
  });

  factory Aulas.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return Aulas(
      uid: snapshot.id,
      aulas: data['aulas'],
      horas: data['horas'],
      local: data['local'],
      matri: data['matri'],
      semana: data['semana'],
      notas: data['notas'],
      faltas: data['faltas'],
    );
  }
}
