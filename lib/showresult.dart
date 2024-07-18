import 'package:caloriyet/user.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  Result({required this.showBMI, super.key});
  bool showBMI;
  String result = '';

  @override
  Widget build(BuildContext context) {
    User user = ModalRoute.of(context)!.settings.arguments as User;
    if (showBMI) {
      result = user.getBMIMessage();
    } else {
      result = user.getCaloriesMessage();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text("$Result"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 30.0,
            ),
            Image.asset(
              'image/caloriyet.jpg',
              width: 350,
            ),
            const SizedBox(height: 20.0),
            Text(
              result,
              style: const TextStyle(
                  fontSize: 30.0, color: Color.fromARGB(255, 3, 40, 103)),
            ),
          ],
        ),
      ),
    );
  }
}
