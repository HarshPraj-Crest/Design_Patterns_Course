import 'dart:math';
import 'package:excercise_one/spaceship.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
 
enum SpaceShipEnum { milleniumFalcon, uNSCInfinity, uSSEnterprise, serenity }
 
class SpaceShipBuildContext {
  late SpaceShipEnum spaceShipType;
  late Point position;
  late Size size;
  late String displayName;
  late double speed;
}
 
class SpaceShipFactory {
  SpaceShipFactory._();
 
  static SpaceShip createSpaceShip(SpaceShipBuildContext buildContext) {
    SpaceShip result = NullSpaceShip();
 
    switch (buildContext.spaceShipType) {
      case SpaceShipEnum.milleniumFalcon:
        result = MilleniumFalcon(buildContext.position, buildContext.displayName);
        break;
      case SpaceShipEnum.uNSCInfinity:
        result = UNSCInfinity(buildContext.position, buildContext.displayName);
        break;
      case SpaceShipEnum.uSSEnterprise:
        result = USSEnterprise(buildContext.position, buildContext.displayName);
        break;
      case SpaceShipEnum.serenity:
        result = Serenity(buildContext.position, buildContext.displayName);
        break;
    }
 
    return result;
  }
 
  SpaceShip result = NullSpaceShip();
}
 
 
//I placed the NullSpaceShip here because I want the widget that creates the spaceship to only import the spaceship factory file
class NullSpaceShip extends SpaceShip {
  NullSpaceShip();
 
  @override
  getInfo() {
    debugPrint('NullShape');
  }
}