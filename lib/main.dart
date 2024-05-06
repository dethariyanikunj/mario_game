import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:mario_game/const/app_const.dart';
import 'package:mario_game/game/mario_game.dart';
import 'package:mario_game/screens/restart_game.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.setLandscape();
  Flame.device.fullScreen();
  final marioGame = MarioGame();
  runApp(
    GameWidget(
      game: marioGame,
      overlayBuilderMap: {
        AppConst.restartGameOverlayId: (BuildContext context, MarioGame game) {
          return RestartGame(
            game: game,
          );
        }
      },
    ),
  );
}
