import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mario_game/const/app_const.dart';
import 'package:mario_game/game/mario_game.dart';

class MarioRun extends SpriteAnimationComponent
    with HasGameRef<MarioGame>, CollisionCallbacks {
  double _marioYPosition = 0;
  int score = 0;

  @override
  Future<void> onLoad() async {
    debugMode = kDebugMode;
    _marioYPosition = gameRef.size[1] / 2.1;
    final runMario = await Flame.images.load('ic_mario_run.png');
    final spriteSheet = SpriteSheet(
      image: runMario,
      srcSize: Vector2(
        AppConst.marioRunSizeX,
        AppConst.marioRunSizeY,
      ),
    );
    final spriteAnimation = spriteSheet.createAnimation(
      row: 0,
      stepTime: 0.05,
      to: 8,
    );
    animation = spriteAnimation;
    size = Vector2(100, 100);
    positionToFloor();
    add(
      RectangleHitbox(
        position: Vector2(40, 0),
        size: Vector2(40, 80),
      ),
    );
  }

  void positionToFloor() {
    position = Vector2(50, _marioYPosition) ;
  }

  void jump() {
    FlameAudio.play('fly.wav');
    add(
      MoveByEffect(
        Vector2(0, -100),
        EffectController(duration: _getDuration(), curve: Curves.decelerate),
        onComplete: () => _backToFloor(),
      ),
    );
  }

  void _backToFloor() {
    add(
      MoveByEffect(
        Vector2(0, 100),
        EffectController(duration: _getDuration(), curve: Curves.linear),
        onComplete: () {},
      ),
    );
  }

  double _getDuration() {
   return 0.5;
  }

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    FlameAudio.play('collision.wav');
    game.gameOver();
    score = 0;
    super.onCollisionStart(intersectionPoints, other);
  }
}
