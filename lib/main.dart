import 'package:flash_chat/pages/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/pages/login_page.dart';
import 'package:flash_chat/pages/register_page.dart';
import 'package:flash_chat/pages/chat_page.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      routes: {
        '/' : (context) => const WelcomePage(),
        '/login_page' : (context) =>const LoginPage(),
        '/register_page' : (context) =>const RegisterPage(),
        '/chat_page' : (context) => const ChatPage(),
      },
    );
  }
}
