import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static const Color textPrimary = Color(0xFF222222);
  static const Color textSecondary = Color(0xCC757575);
  static const Color textSecondaryBlacker = Color(0xCC575757);
  static const Color textHint = Color.fromARGB(204, 128, 128, 128);
  static const Color textRedirect = Colors.lightBlue;
  static const Color textWhite = Color(0xFFFFFFFF);
  static const Color borderColor = Color(0xCC222222);
  static const Color inputFill = Color(0xFFF4F5F7);
  static const Color primaryRed = Color(0xFFC8102E);
  static const Color primaryRedShade = Color(0xFFFCDEE3);
  static const Color primaryRedBorder = Color.fromARGB(255, 253, 179, 191);
  static const Color backgroundColor = Color(0xFFFFFFFF);
  static const Color backgroundColorCard = Color.fromARGB(255, 255, 255, 255);
  static const Color iconGrey = Colors.grey;
  static const Color errorColor = Color(0xFFFF0000);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff9e001f),
      surfaceTint: Color(0xffbf0229),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffc8102e),
      onPrimaryContainer: Color(0xffffdad8),
      secondary: Color(0xff5d5f5f),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffffffff),
      onSecondaryContainer: Color(0xff747676),
      tertiary: Color(0xff9e001f),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffc8102e),
      onTertiaryContainer: Color(0xffffdad8),
      error: Color(0xffbc0100),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffeb0000),
      onErrorContainer: Color(0xfffffbff),
      surface: Color(0xfffcf8f8),
      onSurface: Color(0xff1c1b1b),
      onSurfaceVariant: Color(0xff444748),
      outline: Color(0xff747878),
      outlineVariant: Color(0xffc4c7c8),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff313030),
      inversePrimary: Color(0xffffb3b1),
      primaryFixed: Color(0xffffdad8),
      onPrimaryFixed: Color(0xff410007),
      primaryFixedDim: Color(0xffffb3b1),
      onPrimaryFixedVariant: Color(0xff92001c),
      secondaryFixed: Color(0xffe2e2e2),
      onSecondaryFixed: Color(0xff1a1c1c),
      secondaryFixedDim: Color(0xffc6c6c7),
      onSecondaryFixedVariant: Color(0xff454747),
      tertiaryFixed: Color(0xffffdad8),
      onTertiaryFixed: Color(0xff410007),
      tertiaryFixedDim: Color(0xffffb3b1),
      onTertiaryFixedVariant: Color(0xff92001c),
      surfaceDim: Color(0xffddd9d9),
      surfaceBright: Color(0xfffcf8f8),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff6f3f2),
      surfaceContainer: Color(0xfff1edec),
      surfaceContainerHigh: Color(0xffebe7e7),
      surfaceContainerHighest: Color(0xffe5e2e1),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff730014),
      surfaceTint: Color(0xffbf0229),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffc8102e),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff343637),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff6c6d6d),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff730014),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffc8102e),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740100),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffdc0100),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffcf8f8),
      onSurface: Color(0xff111111),
      onSurfaceVariant: Color(0xff333738),
      outline: Color(0xff4f5354),
      outlineVariant: Color(0xff6a6e6e),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff313030),
      inversePrimary: Color(0xffffb3b1),
      primaryFixed: Color(0xffd51e35),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xffad0024),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff6c6d6d),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff535555),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xffd51e35),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xffad0024),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc9c6c5),
      surfaceBright: Color(0xfffcf8f8),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff6f3f2),
      surfaceContainer: Color(0xffebe7e7),
      surfaceContainerHigh: Color(0xffdfdcdb),
      surfaceContainerHighest: Color(0xffd4d1d0),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff60000f),
      surfaceTint: Color(0xffbf0229),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff97001e),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff2a2c2d),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff48494a),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff60000f),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff97001e),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600000),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff980100),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffcf8f8),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff292d2d),
      outlineVariant: Color(0xff464a4a),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff313030),
      inversePrimary: Color(0xffffb3b1),
      primaryFixed: Color(0xff97001e),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff6c0012),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff48494a),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff313333),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff97001e),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff6c0012),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffbbb8b7),
      surfaceBright: Color(0xfffcf8f8),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff4f0ef),
      surfaceContainer: Color(0xffe5e2e1),
      surfaceContainerHigh: Color(0xffd7d4d3),
      surfaceContainerHighest: Color(0xffc9c6c5),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffb3b1),
      surfaceTint: Color(0xffffb3b1),
      onPrimary: Color(0xff680011),
      primaryContainer: Color(0xffc8102e),
      onPrimaryContainer: Color(0xffffdad8),
      secondary: Color(0xffffffff),
      onSecondary: Color(0xff2f3131),
      secondaryContainer: Color(0xffe2e2e2),
      onSecondaryContainer: Color(0xff636565),
      tertiary: Color(0xffffb3b1),
      onTertiary: Color(0xff680011),
      tertiaryContainer: Color(0xffc8102e),
      onTertiaryContainer: Color(0xffffdad8),
      error: Color(0xffffb4a8),
      onError: Color(0xff690100),
      errorContainer: Color(0xffff5540),
      onErrorContainer: Color(0xff360000),
      surface: Color(0xff141313),
      onSurface: Color(0xffe5e2e1),
      onSurfaceVariant: Color(0xffc4c7c8),
      outline: Color(0xff8e9192),
      outlineVariant: Color(0xff444748),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe5e2e1),
      inversePrimary: Color(0xffbf0229),
      primaryFixed: Color(0xffffdad8),
      onPrimaryFixed: Color(0xff410007),
      primaryFixedDim: Color(0xffffb3b1),
      onPrimaryFixedVariant: Color(0xff92001c),
      secondaryFixed: Color(0xffe2e2e2),
      onSecondaryFixed: Color(0xff1a1c1c),
      secondaryFixedDim: Color(0xffc6c6c7),
      onSecondaryFixedVariant: Color(0xff454747),
      tertiaryFixed: Color(0xffffdad8),
      onTertiaryFixed: Color(0xff410007),
      tertiaryFixedDim: Color(0xffffb3b1),
      onTertiaryFixedVariant: Color(0xff92001c),
      surfaceDim: Color(0xff141313),
      surfaceBright: Color(0xff3a3939),
      surfaceContainerLowest: Color(0xff0e0e0e),
      surfaceContainerLow: Color(0xff1c1b1b),
      surfaceContainer: Color(0xff201f1f),
      surfaceContainerHigh: Color(0xff2a2a2a),
      surfaceContainerHighest: Color(0xff353434),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffd2d0),
      surfaceTint: Color(0xffffb3b1),
      onPrimary: Color(0xff54000c),
      primaryContainer: Color(0xffff535b),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffffffff),
      onSecondary: Color(0xff2f3131),
      secondaryContainer: Color(0xffe2e2e2),
      onSecondaryContainer: Color(0xff464849),
      tertiary: Color(0xffffd2d0),
      onTertiary: Color(0xff54000c),
      tertiaryContainer: Color(0xffff535b),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2cb),
      onError: Color(0xff540000),
      errorContainer: Color(0xffff5540),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff141313),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffdadddd),
      outline: Color(0xffafb2b3),
      outlineVariant: Color(0xff8d9191),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe5e2e1),
      inversePrimary: Color(0xff95001d),
      primaryFixed: Color(0xffffdad8),
      onPrimaryFixed: Color(0xff2d0004),
      primaryFixedDim: Color(0xffffb3b1),
      onPrimaryFixedVariant: Color(0xff730014),
      secondaryFixed: Color(0xffe2e2e2),
      onSecondaryFixed: Color(0xff0f1112),
      secondaryFixedDim: Color(0xffc6c6c7),
      onSecondaryFixedVariant: Color(0xff343637),
      tertiaryFixed: Color(0xffffdad8),
      onTertiaryFixed: Color(0xff2d0004),
      tertiaryFixedDim: Color(0xffffb3b1),
      onTertiaryFixedVariant: Color(0xff730014),
      surfaceDim: Color(0xff141313),
      surfaceBright: Color(0xff454444),
      surfaceContainerLowest: Color(0xff070707),
      surfaceContainerLow: Color(0xff1e1d1d),
      surfaceContainer: Color(0xff282828),
      surfaceContainerHigh: Color(0xff333232),
      surfaceContainerHighest: Color(0xff3e3d3d),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffecea),
      surfaceTint: Color(0xffffb3b1),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffffadab),
      onPrimaryContainer: Color(0xff220002),
      secondary: Color(0xffffffff),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffe2e2e2),
      onSecondaryContainer: Color(0xff282a2b),
      tertiary: Color(0xffffecea),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffffadab),
      onTertiaryContainer: Color(0xff220002),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea1),
      onErrorContainer: Color(0xff220000),
      surface: Color(0xff141313),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xffeef0f1),
      outlineVariant: Color(0xffc0c3c4),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe5e2e1),
      inversePrimary: Color(0xff95001d),
      primaryFixed: Color(0xffffdad8),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffffb3b1),
      onPrimaryFixedVariant: Color(0xff2d0004),
      secondaryFixed: Color(0xffe2e2e2),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffc6c6c7),
      onSecondaryFixedVariant: Color(0xff0f1112),
      tertiaryFixed: Color(0xffffdad8),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffffb3b1),
      onTertiaryFixedVariant: Color(0xff2d0004),
      surfaceDim: Color(0xff141313),
      surfaceBright: Color(0xff51504f),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff201f1f),
      surfaceContainer: Color(0xff313030),
      surfaceContainerHigh: Color(0xff3c3b3b),
      surfaceContainerHighest: Color(0xff474646),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
    useMaterial3: true,
    brightness: colorScheme.brightness,
    colorScheme: colorScheme,
    textTheme: textTheme.apply(
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
    ),
    scaffoldBackgroundColor: colorScheme.background,
    canvasColor: colorScheme.surface,
  );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
