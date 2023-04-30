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

  ControllerSlider(this.initialValue, this.tag)
      : super(null, '', ControllerType.slider);
}

class ControllerToggle extends ControllerUnit {
  @override
  final int initialValue;
  @override
  final String tag;

  ControllerToggle(this.initialValue, this.tag)
      : super(null, '', ControllerType.toggle);
}

enum ControllerType {
  slider,
  toggle,
}

class MessageData {
  final double value;
  final String tag;

  MessageData(this.value, this.tag);
}
