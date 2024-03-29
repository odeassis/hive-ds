import 'package:bacon/src/theme/components/avatar/avatar_size_properties.dart';
import 'package:bacon/src/theme/tokens/tokens.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class BaconAvatarSizes extends ThemeExtension<BaconAvatarSizes>
    with DiagnosticableTreeMixin {
  final BaconTokens tokens;

  /// Extra large avatar size
  final BaconAvatarSizeProperties xl;

  /// Large avatar size
  final BaconAvatarSizeProperties lg;

  /// Medium avatar size
  final BaconAvatarSizeProperties md;

  /// Small avatar size
  final BaconAvatarSizeProperties sm;

  /// Extra small avatar size
  final BaconAvatarSizeProperties xs;

  BaconAvatarSizes({
    required this.tokens,
    BaconAvatarSizeProperties? xl,
    BaconAvatarSizeProperties? lg,
    BaconAvatarSizeProperties? md,
    BaconAvatarSizeProperties? sm,
    BaconAvatarSizeProperties? xs,
  })  : xl = xl ??
            BaconAvatarSizeProperties(
              avatarSize: tokens.scale.component.x3l,
              borderRadius: tokens.shape.radii.xl,
              badgeSize: tokens.scale.component.sm,
              badgeMargin: tokens.scale.component.x3s,
              textStyle: tokens.typography.label.lg,
            ),
        lg = lg ??
            BaconAvatarSizeProperties(
              avatarSize: tokens.scale.component.x2l,
              borderRadius: tokens.shape.radii.xl,
              badgeSize: tokens.scale.component.sm,
              badgeMargin: tokens.scale.component.x3s,
              textStyle: tokens.typography.label.md,
            ),
        md = md ??
            BaconAvatarSizeProperties(
              avatarSize: tokens.scale.component.xl,
              borderRadius: tokens.shape.radii.xl,
              badgeSize: tokens.scale.component.xs,
              badgeMargin: tokens.scale.component.x3s,
              textStyle: tokens.typography.label.xs,
            ),
        sm = sm ??
            BaconAvatarSizeProperties(
              avatarSize: tokens.scale.component.lg,
              borderRadius: tokens.shape.radii.xl,
              badgeSize: tokens.scale.component.xs,
              badgeMargin: tokens.scale.component.x3s,
              textStyle: tokens.typography.label.xs,
            ),
        xs = xs ??
            BaconAvatarSizeProperties(
              avatarSize: tokens.scale.component.md,
              borderRadius: tokens.shape.radii.xl,
              badgeSize: tokens.scale.component.x2s,
              badgeMargin: tokens.scale.component.x3s,
              textStyle: tokens.typography.label.xs,
            );

  @override
  BaconAvatarSizes copyWith({
    BaconTokens? tokens,
    BaconAvatarSizeProperties? xl,
    BaconAvatarSizeProperties? lg,
    BaconAvatarSizeProperties? md,
    BaconAvatarSizeProperties? sm,
    BaconAvatarSizeProperties? xs,
  }) {
    return BaconAvatarSizes(
      tokens: tokens ?? this.tokens,
      xl: xl ?? this.xl,
      lg: lg ?? this.lg,
      md: md ?? this.md,
      sm: sm ?? this.sm,
      xs: xs ?? this.xs,
    );
  }

  @override
  BaconAvatarSizes lerp(ThemeExtension<BaconAvatarSizes>? other, double t) {
    if (other is! BaconAvatarSizes) return this;
    return BaconAvatarSizes(
      tokens: tokens.lerp(other.tokens, t),
      xl: xl.lerp(other.xl, t),
      lg: lg.lerp(other.lg, t),
      md: md.lerp(other.md, t),
      sm: sm.lerp(other.sm, t),
      xs: xs.lerp(other.xs, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty("type", "BaconAvatarSizes"));
    properties.add(DiagnosticsProperty<BaconTokens>("tokens", tokens));
    properties.add(DiagnosticsProperty<BaconAvatarSizeProperties>("xl", xl));
    properties.add(DiagnosticsProperty<BaconAvatarSizeProperties>("lg", lg));
    properties.add(DiagnosticsProperty<BaconAvatarSizeProperties>("md", md));
    properties.add(DiagnosticsProperty<BaconAvatarSizeProperties>("sm", sm));
    properties.add(DiagnosticsProperty<BaconAvatarSizeProperties>("xs", xs));
  }
}
