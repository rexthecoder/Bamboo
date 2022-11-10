import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';

/// typeDef with breakpoint values as parameters
typedef BreakpointCallback = void Function(
  double mobile,
  double tablet,
  double desktop,
  double laptop,
);

/// typeDef where you can use dot notion to acces the value
/// example Breakpoint.mobile

class BreakPointService {
  /// A private constructor. Allows us to create instances of
  /// [BambooObserver] only from within the [BambooObserver] class itself.
  BreakPointService();

  double mobile = 2;
  double tablet = 2;
  double desktop = 2;
  double laptop = 2;

  /// The current build context
  BoxConstraints _size = const BoxConstraints();

  BoxConstraints get size => _size;

  set size(value) => _size = value;

  ///Rx implementation
  PublishSubject<BoxConstraints> boxBehavior = PublishSubject<BoxConstraints>();

  /// Allow us to add the new contrainsts data
  void updateContrainsts(BoxConstraints value, BuildContext context) {
    _size = value;
  }

  /// Implement initialize
  void initialize({
    required double mobile,
    required double tablet,
    required double desktop,
    required double laptop,
  }) {
    mobile = mobile;
    tablet = tablet;
    desktop = desktop;
    laptop = laptop;
  }

  /// Allow us to dispose the streams expose by the service provider
  void dispose() {
    boxBehavior.close();
  }
}

final breakPointService = BreakPointService();

