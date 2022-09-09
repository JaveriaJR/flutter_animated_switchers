library flutter_animated_switchers;

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:http/retry.dart';
import 'package:rive/rive.dart';
import 'package:http/http.dart' as http;

/// A Calculator.
class Calculator {
  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;
}

enum SwitcherType { styleOne, styleTwo, styleThree, styleFour, styleFive }

/// An example showing how to drive a StateMachine via a trigger and number
/// input.
class FlutterAnimatedSwitcher extends StatefulWidget {
  final double? width;
  final double? height;
  final BoxFit? boxFit;
  final SwitcherType switcherType;
  const FlutterAnimatedSwitcher(
      {Key? key,
      required this.switcherType,
      this.width,
      this.height,
      this.boxFit})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _FlutterAnimatedSwitcherState createState() =>
      _FlutterAnimatedSwitcherState();
}

class _FlutterAnimatedSwitcherState extends State<FlutterAnimatedSwitcher> {
  /// Tracks if the animation is playing by whether controller is running.
  bool get isPlaying => _controller?.isActive ?? false;

  Artboard? _riveArtboard;
  StateMachineController? _controller;
  SMITrigger? _stateOn;
  SMITrigger? _stateOff;
  late bool _state;
  test2() async {
    // final client = RetryClient(http.Client());
    final url = Uri.parse(
        // 'https://raw.githubusercontent.com/rive-app/rive-flutter/master/example/assets/liquid_download.riv');
        // "https://github.com/JaveriaJR/bluetooth_advanced/blob/main/switchers_animated.riv?raw=true");
        "https://github.com/JR-Asif/RIVE/blob/main/switchers_animated/switchers_animated.riv?raw=true");
    final res = await http.get(url);
    final file = RiveFile.import(res.bodyBytes.buffer.asByteData());
    print("**rive http: " + file.toString());
  }

  @override
  void initState() {
    super.initState();
    _state = false;
    // Load the animation file from the bundle, note that you could also
    // download this. The RiveFile just expects a list of bytes.

    test2();
    rootBundle.load('assets/switchers_animated.riv').then(
      (data) async {
        print("**data**");
        // Load the RiveFile from the binary data.

        final file = RiveFile.import(data);
        // The artboard is the root of the animation and gets drawn in the
        // Rive widget.
        final artboard =
            file.artboardByName(getSwitcherType(widget.switcherType)) ??
                file.mainArtboard;
        var controller = StateMachineController.fromArtboard(
            artboard, getSwitcherType(widget.switcherType) + '_sm');
        if (controller != null) {
          artboard.addController(controller);
          _stateOn = controller.findInput<bool>('state_on') as SMITrigger;
          _stateOff = controller.findInput<bool>('state_off') as SMITrigger;
        }
        setState(() {
          _riveArtboard = artboard;
          _stateOff!.fire();
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _riveArtboard == null
        ? const SizedBox()
        : GestureDetector(
            onTapDown: (_) {
              if (_state == true) {
                _stateOff!.fire();
              } else {
                _stateOn!.fire();
              }
              setState(() {
                _state = !_state;
              });
            },
            child: SizedBox(
              height: widget.height ?? 100,
              width: widget.width ?? 150,
              child: Rive(
                artboard: _riveArtboard!,
                fit: BoxFit.contain,
              ),
            ),
          );
  }
}

String getStringFromBytes(ByteData data) {
  final buffer = data.buffer;
  print(data.elementSizeInBytes);
  print(data.lengthInBytes);
  print(data.offsetInBytes);
  var list = buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  print(list);
  print("***");
  print(Utf8Decoder().convert(list));
  return "utf8.decode(list);";
}

String getSwitcherType(SwitcherType type) {
  String typeName;
  switch (type) {
    case SwitcherType.styleOne:
      typeName = "switcher_1";
      break;
    case SwitcherType.styleTwo:
      typeName = "switcher_2";
      break;
    case SwitcherType.styleThree:
      typeName = "switcher_3";
      break;
    case SwitcherType.styleFour:
      typeName = "switcher_4";
      break;
    case SwitcherType.styleFive:
      typeName = "switcher_5";
      break;
    default:
      typeName = "switcher_2";
  }
  return typeName;
}
