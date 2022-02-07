// import 'dart:html';

import 'package:flutter/material.dart';
// import 'package:flash_chat/pages/login_page.dart';
// import 'package:flash_chat/pages/register_page.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/templates/button_template.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> with SingleTickerProviderStateMixin {

  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(vsync: this,
    duration: const Duration(seconds: 2),
    );
    animation = ColorTween(begin: Colors.grey[700] , end: Colors.white).animate(controller);
    controller.forward();
    controller.addListener(() => setState(() {

    }) );
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child:  SizedBox(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                DefaultTextStyle(
                  style:  const TextStyle(
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.black54,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                  child: AnimatedTextKit(
                  repeatForever: true,
                   animatedTexts: [
                     FlickerAnimatedText('Flash Chat',
                       textStyle: const TextStyle(
                           fontSize: 42.0,
                           fontWeight: FontWeight.w900,
                           color: Colors.black54
                       ),
                     ),
                   ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
            ButtonTemplate(buttonColor: Colors.lightBlueAccent,
                buttonText: 'Log In',
                onPress: () {
                  Navigator.pushNamed(context, '/login_page');
                },
            ),
           ButtonTemplate(
               buttonColor: Colors.blueAccent,
               buttonText: 'Register',
               onPress: () {
                 Navigator.pushNamed(context, '/register_page');
               },
           ),
          ],
        ),
      ),
    );
  }
}
