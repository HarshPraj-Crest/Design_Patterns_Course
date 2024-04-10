import 'package:flutter/material.dart';
import 'package:game_of_life/game_design.dart';
import 'package:game_of_life/game_logic.dart';

class GameOfLife extends StatefulWidget {
  const GameOfLife({super.key});

  @override
  GameOfLifeState createState() => GameOfLifeState();
}

class GameOfLifeState extends State<GameOfLife> {
  late final GameLogic _gameLogic;

  @override
  void initState() {
    super.initState();
    _gameLogic = GameLogic(
        rows: 30,
        columns: 30,
        setState: () {
          setState(() {});
        });
  }

  @override
  Widget build(BuildContext context) {
    return GameUI(gameLogic: _gameLogic);
  }
}
