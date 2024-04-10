import 'package:flutter/material.dart';

abstract class Renderer {
  Widget render();
}

class ImageRenderer extends Renderer {
  @override
  Widget render() {
    return Image.asset('images/flutter.jpg');
  }
}

class ButtonRenderer extends Renderer {
  @override
  Widget render() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
      onPressed: () {
        debugPrint('Elevated Button Pressed');
      },
      child: const Text(
        'Elevated Button',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

class WidgetRenderer extends Renderer {
  @override
  Widget render() {
    return GestureDetector(
      onTap: () {
        debugPrint('Tapped The Row');
      },
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(Icons.add_shopping_cart),
          Text('Row Widget'),
          Icon(Icons.balance),
        ],
      ),
    );
  }
}
