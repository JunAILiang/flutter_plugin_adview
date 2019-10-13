import 'package:flutter/material.dart';
import 'package:flutter_plugin_adview/flutter_plugin_adview.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  FlutterPluginAdView adView;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            adView = FlutterPluginAdView("SDK20191911071055ez1mj78nh8bdwcc","POSID7zvfqc4h7lbe",
              listener: (AdViewEvents events, Map<String, dynamic> args) {
                print("我走进了回调" + events.toString());
                if (events == AdViewEvents.didReadyToPlay) { /// 可以播放
                  adView.showVideo();
                }
              }
            )..loadVideo();
          },
          child: Text('播放'),
        ),
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Running on: $_platformVersion\n'),
        ),
      ),
    );
  }
}
