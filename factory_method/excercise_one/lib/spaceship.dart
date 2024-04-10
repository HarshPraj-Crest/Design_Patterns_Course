import 'dart:math';
import 'package:flutter/cupertino.dart';
 
abstract class SpaceShip {
  Point _position = const Point(0, 0);
  Size _size = const Size(0, 0);
  String _displayName = "";
  double _speed = 0;
 
  getInfo() {
    debugPrint('displayName: $_displayName\n position: $_position\n size: $_size\n speed: $_speed');
  }
 
  getDisplayName() {
    return _displayName;
  }
}
 
class MilleniumFalcon extends SpaceShip {
  MilleniumFalcon(
    Point position,
    String displayName,
  ) {
    _size = const Size(20, 30);
    _speed = 10;
    _position = position;
    _displayName = displayName;
  }
}
 
class UNSCInfinity extends SpaceShip {
  UNSCInfinity(
    Point position,
    String displayName,
  ) {
    _size = const Size(10, 10);
    _speed = 30;
    _position = position;
    _displayName = displayName;
  }
}
 
class USSEnterprise extends SpaceShip {
  USSEnterprise(
    Point position,
    String displayName,
  ) {
    _size = const Size(50, 100);
    _speed = 5;
    _position = position;
    _displayName = displayName;
  }
}
 
class Serenity extends SpaceShip {
  Serenity(
    Point position,
    String displayName,
  ) {
    _size = const Size(15, 15);
    _speed = 20;
    _position = position;
    _displayName = displayName;
  }
}