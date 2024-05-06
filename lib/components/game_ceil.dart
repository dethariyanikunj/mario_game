import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame/flame.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mario_game/game/mario_game.dart';

class GameCeil extends ParallaxComponent<MarioGame> with HasGameRef<MarioGame> {
  @override
  Future<void> onLoad() async {
    debugMode = kDebugMode;
    // final ceil = await Flame.images.load('ic_ceil.png');
    // final resizedCeil = await ceil.resize(Vector2(100, 100));
    final ceilLight = await Flame.images.load('ic_ceil_light.png');
    final resizedCeilLight = await ceilLight.resize(Vector2(100, 100));
    position = Vector2(0, -(gameRef.size.y / 1.3));
    parallax = Parallax(
      [
        /*ParallaxLayer(
          ParallaxImage(
            resizedCeil,
            repeat: ImageRepeat.repeat,
            fill: LayerFill.none,
          ),
        ),*/
        ParallaxLayer(
          ParallaxImage(
            resizedCeilLight,
            repeat: ImageRepeat.repeat,
            fill: LayerFill.none,
          ),
        ),
      ],
      baseVelocity: Vector2(100, 0),
    );
    add(RectangleHitbox(
      size: Vector2(game.size.x, 350),
    ));
  }
}
