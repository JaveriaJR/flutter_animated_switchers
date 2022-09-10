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
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

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
      backgroundColor: Colors.purple.shade50,
      appBar: AppBar( 
          backgroundColor: Colors.purple,
          title: const Text("Flutter Animated Switchers")),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const FlutterAnimatedSwitcher(
              switcherType: SwitcherType.styleOne,
            ),
            const FlutterAnimatedSwitcher(
              switcherType: SwitcherType.styleTwo,
            ),
            const FlutterAnimatedSwitcher(
              switcherType: SwitcherType.styleThree,
            ),
            const FlutterAnimatedSwitcher(
              switcherType: SwitcherType.styleFour,
            ),
            FlutterAnimatedSwitcher(
              switcherType: SwitcherType.styleFive,
              onTap: (() {
                // ignore: avoid_print
                print("Tapped");
              }),
              onStateChanged: ((state) {
                // ignore: avoid_print
                print("current state is $state");
              }),
            ),
          ],
        ),
      ),
    );
  }
}
