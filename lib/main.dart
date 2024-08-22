import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MainApp());
}

const channel = MethodChannel('x_platformmenubar_freeze/channel');

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        child: Center(
          child: Column(
            children: [
              "setIsVisible(true)",
              "NSApp.unhide(nil)",
              "setIsVisible(false)", // crashes/exits
              "NSApp.hide(nil)", // works but cannot be unhidden
            ]
                .map(
                  (e) => CupertinoButton(
                    onPressed: () {
                      channel.invokeMethod(e);
                    },
                    child: Text(e),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
