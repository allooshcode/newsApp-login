import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'email',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.blue,
                  ),
                  fillColor: Colors.grey),
            ),
            SizedBox(
              height: 22,
            ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.visibility),
                labelText: 'password',
                border: OutlineInputBorder(),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.blue,
                ),
                fillColor: Colors.grey,
              ),
            ),
            SizedBox(
              height: 22,
            ),
            ElevatedButton(
              child: Text('sing in'),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
