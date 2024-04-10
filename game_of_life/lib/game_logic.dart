import 'dart:async';
import 'dart:math';

const int _alive = 1;
const int _dead = 0;

class GameLogic {
  late List<List<int>> _grid;
  late int _rows;
  late int _columns;
  late int _generation;
  late Random _random;
  late Timer? _timer;
  late Function _setState;
  bool isRunning = false;

  GameLogic({
    required int rows,
    required int columns,
    required Function setState,
  }) {
    _rows = rows;
    _columns = columns;
    _generation = 0;
    _random = Random();
    _grid = List.generate(_rows, (_) => List.filled(_columns, _dead));
    _initGrid();
    _setState = setState;
  }

  int get generation => _generation;

  int get rows => _rows;

  int get columns => _columns;

  void _initGrid() {
    for (int i = 0; i < _rows; i++) {
      for (int j = 0; j < _columns; j++) {
        _grid[i][j] = _random.nextBool() ? _alive : _dead;
      }
    }
  }

  int _countAliveNeighbors(int row, int column) {
    int count = 0;
    for (int i = -1; i <= 1; i++) {
      for (int j = -1; j <= 1; j++) {
        if (i == 0 && j == 0) continue;
        int r = row + i;
        int c = column + j;
        if (r >= 0 &&
            r < _rows &&
            c >= 0 &&
            c < _columns &&
            _grid[r][c] == _alive) {
          count++;
        }
      }
    }
    return count;
  }

  void _tick(Timer timer) {
    _generation++;
    List<List<int>> nextGrid = List.generate(
        _rows, (_) => List.filled(_columns, 0));
    for (int i = 0; i < _rows; i++) {
      for (int j = 0; j < _columns; j++) {
        int neighbors = _countAliveNeighbors(i, j);
        if (_grid[i][j] == _alive) {
          if (neighbors == 2 || neighbors == 3) {
            nextGrid[i][j] = _alive;
          } else {
            nextGrid[i][j] = _dead;
          }
        } else {
          if (neighbors == 3) {
            nextGrid[i][j] = _alive;
          } else {
            nextGrid[i][j] = _dead;
          }
        }
      }
    }
    _grid = nextGrid;
    if (!isRunning) {
      timer.cancel();
    }
    _setState(); // Update UI
  }

  void _toggleGame() {
    if (isRunning) {
      _timer?.cancel();
      _timer = null;
    } else {
      _timer = Timer.periodic(const Duration(seconds: 1), _tick);
    }
    isRunning = !isRunning;
    _setState(); // Update UI
  }

  void toggleCell(int row, int column) {
    _grid[row][column] = _grid[row][column] == _alive ? _dead : _alive;
    _setState(); // Update UI
  }

  bool isCellAlive(int row, int column) {
    return _grid[row][column] == _alive;
  }

  void toggleGame() {
    _toggleGame();
  }
}
