import 'package:caloriyet/userInfo.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Caloriyet'),
        backgroundColor: Colors.grey,
      ),
      body: Column(
        children: [
          Image.asset(
            'image/caloriyet.jpg',
            height: 400,
          ),
          Center(
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const UserInfo()));
                },
                child: const Text(
                  'start',
                  style: TextStyle(
                    fontSize: 90,
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
