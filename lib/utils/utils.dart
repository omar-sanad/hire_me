import 'dart:math';
import 'dart:ui';

class Utils {

  static List<Color> colors = [
    Color(0xFFFF8A80),
    Color(0xFF72D9B4),
    Color(0xFF78C3DA),
    Color(0xFFA399C9)
  ];

  static Color getRandomColor( int index) {
    if (index < colors.length) {
      return colors[index];
    }
    return colors[index % colors.length];
  }
}
