import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff8f4951),
      surfaceTint: Color(0xff8f4951),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffffdadb),
      onPrimaryContainer: Color(0xff72333a),
      secondary: Color(0xff765658),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffffdadb),
      onSecondaryContainer: Color(0xff5c3f41),
      tertiary: Color(0xff775930),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffffddb5),
      onTertiaryContainer: Color(0xff5d421b),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfffff8f7),
      onSurface: Color(0xff22191a),
      onSurfaceVariant: Color(0xff524344),
      outline: Color(0xff857374),
      outlineVariant: Color(0xffd7c1c2),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff382e2e),
      inversePrimary: Color(0xffffb2b8),
      primaryFixed: Color(0xffffdadb),
      onPrimaryFixed: Color(0xff3b0711),
      primaryFixedDim: Color(0xffffb2b8),
      onPrimaryFixedVariant: Color(0xff72333a),
      secondaryFixed: Color(0xffffdadb),
      onSecondaryFixed: Color(0xff2c1517),
      secondaryFixedDim: Color(0xffe5bdbf),
      onSecondaryFixedVariant: Color(0xff5c3f41),
      tertiaryFixed: Color(0xffffddb5),
      onTertiaryFixed: Color(0xff2a1800),
      tertiaryFixedDim: Color(0xffe8c08e),
      onTertiaryFixedVariant: Color(0xff5d421b),
      surfaceDim: Color(0xffe7d6d6),
      surfaceBright: Color(0xfffff8f7),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff0f0),
      surfaceContainer: Color(0xfffceaea),
      surfaceContainerHigh: Color(0xfff6e4e4),
      surfaceContainerHighest: Color(0xfff0dedf),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff5e222b),
      surfaceTint: Color(0xff8f4951),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffa0585f),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff4a2f31),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff866567),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff4a310b),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff87673d),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f7),
      onSurface: Color(0xff170f10),
      onSurfaceVariant: Color(0xff413333),
      outline: Color(0xff5e4f4f),
      outlineVariant: Color(0xff7a696a),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff382e2e),
      inversePrimary: Color(0xffffb2b8),
      primaryFixed: Color(0xffa0585f),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff834048),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff866567),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff6c4d4f),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff87673d),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff6c4f27),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffd3c3c3),
      surfaceBright: Color(0xfffff8f7),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff0f0),
      surfaceContainer: Color(0xfff6e4e4),
      surfaceContainerHigh: Color(0xffead9d9),
      surfaceContainerHighest: Color(0xffdfcece),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff511921),
      surfaceTint: Color(0xff8f4951),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff75353d),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff3f2527),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff5f4144),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff3f2703),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff60441d),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f7),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff36292a),
      outlineVariant: Color(0xff554546),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff382e2e),
      inversePrimary: Color(0xffffb2b8),
      primaryFixed: Color(0xff75353d),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff591f27),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff5f4144),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff462b2e),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff60441d),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff462e08),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc5b5b5),
      surfaceBright: Color(0xfffff8f7),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffffeded),
      surfaceContainer: Color(0xfff0dedf),
      surfaceContainerHigh: Color(0xffe2d0d1),
      surfaceContainerHighest: Color(0xffd3c3c3),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffb2b8),
      surfaceTint: Color(0xffffb2b8),
      onPrimary: Color(0xff561d25),
      primaryContainer: Color(0xff72333a),
      onPrimaryContainer: Color(0xffffdadb),
      secondary: Color(0xffe5bdbf),
      onSecondary: Color(0xff44292b),
      secondaryContainer: Color(0xff5c3f41),
      onSecondaryContainer: Color(0xffffdadb),
      tertiary: Color(0xffe8c08e),
      onTertiary: Color(0xff442b06),
      tertiaryContainer: Color(0xff5d421b),
      onTertiaryContainer: Color(0xffffddb5),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff1a1112),
      onSurface: Color(0xfff0dedf),
      onSurfaceVariant: Color(0xffd7c1c2),
      outline: Color(0xff9f8c8d),
      outlineVariant: Color(0xff524344),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfff0dedf),
      inversePrimary: Color(0xff8f4951),
      primaryFixed: Color(0xffffdadb),
      onPrimaryFixed: Color(0xff3b0711),
      primaryFixedDim: Color(0xffffb2b8),
      onPrimaryFixedVariant: Color(0xff72333a),
      secondaryFixed: Color(0xffffdadb),
      onSecondaryFixed: Color(0xff2c1517),
      secondaryFixedDim: Color(0xffe5bdbf),
      onSecondaryFixedVariant: Color(0xff5c3f41),
      tertiaryFixed: Color(0xffffddb5),
      onTertiaryFixed: Color(0xff2a1800),
      tertiaryFixedDim: Color(0xffe8c08e),
      onTertiaryFixedVariant: Color(0xff5d421b),
      surfaceDim: Color(0xff1a1112),
      surfaceBright: Color(0xff413737),
      surfaceContainerLowest: Color(0xff140c0d),
      surfaceContainerLow: Color(0xff22191a),
      surfaceContainer: Color(0xff271d1e),
      surfaceContainerHigh: Color(0xff312828),
      surfaceContainerHighest: Color(0xff3d3233),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffd1d4),
      surfaceTint: Color(0xffffb2b8),
      onPrimary: Color(0xff48121b),
      primaryContainer: Color(0xffca7a82),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfffdd2d4),
      onSecondary: Color(0xff371f21),
      secondaryContainer: Color(0xffac888a),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffffd5a2),
      onTertiary: Color(0xff372100),
      tertiaryContainer: Color(0xffae8b5d),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff1a1112),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffedd7d8),
      outline: Color(0xffc2adae),
      outlineVariant: Color(0xff9f8c8c),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfff0dedf),
      inversePrimary: Color(0xff74343c),
      primaryFixed: Color(0xffffdadb),
      onPrimaryFixed: Color(0xff2c0008),
      primaryFixedDim: Color(0xffffb2b8),
      onPrimaryFixedVariant: Color(0xff5e222b),
      secondaryFixed: Color(0xffffdadb),
      onSecondaryFixed: Color(0xff200b0d),
      secondaryFixedDim: Color(0xffe5bdbf),
      onSecondaryFixedVariant: Color(0xff4a2f31),
      tertiaryFixed: Color(0xffffddb5),
      onTertiaryFixed: Color(0xff1c0e00),
      tertiaryFixedDim: Color(0xffe8c08e),
      onTertiaryFixedVariant: Color(0xff4a310b),
      surfaceDim: Color(0xff1a1112),
      surfaceBright: Color(0xff4d4242),
      surfaceContainerLowest: Color(0xff0d0606),
      surfaceContainerLow: Color(0xff241b1c),
      surfaceContainer: Color(0xff2f2526),
      surfaceContainerHigh: Color(0xff3a3031),
      surfaceContainerHighest: Color(0xff463b3b),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffebec),
      surfaceTint: Color(0xffffb2b8),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffffadb3),
      onPrimaryContainer: Color(0xff210005),
      secondary: Color(0xffffebec),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffe1b9bb),
      onSecondaryContainer: Color(0xff190608),
      tertiary: Color(0xffffeddb),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffe4bc8a),
      onTertiaryContainer: Color(0xff140900),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff1a1112),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xffffebec),
      outlineVariant: Color(0xffd3bebe),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfff0dedf),
      inversePrimary: Color(0xff74343c),
      primaryFixed: Color(0xffffdadb),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffffb2b8),
      onPrimaryFixedVariant: Color(0xff2c0008),
      secondaryFixed: Color(0xffffdadb),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffe5bdbf),
      onSecondaryFixedVariant: Color(0xff200b0d),
      tertiaryFixed: Color(0xffffddb5),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffe8c08e),
      onTertiaryFixedVariant: Color(0xff1c0e00),
      surfaceDim: Color(0xff1a1112),
      surfaceBright: Color(0xff594d4e),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff271d1e),
      surfaceContainer: Color(0xff382e2e),
      surfaceContainerHigh: Color(0xff443939),
      surfaceContainerHighest: Color(0xff4f4444),
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


  List<ExtendedColor> get extendedColors => [
  ];
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
