import 'package:flutter/material.dart';
import 'dart:math';

class RadialSliderScreen extends StatefulWidget {

  final dynamic cardData;
  const RadialSliderScreen({super.key, required this.cardData});

  @override
  _RadialSliderScreenState createState() => _RadialSliderScreenState();
}

class _RadialSliderScreenState extends State<RadialSliderScreen> {
  double _creditAmount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RadialSlider(
          cardData : widget.cardData,
          creditAmount: _creditAmount,
          onValueChanged: (value) {
            setState(() {
              _creditAmount = value;
            });
          },
        ),
      ),
    );
  }
}

class RadialSlider extends StatefulWidget {
  final double creditAmount;
  final ValueChanged<double> onValueChanged;
  final dynamic cardData;

  RadialSlider({required this.creditAmount, required this.onValueChanged, required  this.cardData});

  @override
  _RadialSliderState createState() => _RadialSliderState();
}

class _RadialSliderState extends State<RadialSlider> {
  double _currentAngle = 0;
  final double _minAmount = 500;
  final double _maxAmount = 487891;

  @override
  void initState() {
    super.initState();
    _currentAngle = _amountToAngle(widget.creditAmount);
    // _minAmount = widget.cardData['min_range']; // Get the min_range from cardData
    // _maxAmount = widget.cardData['max_range']; // Get the max_range from cardData
    // print(_maxAmount);
    // print(_minAmount);
  }

  double _angleToAmount(double angle) {
    return (angle / (2 * pi)) * _maxAmount;
  }

  double _amountToAngle(double amount) {
    return (amount / _maxAmount) * (2 * pi);
  }

  void _updatePosition(Offset position, Size size) {
    final double dx = position.dx - size.width / 2;
    final double dy = position.dy - size.height / 2;
    final double angle = atan2(dy, dx) + pi / 2;

    setState(() {
      _currentAngle = angle;
      double newAmount = _angleToAmount(angle);
      if (newAmount < _minAmount) newAmount = _minAmount;
      if (newAmount > _maxAmount) newAmount = _maxAmount;
      widget.onValueChanged(newAmount);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        _updatePosition(details.localPosition, Size(200, 200));
      },
      child: CustomPaint(
        size: Size(300, 300),
        painter: RadialSliderPainter(_currentAngle, widget.creditAmount),
      ),
    );
  }
}

class RadialSliderPainter extends CustomPainter {
  final double angle;
  final double creditAmount;

  RadialSliderPainter(this.angle, this.creditAmount);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20.0;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 10;

    // Draw the radial background
    canvas.drawCircle(center, radius, paint..color = Colors.grey[300]!);

    // Draw the active radial bar
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        angle, false, paint..color = Colors.blue);

    // Draw the slider handle
    final handleX = center.dx + radius * cos(angle - pi / 2);
    final handleY = center.dy + radius * sin(angle - pi / 2);
    canvas.drawCircle(
        Offset(handleX, handleY), 10.0, Paint()..color = Colors.red);

    // Draw the text: 'Credit Amount' at the top
    TextPainter creditAmountText = TextPainter(
      text: TextSpan(
        text: 'Credit Amount',
        style: TextStyle(
          color: Colors.black,
          fontSize: 16.0,
          fontWeight: FontWeight.w400,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    creditAmountText.layout();
    creditAmountText.paint(
        canvas,
        Offset(center.dx - creditAmountText.width / 2,
            center.dy - creditAmountText.height - 20)); // Above the amount

    // Draw the credit amount
    TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: '₹ ${creditAmount.toInt()}',
        style: TextStyle(
          color: Colors.black,
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(
        canvas,
        Offset(center.dx - textPainter.width / 2,
            center.dy - textPainter.height / 2));

    // Draw percentage value below the amount
    double percentage = (creditAmount / 487891) * 100; // Example calculation
    TextPainter percentageText = TextPainter(
      text: TextSpan(
        text: '${percentage.toStringAsFixed(1)}%', // Display percentage
        style: TextStyle(
          color: Colors.black,
          fontSize: 16.0,
          fontWeight: FontWeight.w400,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    percentageText.layout();
    percentageText.paint(
        canvas,
        Offset(center.dx - percentageText.width / 2,
            center.dy + textPainter.height)); // Below the amount
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
