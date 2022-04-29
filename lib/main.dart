import 'package:flutter/material.dart';

import 'modules/sign_in_screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignInScreen(),
      theme: ThemeData(
        textTheme:TextTheme(

        )
      ),
    );
  }
}
