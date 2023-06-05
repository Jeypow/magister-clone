import 'package:flutter/material.dart';
import 'package:magister_clone/screens/authenticate/login.dart';
import 'package:magister_clone/screens/authenticate/register.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: LoginPage(),
    );
  }
}
