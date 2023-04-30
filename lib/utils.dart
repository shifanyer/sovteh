class ControllersList {
  final List<ControllerUnit> elements;

  ControllersList(this.elements);
}

abstract class ControllerUnit {
  final initialValue;

  ControllerUnit(this.initialValue);
}

class ControllerSlider extends ControllerUnit {
  @override
  final double initialValue = 0.0;

  ControllerSlider(super.initialValue);
}

class ControllerToggle extends ControllerUnit {
  @override
  final int initialValue = 0;

  ControllerToggle(super.initialValue);
}

enum ControllerType {
  slider,
  toggle,
}

class MessageData{
  final double value;
  final String tag;

  MessageData(this.value, this.tag);
}