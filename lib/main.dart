import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flare_dart/actor.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
          canvasColor: Colors.blueGrey.shade700
          // This makes the visual density adapt to the platform that you run
          // the app on. For desktop platforms, the controls will be smaller and
          // closer together (more dense) than on mobile platforms.
          ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  String animationType = 'idle';
  String pass = 'admin';

  final passwordController = TextEditingController();
  final passwordFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    passwordFocus.addListener(() {
      if (passwordFocus.hasFocus) {
        setState(() {
          animationType = 'test';
        });
      } else {
        setState(() {
          animationType = 'idle';
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 200,
              width: 200,
              child: CircleAvatar(
                child: ClipOval(
                  child: FlareActor(
                    'assets/teddy_test.flr',
                    alignment: Alignment.center,
                    fit: BoxFit.contain,
                    animation: animationType,
                  ),
                ),
                backgroundColor: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 80,
            width: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              height: 140,
              width: 530,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'User name',
                        contentPadding: EdgeInsets.all(20)),
                  ),
                  Divider(),
                  TextFormField(
                    controller: passwordController,
                    focusNode: passwordFocus,
                    obscureText: true,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'password',
                        contentPadding: EdgeInsets.all(20)),
                  ),
                ],
              ),
            ),
          ),
          RaisedButton(
            color: Colors.pink,
            onPressed: () {
              if (passwordController.text.compareTo(pass) == 0) {
                setState(() {
                  animationType = 'success';
                });
              } else {
                setState(() {
                  animationType = 'fail';
                });
              }
            },
            child: Text(
              'Submit',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
