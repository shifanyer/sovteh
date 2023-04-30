import '../utils.dart';

class ControllerModel {
  final ControllerType type;
  final String name;
  final double coord_x;
  final double coord_y;
  final int width;
  final int height;
  final String text;

  ControllerModel(
      {required this.type,
      required this.name,
      required this.coord_x,
      required this.coord_y,
      required this.width,
      required this.height,
      required this.text});

  factory ControllerModel.fromJson(Map<String, dynamic> json) {
    ControllerType type = getControllerTypeEnum(json["type"] ?? "TEXT");
    String name = (json["name"]) ?? "NAME";
    double coord_x = (json["coord_x"] ?? "0.0");
    double coord_y = (json["coord_y"] ?? "0.0");
    int width = (json["width"] ?? "0");
    int height = (json["height"] ?? "0");
    String text = (json["text"]) ?? "TEXT";
    return ControllerModel(
        type: type,
        name: name,
        coord_x: coord_x,
        coord_y: coord_y,
        width: width,
        height: height,
        text: text);
  }
}
