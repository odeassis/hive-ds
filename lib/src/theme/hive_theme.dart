import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'components/components.dart';
import 'tokens/tokens.dart';

class HiveTheme extends ThemeExtension<HiveTheme> with DiagnosticableTreeMixin {
  final HiveTokens tokens;
  final HiveAlertTheme alertTheme;
  final HiveAvatarTheme avatarTheme;
  final HiveBadgeTheme badgeTheme;
  final HiveBottomSheetTheme bottomSheetTheme;
  final HiveButtonTheme buttonTheme;
  final HiveCarouselTheme carouselTheme;

  HiveTheme({
    required this.tokens,
    HiveAlertTheme? alertTheme,
    HiveAvatarTheme? avatarTheme,
    HiveBadgeTheme? badgeTheme,
    HiveBottomSheetTheme? bottomSheetTheme,
    HiveButtonTheme? buttonTheme,
    HiveCarouselTheme? carouselTheme,
  })  : alertTheme = alertTheme ?? HiveAlertTheme(tokens: tokens),
        avatarTheme = avatarTheme ?? HiveAvatarTheme(tokens: tokens),
        badgeTheme = badgeTheme ?? HiveBadgeTheme(tokens: tokens),
        bottomSheetTheme =
            bottomSheetTheme ?? HiveBottomSheetTheme(tokens: tokens),
        buttonTheme = buttonTheme ?? HiveButtonTheme(tokens: tokens),
        carouselTheme = carouselTheme ?? HiveCarouselTheme(tokens: tokens);

  @override
  HiveTheme copyWith({
    HiveTokens? tokens,
    HiveAlertTheme? alertTheme,
    HiveAvatarTheme? avatarTheme,
    HiveBadgeTheme? badgeTheme,
    HiveBottomSheetTheme? bottomSheetTheme,
    HiveButtonTheme? buttonTheme,
    HiveCarouselTheme? carouselTheme,
  }) {
    return HiveTheme(
      tokens: tokens ?? this.tokens,
      alertTheme: alertTheme ?? this.alertTheme,
      avatarTheme: avatarTheme ?? this.avatarTheme,
      badgeTheme: badgeTheme ?? this.badgeTheme,
      bottomSheetTheme: bottomSheetTheme ?? this.bottomSheetTheme,
      buttonTheme: buttonTheme ?? this.buttonTheme,
      carouselTheme: carouselTheme ?? this.carouselTheme,
    );
  }

  @override
  HiveTheme lerp(
    ThemeExtension<HiveTheme>? other,
    double t,
  ) {
    if (other is! HiveTheme) return this;

    return HiveTheme(
      tokens: tokens.lerp(other.tokens, t),
      alertTheme: alertTheme.lerp(other.alertTheme, t),
      avatarTheme: avatarTheme.lerp(other.avatarTheme, t),
      badgeTheme: badgeTheme.lerp(other.badgeTheme, t),
      bottomSheetTheme: bottomSheetTheme.lerp(other.bottomSheetTheme, t),
      buttonTheme: buttonTheme.lerp(other.buttonTheme, t),
      carouselTheme: carouselTheme.lerp(other.carouselTheme, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty("type", "HiveTheme"));
    properties.add(DiagnosticsProperty<HiveTokens>('tokens', tokens));
    properties
        .add(DiagnosticsProperty<HiveAlertTheme>('alertTheme', alertTheme));
    properties
        .add(DiagnosticsProperty<HiveAvatarTheme>('avatarTheme', avatarTheme));
    properties
        .add(DiagnosticsProperty<HiveBadgeTheme>('badgeTheme', badgeTheme));
    properties.add(DiagnosticsProperty<HiveBottomSheetTheme>(
        'bottomSheetTheme', bottomSheetTheme));
    properties
        .add(DiagnosticsProperty<HiveButtonTheme>('buttonTheme', buttonTheme));
    properties.add(
        DiagnosticsProperty<HiveCarouselTheme>('carouselTheme', carouselTheme));
  }
}

extension HiveThemeExtension on BuildContext {
  HiveTheme? get hiveTheme => Theme.of(this).extension<HiveTheme>();
}
