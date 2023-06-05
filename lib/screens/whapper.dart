import 'package:flutter/material.dart';
import 'package:magister_clone/models/users.dart';
import 'package:magister_clone/screens/authenticate/authenticate.dart';
import 'package:magister_clone/screens/home/navegacao.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final Myuser? user = Provider.of<Myuser?>(context);
    // print(user);
    //verificador de login-logout
    if (user == null) {
      return Authenticate();
    } else {
      return NavegPage();
    }
  }
}
