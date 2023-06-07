import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram_demo/responsive_screens/mobile_screen_layout.dart';
import 'package:instagram_demo/responsive_screens/responsive_layout.dart';
import 'package:instagram_demo/responsive_screens/web_screen_layout.dart';
import 'package:instagram_demo/screens/login.dart';
import 'package:instagram_demo/screens/sign_up_screen.dart';
import 'package:instagram_demo/utils/colors.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  kIsWeb? await Firebase.initializeApp(
    options:const  FirebaseOptions(
        apiKey: "AIzaSyBPJmVK6Z4aEAzMviAJn8k08rlyqmy01Js",
        appId:"1:243982046214:web:2f85eb93c325f58ddcdf87",
        messagingSenderId: "243982046214",
        projectId:  "instagram-demo-53eb9",
        storageBucket: "instagram-demo-53eb9.appspot.com",
    )
  ):
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram Clone',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor
      ),
      home: LoginScreen()
      //const ResponsiveLayout(webScreenLayout: WebScreenLayout(), mobileScreenLayout: MobileScreenLayout(),),
    );
  }
}
