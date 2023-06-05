import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:magister_clone/screens/academicos/academicos.dart';
import 'package:magister_clone/screens/home/home.dart';
import 'package:magister_clone/screens/home/navegacao.dart';
import 'package:magister_clone/services/auth.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFF234E98),
              const Color(0xFF1D3060),
            ],
          ),
        ),
        child: Center(
          child: Container(
            margin: EdgeInsets.fromLTRB(20, 40, 20, 0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo.png', // substitua com o caminho da imagem do seu logo
                    height: 100,
                  ),
                  SizedBox(height: 40),
                  TextFormField(
                    validator: (val) => val!.isEmpty ? "Enter an email" : null,
                    onChanged: (val) {
                      setState(() => email = val);
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 20,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    validator: (val) =>
                        val!.length < 6 ? "Enter a password " : null,
                    onChanged: (val) {
                      setState(() => password = val);
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Senha',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 20,
                      ),
                    ),
                  ),
                  SizedBox(height: 2),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState != null &&
                          _formKey.currentState!.validate()) {
                        dynamic credential = await _auth
                            .registerWithEmailAndPassword(email, password);
                        if (credential == null) {
                          setState(() => error = 'entre com um email valido');
                        } else {}
                      }
                    },
                    child: Text('register'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.lightBlueAccent,
                      padding: EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 80,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  /*
                ElevatedButton(
                  onPressed: () async {
                    dynamic credential = await _auth.signInAnon();
                    if (credential == null) {
                      print('error no login anon');
                    } else {
                      print('logado');
                      print(credential.uid);
                    }
                  },
                  child: Text('anon'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.lightBlueAccent,
                    padding: EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 80,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                */
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
