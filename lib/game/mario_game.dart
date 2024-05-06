import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:mario_game/components/game_background.dart';
import 'package:mario_game/components/game_ceil.dart';
import 'package:mario_game/components/game_floor.dart';
import 'package:mario_game/components/game_spikes.dart';
import 'package:mario_game/components/mario_run.dart';
import 'package:mario_game/const/app_const.dart';

class MarioGame extends FlameGame with TapDetector, HasCollisionDetection {
  late MarioRun marioRun;
  late TextComponent score;
  Timer interval = Timer(2, repeat: true);

  @override
  Future<void> onLoad() async {
    addAll([
      GameCeil(),
      GameBackground(),
      marioRun = MarioRun(),
      GameFloor(),
      score = buildScore(),
    ]);
    interval.onTick = () => add(GameSpikes());
  }

  TextComponent buildScore() {
    return TextComponent(
      position: Vector2(size.x / 2, size.y / 2 * 0.5),
      anchor: Anchor.center,
      textRenderer: TextPaint(
        style: const TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  void gameOver() {
    pauseEngine();
    overlays.add(AppConst.restartGameOverlayId);
  }

  void restartGame() {
    overlays.remove(AppConst.restartGameOverlayId);
    resumeEngine();
  }

  @override
  void update(double dt) {
    interval.update(dt);
    score.text = 'Score: ${marioRun.score}';
    super.update(dt);
  }

  @override
  void onTap() {
    marioRun.jump();
    super.onTap();
  }
}
