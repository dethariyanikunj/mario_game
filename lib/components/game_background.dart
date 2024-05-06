import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame/flame.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/material.dart';
import 'package:mario_game/game/mario_game.dart';

class GameBackground extends ParallaxComponent<MarioGame>
    with HasGameRef<MarioGame> {
  @override
  Future<void> onLoad() async {
    final image = await Flame.images.load('ic_game_bg.png');
    final background = await image.resize(Vector2(100, 100));
    position = Vector2(0, gameRef.size.y / 5);
    parallax = Parallax(
      [
        ParallaxLayer(
          ParallaxImage(
            background,
            repeat: ImageRepeat.repeat,
            fill: LayerFill.none,
          ),
        ),
      ],
      baseVelocity: Vector2(200, 0),
    )..size = Vector2(50, 50);
  }
}
