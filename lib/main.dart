// import 'dart:typed_data';
import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Home());
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AudioPlayer player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Play Sound in Flutter App"),
            backgroundColor: Colors.redAccent),
        body: Container(
            margin: EdgeInsets.only(top: 50),
            child: Wrap(
              spacing: 10,
              children: [
                ElevatedButton.icon(
                    onPressed: () async {
                      String audioasset = "audio/testaudio.wav";
                      // ByteData bytes = await rootBundle
                      //     .load(audioasset); //load sound from assets
                      // Uint8List soundbytes = bytes.buffer.asUint8List(
                      //     bytes.offsetInBytes, bytes.lengthInBytes);
                      //int result = await player.playBytes(soundbytes);
                      await player.play(AssetSource(audioasset));
                      // if (result == 1) {
                      //   //play success
                      //   print("Sound playing successful.");
                      // } else {
                      //   print("Error while playing sound.");
                      // }
                    },
                    icon: Icon(Icons.play_arrow),
                    label: Text("Play")),
                ElevatedButton.icon(
                    onPressed: () async {
                      await player.stop();

                      // You can pasue the player
                      // int result = await player.pause();

                      // if (result == 1) {
                      //   //stop success
                      //   print("Sound playing stopped successfully.");
                      // } else {
                      //   print("Error on while stopping sound.");
                      // }
                    },
                    icon: Icon(Icons.stop),
                    label: Text("Stop")),
              ],
            )));
  }
}
