import 'package:flutter/material.dart';
import 'package:magister_clone/screens/Perfil/perfillist.dart';
import 'package:magister_clone/screens/authenticate/login.dart';
import 'package:magister_clone/screens/authenticate/authenticate.dart';
import 'package:magister_clone/screens/whapper.dart';
import 'package:magister_clone/services/auth.dart';
import 'package:magister_clone/services/database.dart';
import 'package:magister_clone/services/horariosdb.dart';
import 'package:provider/provider.dart';

class Perfil extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Horarios>?>.value(
      value: DatabaseService(uid: '').horario,
      initialData: null,
      child: Scaffold(
        backgroundColor: Color(0xFF234E98),
        appBar: AppBar(
          title: const Text('Perfil'),
          titleTextStyle: TextStyle(color: Colors.blue[900], fontSize: 22),
          iconTheme: IconThemeData(color: Colors.blue[900]),
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Sair'),
                      content: Text('Deseja sair do aplicativo?'),
                      actions: [
                        TextButton(
                          child: Text('Cancelar'),
                          onPressed: () {
                            Navigator.of(context).pop(); // fecha o AlertDialog
                          },
                        ),
                        TextButton(
                          child: Text('Sair'),
                          onPressed: () async {
                            // fecha o AlertDialog
                            // adicione aqui a lógica para sair do aplicativo
                            await _auth.singOut();
                            // fecha o AlertDialog
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Wrapper()),
                              (route) => false,
                            );
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
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
            child: perfillist()),
        /*
          Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/perfil.png'),
                ),
                SizedBox(height: 16),
                Text(
                  '1231153595',
                  style: TextStyle(
                      color: Colors.blue[300],
                      fontSize: 20,
                      fontWeight: FontWeight.normal),
                ),
                Text(
                  'Joâo Paulo Araujo Santos',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.normal),
                ),
                Text(
                  'Ciência da Computação - Tarde/Noite',
                  style:
                      TextStyle(fontSize: 18, height: 2, color: Colors.white),
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
                        constraints:
                            BoxConstraints(minWidth: 500, maxWidth: 500),
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
                        '7.5',
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
          ),
        ),
        
      ),
      */
      ),
    );
  }
}
