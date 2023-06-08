import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class MyComponent extends PositionComponent with DragCallbacks {
  MyComponent({required super.position})
      : super(size: Vector2.all(100), anchor: Anchor.center);

  final _paint = Paint();
  bool _isDragged = false;
  late double halfSize;
  late AudioPlayer audioPlayer;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    halfSize = size.r / 2;
    audioPlayer = AudioPlayer();
    audioPlayer.setReleaseMode(ReleaseMode.loop);
    //audioPlayer.
    //audioPlayer.setSource(DeviceFileSource('testaudio.wav'));
  }

  @override
  Future<void> onDragStart(DragStartEvent event) async {
    super.onDragStart(event);
    _isDragged = true;

    if (audioPlayer.state != PlayerState.playing) {
      audioPlayer.play(AssetSource('audio/testaudio.wav'), volume: 0.5);
    } else {
      audioPlayer.resume();
    }

    // await FlameAudio.play('testaudio.wav');
  }

  @override
  Future<Vector2> onDragUpdate(DragUpdateEvent event) async {
    return position += event.delta;
  }

  @override
  void onDragEnd(DragEndEvent event) async {
    super.onDragEnd(event);
    _isDragged = false;
    audioPlayer.pause();
  }

  @override
  void render(Canvas canvas) {
    _paint.color = _isDragged ? Colors.red : Colors.white;
    //canvas.drawRect(size.toRect(), _paint);
    canvas.drawCircle(Offset(halfSize, halfSize), halfSize, _paint);
  }
}
