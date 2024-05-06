import 'package:flutter/material.dart';
import 'package:mario_game/const/app_const.dart';
import 'package:mario_game/game/mario_game.dart';

class RestartGame extends StatelessWidget {
  final MarioGame game;
  static const id = AppConst.restartGameOverlayId;

  const RestartGame({
    super.key,
    required this.game,
  });

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.black54,
      child: Center(
        child: GestureDetector(
          onTap: () {
            game.restartGame();
          },
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.refresh,
                color: Colors.white,
              ),
              Text('Retry'),
            ],
          ),
        ),
      ),
    );
  }
}
