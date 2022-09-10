library flutter_animated_switchers;
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart'; 
import 'package:rive/rive.dart';
import 'package:http/http.dart' as http;

/// Switcher Types containing different animated switchers
enum SwitcherType { styleOne, styleTwo, styleThree, styleFour, styleFive }

/// An example showing how to drive a StateMachine via a trigger and number
/// input.
class FlutterAnimatedSwitcher extends StatefulWidget {
  final double? width;
  final double? height;
  final BoxFit? boxFit;
  final SwitcherType switcherType;

  final VoidCallback? onTap;
  final Function(bool)? onStateChanged;
  const FlutterAnimatedSwitcher(
      {Key? key,
      required this.switcherType,
      this.onTap,
      this.onStateChanged,
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
  Artboard? _riveArtboard;
  SMITrigger? _stateOn;
  SMITrigger? _stateOff;
  bool _state = false;
  @override
  void initState() {
    super.initState();
    _state = false;
    // Load the animation file from the bundle, note that you could also
    // download this. The File just expects a list of bytes.
    final url = Uri.parse(
        "https://github.com/JaveriaJR/flutter_animated_switchers/blob/main/assets/switchers_animated.riv?raw=true");
    http.get(url).then((res) {
      // Load the File from the binary data.
      final file = RiveFile.import(res.bodyBytes.buffer.asByteData());
      // Artboard containing relavant switcher types
      final artboard =
          file.artboardByName(getSwitcherType(widget.switcherType)) ??
              file.mainArtboard;
      var controller = StateMachineController.fromArtboard(
          artboard, "${getSwitcherType(widget.switcherType)}_sm");
      if (controller != null) {
        artboard.addController(controller);
        //controller that handles different states of animated button
        // i.e. On and Off
        _stateOn = controller.findInput<bool>('state_on') as SMITrigger;
        _stateOff = controller.findInput<bool>('state_off') as SMITrigger;
      }
      setState(() {
        _riveArtboard = artboard;
        //initial state is Off
        _stateOff!.fire();
      });
    });
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
              //handles onTap callback 
              //returns [true] if tapped
              widget.onTap == null ? () {} : widget.onTap!();

              //handles onStateChanged Callback
              //returns [_state] on called
              widget.onStateChanged == null
                  ? () {}
                  : widget.onStateChanged!(_state);
            },
            child: SizedBox(
              height: widget.height ?? 100,
              width: widget.width ?? 150,
              child: Rive(
                artboard: _riveArtboard!,
                fit: widget.boxFit ?? BoxFit.contain,
              ),
            ),
          );
  }
}


//to get switcher type based on used input
//returns the artboards name
//default is styleTwo
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
