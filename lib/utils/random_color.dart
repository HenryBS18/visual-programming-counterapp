import 'dart:math';

String generateRandomHexColor() {
  Random random = Random();
  int color = random.nextInt(0xFFFFFF); // Generates a random integer up to 0xFFFFFF (16,777,215)
  return color.toRadixString(16).padLeft(6, '0'); // Convert to hex and pad with zeros if needed
}
