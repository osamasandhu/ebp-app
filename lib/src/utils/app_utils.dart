import 'package:flutter/material.dart';

extension IntSpacing on int {
  Widget get width => SizedBox(width: toDouble());

  Widget get height => SizedBox(height: toDouble());

  Widget get square => SizedBox(width: toDouble(), height: toDouble());

  Widget get sliverWidth => width.wrapSliver;

  Widget get sliverHeight => height.wrapSliver;

  Widget get sliverSquare => square.wrapSliver;
}

extension DoubleSpacing on double {
  Widget get width => SizedBox(width: this);

  Widget get height => SizedBox(height: this);

  Widget get square => SizedBox(width: this, height: this);

  Widget get sliverWidth => width.wrapSliver;

  Widget get sliverHeight => height.wrapSliver;

  Widget get sliverSquare => square.wrapSliver;
}

extension SliverExtention on Widget {
  Widget get wrapSliver => SliverToBoxAdapter(child: this);
}
