import 'package:flutter/material.dart';

import 'constants.dart';

// ████████╗██╗░░██╗███████╗███╗░░░███╗███████╗
// ╚══██╔══╝██║░░██║██╔════╝████╗░████║██╔════╝
// ░░░██║░░░███████║█████╗░░██╔████╔██║█████╗░░
// ░░░██║░░░██╔══██║██╔══╝░░██║╚██╔╝██║██╔══╝░░
// ░░░██║░░░██║░░██║███████╗██║░╚═╝░██║███████╗
// ░░░╚═╝░░░╚═╝░░╚═╝╚══════╝╚═╝░░░░░╚═╝╚══════╝

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: waBgColor,
    fontFamily: "Acumin",
    primarySwatch: MaterialColor(const Color(0xFF010100).value, const {
      50: Color(0xFFf2f2f2),
      100: Color(0xFFd9d9d9),
      200: Color(0xFFbfbfbf),
      300: Color(0xFFa6a6a6),
      400: Color(0xFF8c8c8c),
      500: Color(0xFF737373),
      600: Color(0xFF595959),
      700: Color(0xFF404040),
      800: Color(0xFF262626),
      900: Color(0xFF0d0d0d),
    }),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
