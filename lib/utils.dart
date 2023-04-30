class ControllersList {
  final List<ControllerUnit> elements;

  ControllersList(this.elements);
}

abstract class ControllerUnit {
  final initialValue;
  final String tag;
  final ControllerType controllerType;

  ControllerUnit(this.initialValue, this.tag, this.controllerType);
}

class ControllerSlider extends ControllerUnit {
  @override
  final double initialValue;
  @override
  final String tag;

  ControllerSlider({required this.initialValue, required this.tag})
      : super(initialValue, tag, ControllerType.SLIDER);
}

class ControllerToggle extends ControllerUnit {
  @override
  final int initialValue;
  @override
  final String tag;

  ControllerToggle({required this.initialValue, required this.tag})
      : super(initialValue, tag, ControllerType.TOGGLE);
}

class ControllerButton extends ControllerUnit {
  @override
  final int initialValue;
  @override
  final String tag;

  ControllerButton({required this.initialValue, required this.tag})
      : super(initialValue, tag, ControllerType.BUTTON);
}

class ControllerText extends ControllerUnit {
  @override
  final String initialValue;
  @override
  final String tag;

  ControllerText({required this.initialValue, required this.tag})
      : super(initialValue, tag, ControllerType.TEXT);
}

enum ControllerType {
  SLIDER,
  BUTTON,
  TOGGLE,
  TEXT,
}

class MessageData {
  final double value;
  final String tag;

  MessageData(this.value, this.tag);
}

ControllerType getControllerTypeEnum(String str) {
  return ControllerType.values
      .firstWhere((e) => e.toString() == 'ControllerType.' + str);
}
