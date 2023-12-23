import 'package:epb_app/src/base/app_theme.dart';
import 'package:epb_app/src/widgets/app_layout_builder.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GradientCircularProgressIndicator extends StatefulWidget {
  const GradientCircularProgressIndicator({
    super.key,
    this.strokeWidth = 4.0,
    required this.radius,
    required this.gradient,
    required this.value,
    required this.trackColor,
    required this.deviceType,
  });

  final double strokeWidth;
  final double radius;
  final Gradient gradient;
  final double value;
  final Color trackColor;
  final DeviceType deviceType;

  @override
  State<GradientCircularProgressIndicator> createState() =>
      _GradientCircularProgressIndicatorState();
}

class _GradientCircularProgressIndicatorState
    extends State<GradientCircularProgressIndicator> {
  late DeviceType _deviceType;

  void _inti([bool rebuild = false]) {
    _deviceType = widget.deviceType;
    if (rebuild) setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _inti();
  }

  @override
  void didUpdateWidget(covariant GradientCircularProgressIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    _inti(true);
  }

  @override
  Widget build(BuildContext context) {
    TextStyle titleStyle;
    TextStyle progressStyle;

    if (_deviceType == DeviceType.mobile) {
      titleStyle = GoogleFonts.poppins(
        fontSize: 6,
        fontWeight: FontWeight.bold,
        color: AppColors.blueColor,
      );
      progressStyle = GoogleFonts.poppins(
        color: AppColors.greenColor,
        fontSize: 10,
        fontWeight: FontWeight.bold,
      );
    } else if (_deviceType == DeviceType.tab) {
      titleStyle = GoogleFonts.poppins(
        fontWeight: FontWeight.bold,
        color: AppColors.blueColor,
      );
      progressStyle = GoogleFonts.poppins(
        color: AppColors.greenColor,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      );
    } else {
      titleStyle = GoogleFonts.poppins(
        fontWeight: FontWeight.bold,
        color: AppColors.blueColor,
        fontSize: 20,
      );

      progressStyle = GoogleFonts.poppins(
        color: AppColors.greenColor,
        fontSize: 35,
        fontWeight: FontWeight.bold,
      );
    }
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: widget.radius * 2.0,
          height: widget.radius * 2.0,
          child: CircularProgressIndicator(
            value: 1.0,
            color: widget.trackColor,
            strokeWidth: widget.strokeWidth,
            backgroundColor: widget.trackColor,
          ),
        ),
        CustomPaint(
          painter: _GradientCircularProgressPainter(
            strokeWidth: widget.strokeWidth,
            radius: widget.radius,
            gradient: widget.gradient,
            value: widget.value,
          ),
          size: Size.square(widget.radius * 2.0),
        ),
        Positioned(
          bottom: _deviceType.isMobile
              ? 16
              : _deviceType.isTab
                  ? 20
                  : 25,
          child: Text(
            '${(widget.value * 100).toInt()}%',
            style: progressStyle,
          ),
        ),
        Positioned(
          top: _deviceType.isMobile
              ? 24
              : _deviceType.isTab
                  ? 41
                  : 50,
          child: Text(
            'Next Rank',
            style: titleStyle,
          ),
        )
      ],
    );
  }
}

class _GradientCircularProgressPainter extends CustomPainter {
  final double strokeWidth;
  final double radius;
  final Gradient gradient;
  final double value;

  _GradientCircularProgressPainter({
    required this.strokeWidth,
    required this.radius,
    required this.gradient,
    required this.value,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final width = strokeWidth;
    final rect = Offset.zero & size;

    final paint = Paint()
      ..strokeWidth = width
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..shader = gradient.createShader(rect);

    final arcAngle = 2 * value * 3.14;

    canvas.drawArc(
      Rect.fromCircle(center: size.center(Offset.zero), radius: radius),
      -0.5 * 3.14,
      arcAngle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
