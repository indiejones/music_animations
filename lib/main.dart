import 'package:flame/experimental.dart';
// import 'package:flame/extensions.dart';
import 'package:flame/game.dart';

import 'package:flutter/widgets.dart';
import 'package:music_animations/drag_handle.dart';

void main() {
  final audioGame = AudioGame();
  runApp(GameWidget(game: audioGame));
}

class AudioGame extends FlameGame with HasDraggableComponents {
  @override
  Future<void> onLoad() async {
    // pool = await FlameAudio.createPool(
    //   'sfx/fire_2.mp3',
    //   minPlayers: 3,
    //   maxPlayers: 4,
    // );
    //startBgmMusic();
    add(MyComponent(position: Vector2(50, 50)));
    add(MyComponent(position: Vector2(150, 150)));
  }

  //Rect get button => Rect.fromLTWH(20, size.y - 300, size.x - 40, 200);

  // void startBgmMusic() {
  //   FlameAudio.bgm.initialize();
  //   FlameAudio.bgm.play('audio/');
  // }

  // void fireOne() {
  //   FlameAudio.play('testaudio.wav');
  // }

  // void fireTwo() {
  //   pool.start();
  // }

//   @override
//   void render(Canvas canvas) {
//     super.render(canvas);
//     // canvas.drawRect(size.toRect(), black);

//     // text.render(
//     //   canvas,
//     //   '(click anywhere for 1)',
//     //   Vector2(size.x / 2, 200),
//     //   anchor: Anchor.topCenter,
//     // );

//     // canvas.drawRect(button, gray);

//     // text.render(
//     //   canvas,
//     //   'click here for 2',
//     //   Vector2(size.x / 2, size.y - 200),
//     //   anchor: Anchor.bottomCenter,
//     // );
//   }

//   // @override
//   // void onDragDown(DragDownEvent event) {
//   //   super.onDragDown(event);
//   //   if (!event.handled) {
//   //     print('Event $event was not handled by any component');
//   //   }
//   // }

//   // @override
//   // void onTapDown(TapDownInfo details) {
//   //   // if (button.containsPoint(details.eventPosition.game)) {
//   //   //   fireTwo();
//   //   // } else {
//   //   fireOne();
//   //   //}
//   // }
// }
}
