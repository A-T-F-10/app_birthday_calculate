import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import "package:provider/provider.dart";
import 'model/themeModel.dart';
import 'screens/user.dart';
import 'content/factory_themes.dart';

void main()=> runApp(ChangeNotifierProvider(
    create:(context)=>ThemeChanger(Factory.lightTheme()),
    child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme.getTheme(),
      home: AnimatedSplashScreen(
        nextScreen: Directionality(
          child: User(),
          textDirection: TextDirection.rtl,
        ),
        backgroundColor: Colors.black26,
        animationDuration: Duration(milliseconds: 3500),
        splashTransition: SplashTransition.fadeTransition,
        duration: 700,
        splashIconSize: 500,
        splash:  Image.asset('Image/body.png',fit: BoxFit.cover,),

      )
    );
  }

  
}
