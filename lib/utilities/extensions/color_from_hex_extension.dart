import 'dart:ui';

extension ColorFromHexExtension on String {
  Color toColor() {
    final RegExp hexColorPattern = RegExp(r'^#([0-9a-fA-F]{3}){1,2}$');

    if (!hexColorPattern.hasMatch(this)) {
      throw FormatException("$this is not a valid web hex color code");
    }

    String processableString = toUpperCase().replaceFirst('#', '');

    if (processableString.length == 3) {
      // Expand 3-digit hex to 6-digit hex
      // e.g., "F0C" becomes "FF00CC"
      final String r = processableString[0] + processableString[0];
      final String g = processableString[1] + processableString[1];
      final String b = processableString[2] + processableString[2];
      processableString = r + g + b;
    }

    // At this point, processableString should be 6 characters long.
    // The regex already ensures it's either 3 or 6 after the '#'.
    // If it was 3, it's now expanded to 6.

    try {
      // Add FF for full opacity, as Color() expects AARRGGBB
      final int colorValue = int.parse('FF$processableString', radix: 16);
      return Color(colorValue);
    } catch (e) {
      // Should not happen if regex is correct and length check is fine,        // but as a safeguard for int.parse
      throw FormatException("$this cannot be parsed into a color object ");
    }
  }
}
