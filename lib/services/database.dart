import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:magister_clone/models/users.dart';
import 'package:magister_clone/services/aulasdb.dart';

import 'package:magister_clone/services/horariosdb.dart';

class DatabaseService {
  final String uid;
  //horarios-perfil
  DatabaseService({required this.uid});
  final CollectionReference horarioCollection =
      FirebaseFirestore.instance.collection("horarios");
  Future updateUserData(
    String nome,
    String campos,
    String dia,
    String matricula,
    String aluno,
    String mgp,
    String curso,
    String foto,
  ) async {
    Map<String, dynamic>? data = {
      'uid': uid,
      'dia': dia,
      'nome': nome,
      'campos': campos,
      'matricula': matricula,
      'aluno': aluno,
      'mgp': mgp,
      'curso': curso,
      'foto': foto,
    };
    return await horarioCollection.doc(uid).set(data);
  }

// aulas

  final CollectionReference aulasCollection =
      FirebaseFirestore.instance.collection("aulas");

  Future updateAulasData(String aulas, String horas, String local, String matri,
      String semana, String notas, String faltas) async {
    Map<String, dynamic> data = {
      'aulas': aulas,
      'horas': horas,
      'local': local,
      'matri': matri,
      'semana': semana,
      'notas': notas,
      'faltas': faltas,
    };
    return await aulasCollection.doc(uid).set(data);
  }

//list Horarios
  List<Horarios> _horariosListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Horarios(
        uid: doc.id,
        dia: doc.get('dia') ?? 'semana',
        nome: doc.get('nome') ?? 'joao',
        campos: doc.get('campos') ?? 'bloco b',
        matricula: doc.get('matricula') ?? 'matricula',
        aluno: doc.get('aluno') ?? 'aluno',
        mgp: doc.get('mgp') ?? 'mgp',
        curso: doc.get('curso') ?? 'curso',
        foto: doc.get('foto') ?? 'foto',
      );
    }).toList();
  }

//UserData from Snapshot
  UserData _UserDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      nome: snapshot.get('nome'),
      campos: snapshot.get('campos'),
    );
  }

//get horarios stream
  Stream<List<Horarios>?> get horario {
    return horarioCollection.snapshots().map(_horariosListFromSnapshot);
  }

  //get user doc stream
  Stream<UserData> get userData {
    return horarioCollection.doc(uid).snapshots().map((snapshot) {
      return _UserDataFromSnapshot(snapshot);
    });
  }
}
