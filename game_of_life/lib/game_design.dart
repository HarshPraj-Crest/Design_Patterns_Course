import 'package:flutter/material.dart';
import 'package:game_of_life/game_logic.dart';

class GameUI extends StatefulWidget {
  const GameUI({super.key, required this.gameLogic});

  final GameLogic gameLogic;

  @override
  GameUIState createState() => GameUIState();
}

class GameUIState extends State<GameUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Generation: ${widget.gameLogic.generation}'),
      ),
      body: GridView.count(
        crossAxisCount: widget.gameLogic.columns,
        children: List.generate(
          widget.gameLogic.rows * widget.gameLogic.columns,
          (index) {
            int row = index ~/ widget.gameLogic.columns;
            int column = index % widget.gameLogic.columns;
            return GestureDetector(
              onTap: () {
                setState(() {
                  widget.gameLogic.toggleCell(row, column);
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: widget.gameLogic.isCellAlive(row, column)
                      ? Colors.black
                      : Colors.white,
                  border: Border.all(color: Colors.grey),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            widget.gameLogic.toggleGame();
          });
        },
        child:
            Icon(widget.gameLogic.isRunning ? Icons.pause : Icons.play_arrow),
      ),
    );
  }
}
