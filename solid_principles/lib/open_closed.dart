void main(){}
// Classes should be OPEN for extension, but CLOSED for modification.
// Bad — must edit existing code to add new shapes:
class AreaCalculator {
  double calculate(String shapeType, double value) {
    if (shapeType == "circle") {
      return 3.14 * value * value;
    } else if (shapeType == "square") {
      return value * value;
    }
    // every new shape means editing this method again
    return 0;
  }
}

// Good — extend via new classes, don't touch existing code:
abstract class Shape {
  double calculateArea();
}

class Circle extends Shape {
  double radius;
  Circle(this.radius);
  @override
  double calculateArea() => 3.14 * radius * radius;
}

class Square extends Shape {
  double side;
  Square(this.side);
  @override
  double calculateArea() => side * side;
}
// no need to modify Circle or Square.