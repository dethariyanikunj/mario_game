import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame/flame.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/foundation.dart';
import 'package:mario_game/game/mario_game.dart';

class GameSpikes extends SpriteComponent
    with HasGameRef<MarioGame>, CollisionCallbacks {
  @override
  Future<void> onLoad() async {
    debugMode = kDebugMode;
    final spike = await Flame.images.load('ic_spikes.png');
    sprite = Sprite(await spike.resize(Vector2(50, 50)));
    position = Vector2(
      gameRef.size[0] / 1,
      gameRef.size[1] / 1.8,
    );
    add(RectangleHitbox(size: Vector2(50, 40), position: Vector2(0, 10)));
  }

  @override
  void update(double dt) {
    position.x -= _getPositionWithSpeed(dt);
    if (position.x < -10) {
      removeFromParent();
      FlameAudio.play('point.wav');
      gameRef.marioRun.score += 1;
    }
    super.update(dt);
  }

  double _getPositionWithSpeed(double dt) {
    if (gameRef.marioRun.score <= 5) {
      return 200 * dt;
    } else if (gameRef.marioRun.score > 5 && gameRef.marioRun.score <= 10) {
      return 300 * dt;
    } else if (gameRef.marioRun.score > 10 && gameRef.marioRun.score <= 15) {
      return 400 * dt;
    } else if (gameRef.marioRun.score > 20 && gameRef.marioRun.score <= 25) {
      return 500 * dt;
    }
    return 800 * dt;
  }

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    removeFromParent();
    super.onCollisionStart(intersectionPoints, other);
  }
}
