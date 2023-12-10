import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:authentic_vision_sdk/authentic_vision_sdk.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _sdkVersion = 'Unknown';
  String _scanResult = '';
  final _authenticVisionSdkPlugin = AuthenticVisionSdk();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String sdkVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      sdkVersion = await _authenticVisionSdkPlugin.getSdkVersion() ?? 'Error';
    } on PlatformException {
      sdkVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _sdkVersion = sdkVersion;
    });
  }

  Future<void> scanLabel() async {
    try {
      String? result = await _authenticVisionSdkPlugin.scanOneLabel();
      setState(() {
        _scanResult = result ?? 'no result';
      });
    } catch (e) {
      setState(() {
        _scanResult = 'exception: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: scanLabel,
                child: const Text('Scan Label'),
              ),
              if (_scanResult.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(_scanResult),
                ),
              Text(_sdkVersion),
            ],
          ),
        ),
      ),
    );
  }
}
