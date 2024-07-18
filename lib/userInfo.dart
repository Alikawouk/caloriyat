import 'package:caloriyet/showresult.dart';
import 'package:caloriyet/user.dart';
import 'package:flutter/material.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({super.key});

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  final TextEditingController _controllerWeight = TextEditingController();
  final TextEditingController _controllerHeight = TextEditingController();
  int _age = 20;
  // ignore: prefer_final_fields
  String _gender = "male";
  int _choice = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('caloriyet'),
        backgroundColor: Colors.grey,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: _controllerWeight,
            decoration: const InputDecoration(
                labelText: 'Weight',
                prefixIcon: Icon(Icons.input),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey))),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: _controllerHeight,
            decoration: const InputDecoration(
                labelText: 'Height',
                prefixIcon: Icon(Icons.input),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey))),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey, fixedSize: const Size(400, 50)),
              onPressed: () {
                // ignore: no_leading_underscores_for_local_identifiers
                double _weight = double.parse(_controllerWeight.text);
                // ignore: no_leading_underscores_for_local_identifiers
                double _height = double.parse(_controllerHeight.text);
                User user = User(_weight, _height);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Result(showBMI: true),
                        settings: RouteSettings(arguments: user)));
              },
              child: const Text(
                'how fit i am?',
                style: TextStyle(fontSize: 40),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Gender',
                style: TextStyle(fontSize: 20),
              ),
              Radio(
                  value: 1,
                  groupValue: _choice,
                  onChanged: (v) {
                    setState(() {
                      _choice = v as int;
                    });
                  }),
              const Text(
                'Male',
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
          Row(
            children: [
              const SizedBox(
                width: 191,
              ),
              Radio(
                  value: 2,
                  groupValue: _choice,
                  onChanged: (v) {
                    setState(() {
                      _choice = v as int;
                    });
                  }),
              const Text('Female', style: TextStyle(fontSize: 20)),
            ],
          ),
          Slider(
              value: _age.toDouble(),
              min: 10,
              max: 100,
              activeColor: Colors.grey,
              thumbColor: Colors.grey,
              inactiveColor: Colors.black,
              onChanged: (double? val) {
                setState(() {
                  _age = val!.round();
                });
              }),
          Text(
            '$_age years',
            style: const TextStyle(fontSize: 25.0),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey, fixedSize: const Size(400, 40)),
            onPressed: () {
              // ignore: no_leading_underscores_for_local_identifiers
              double _weight = double.parse(_controllerWeight.text);
              // ignore: no_leading_underscores_for_local_identifiers
              double _height = double.parse(_controllerHeight.text);

              User user = User.createFullUser(_weight, _height, _gender, _age);

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Result(showBMI: false),
                      settings: RouteSettings(arguments: user)));
            },
            child: const Text(
              'How much should i eat?',
              style: TextStyle(fontSize: 30),
            ),
          ),
        ],
      ),
    );
  }
}
