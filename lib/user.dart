class User {
  double _weight = 0;
  double _height = 0;
  String? _gender;
  int? _age;

  User(double weight, double height) {
    if (weight <= 0 || height <= 0) {
      throw Exception('weight and height should be positive');
    }
    _weight = weight;
    _height = height;
  }

  User.createFullUser(double weight, double height, String gender, int age) {
    if (weight <= 0 || height <= 0) {
      throw Exception('weight and height should be positive');
    }
    _weight = weight;
    _height = height;
    _age = age;
    _gender = gender;
  }

  double getBMI() {
    double h = _height / 100; // convert height to m
    return (_weight / (h * h));
  }

  double getCalories() {
    if (_gender != null && _age != null) {
      if (_gender == 'male') {
        return 88.362 +
            (13.397 * _weight) +
            (4.799 * _height) -
            (5.677 * _age!);
      } else {
        return 447.593 +
            (9.247 * _weight) +
            (3.098 * _height) -
            (4.330 * _age!);
      }
    }

    return -1;
  }

  String getBMIStatus() {
    double bmi = getBMI();
    if (bmi < 18.5) {
      return 'Underweight';
    } else if (bmi >= 18.5 && bmi <= 24.9) {
      return 'Normal weight';
    } else if (bmi >= 25 && bmi <= 29.9) {
      return 'Overweight';
    } else {
      return 'Obesity';
    }
  }

  String getBMIMessage() {
    return """
      Your BMI is ${getBMI().toStringAsFixed(1)}
      
      Status: ${getBMIStatus()}
      """;
  }

  String getCaloriesMessage() {
    return """
      You need to eat
      ${getCalories().toStringAsFixed(1)} calories per day      
      """;
  }
}
