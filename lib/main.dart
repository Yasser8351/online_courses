import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'screen/login.dart';
import 'screen/register.dart';
import 'screen/tab_screen.dart';
import 'widget/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Online App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme(
          primary: Colors.blueAccent,
          onPrimary: Colors.blueAccent,
          primaryVariant: Colors.blueAccent,
          background: Color(0xff868C8F),
          onBackground: Colors.black,
          secondary: Color(0xff095BA4),
          onSecondary: Colors.white,
          secondaryVariant: Colors.black87,
          error: Colors.red,
          onError: Colors.orange.shade200,
          surface: Colors.white,
          onSurface: Colors.black54,
          brightness: Brightness.light,
        ),
      ),
      home: Authenticate(),
      routes: {
        //Home.routeName: (ctx) => const Home(),
        TabScreen.routeName: (ctx) => const TabScreen(),
        Login.routeName: (ctx) => const Login(),
        Register.routeName: (ctx) => const Register(),
        // Group.routeName: (ctx) => const Group(),
        // More.routeName: (ctx) => const More(),
        // ProfileDoctor.routeName: (ctx) => ProfileDoctor(),
        // Chat.routeName: (ctx) => const Chat(),
        // ShowStatus.routeName: (ctx) => const ShowStatus(),
        // AddStatus.routeName: (ctx) => const AddStatus(),
        // AboutApp.routeName: (ctx) => const AboutApp(),
        // Privacypolicy.routeName: (ctx) => const Privacypolicy(),
      },
    );
  }
}
