import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:magister_clone/screens/home/home.dart';
import 'package:magister_clone/screens/home/navegacao.dart';
import 'package:magister_clone/screens/whapper.dart';
import 'package:magister_clone/services/auth.dart';
import 'package:provider/provider.dart';
import 'screens/authenticate/login.dart';
import 'package:magister_clone/models/users.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<Myuser?>.value(
      catchError: (_, __) => null,
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
