import 'dart:ffi';

import 'package:flutter/material.dart';

class Perfils {
  final String uid;
  final String nome;
  final String matricula;
  final Int mgp;
  Perfils(
      {required this.nome,
      required this.matricula,
      required this.uid,
      required this.mgp});
}
