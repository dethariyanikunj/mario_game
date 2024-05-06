import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/parallax.dart';
import 'package:mario_game/game/mario_game.dart';

class GameFloor extends ParallaxComponent<MarioGame> with HasGameRef<MarioGame> {
  @override
  Future<void> onLoad() async {
    final floor = await Flame.images.load('ic_floor.png');
    position = Vector2(0, gameRef.size.y / 3);
    parallax = Parallax(
      [
        ParallaxLayer(
          ParallaxImage(
            floor,
            fill: LayerFill.none,
          ),
        ),
      ]
    );
  }
}
