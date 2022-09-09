import 'package:flutter/material.dart';
import 'package:flutter_animated_switchers/flutter_animated_switchers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text("Flutter Animated Switcher")),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: const [
              SizedBox(height: 50),
              FlutterAnimatedSwitcher(
                switcherType: SwitcherType.styleOne,
              ),
              FlutterAnimatedSwitcher(
                switcherType: SwitcherType.styleTwo,
              ),
              FlutterAnimatedSwitcher(
                switcherType: SwitcherType.styleThree,
              ),
              FlutterAnimatedSwitcher(
                switcherType: SwitcherType.styleFour,
              ),
              FlutterAnimatedSwitcher(
                switcherType: SwitcherType.styleFive,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
