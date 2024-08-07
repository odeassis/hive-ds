import 'package:flutter/animation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';

import '../utils.dart';

class HiveLinearProgressIndicatorPainter extends CustomPainter {
  static const int _kIndeterminateLinearDuration = 1800;

  // The indeterminate progress animation consists of two lines, each with a leading (head)
  // and trailing (tail) endpoint, defined by the following four curves.
  static const Curve _line1Head = Interval(
    0.0,
    750.0 / _kIndeterminateLinearDuration,
    curve: Cubic(0.2, 0.0, 0.8, 1.0),
  );

  static const Curve _line1Tail = Interval(
    333.0 / _kIndeterminateLinearDuration,
    (333.0 + 750.0) / _kIndeterminateLinearDuration,
    curve: Cubic(0.4, 0.0, 1.0, 1.0),
  );

  static const Curve _line2Head = Interval(
    1000.0 / _kIndeterminateLinearDuration,
    (1000.0 + 567.0) / _kIndeterminateLinearDuration,
    curve: Cubic(0.0, 0.0, 0.65, 1.0),
  );

  static const Curve _line2Tail = Interval(
    1267.0 / _kIndeterminateLinearDuration,
    (1267.0 + 533.0) / _kIndeterminateLinearDuration,
    curve: Cubic(0.10, 0.0, 0.45, 1.0),
  );

  final Color backgroundColor;
  final Color valueColor;
  final double? value;
  final double animationValue;
  final BorderRadius containerRadius;
  final BorderRadius progressRadius;
  final TextDirection textDirection;

  const HiveLinearProgressIndicatorPainter({
    required this.backgroundColor,
    required this.valueColor,
    this.value,
    required this.animationValue,
    required this.containerRadius,
    required this.progressRadius,
    required this.textDirection,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;

    final containerRect = RRect.fromRectAndCorners(
      Offset.zero & size,
      topLeft: HiveSquircleRadius(cornerRadius: containerRadius.topLeft.x),
      topRight: HiveSquircleRadius(cornerRadius: containerRadius.topRight.x),
      bottomLeft:
          HiveSquircleRadius(cornerRadius: containerRadius.bottomLeft.x),
      bottomRight:
          HiveSquircleRadius(cornerRadius: containerRadius.bottomRight.x),
    );
    canvas.drawRRect(containerRect, paint);

    paint.color = valueColor;

    void drawBar(double x, double width) {
      if (width <= 0.0) return;

      final double left;
      switch (textDirection) {
        case TextDirection.rtl:
          left = size.width - width - x;
        case TextDirection.ltr:
          left = x;
      }

      final progressRect = RRect.fromRectAndCorners(
        Offset(left, 0.0) & Size(width, size.height),
        topLeft: HiveSquircleRadius(cornerRadius: progressRadius.topLeft.x),
        topRight: HiveSquircleRadius(cornerRadius: progressRadius.topRight.x),
        bottomLeft:
            HiveSquircleRadius(cornerRadius: progressRadius.bottomLeft.x),
        bottomRight:
            HiveSquircleRadius(cornerRadius: progressRadius.bottomRight.x),
      );

      // Clipping progressRect with containerRect.
      canvas.clipRRect(containerRect);

      canvas.drawRRect(progressRect, paint);
    }

    if (value != null) {
      drawBar(0.0, clampDouble(value!, 0.0, 1.0) * size.width);
    } else {
      final double x1 = size.width * _line1Tail.transform(animationValue);
      final double width1 =
          size.width * _line1Head.transform(animationValue) - x1;

      final double x2 = size.width * _line2Tail.transform(animationValue);
      final double width2 =
          size.width * _line2Head.transform(animationValue) - x2;

      drawBar(x1, width1);
      drawBar(x2, width2);
    }
  }

  @override
  bool shouldRepaint(HiveLinearProgressIndicatorPainter oldPainter) {
    return oldPainter.backgroundColor != backgroundColor ||
        oldPainter.valueColor != valueColor ||
        oldPainter.value != value ||
        oldPainter.animationValue != animationValue ||
        oldPainter.containerRadius != containerRadius ||
        oldPainter.progressRadius != progressRadius ||
        oldPainter.textDirection != textDirection;
  }
}
