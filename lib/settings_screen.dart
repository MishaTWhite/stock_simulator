import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simulation Settings'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Name',
                hintText: 'Enter your name',
              ),
            ),
            SizedBox(height: 16),
            Text('Difficulty Level:'),
            RadioListTile(
              title: Text('Easy'),
              value: 0,
              groupValue: null,
              onChanged: (value) {},
            ),
            RadioListTile(
              title: Text('Normal'),
              value: 1,
              groupValue: null,
              onChanged: (value) {},
            ),
            RadioListTile(
              title: Text('Hard'),
              value: 2,
              groupValue: null,
              onChanged: (value) {},
            ),
            SizedBox(height: 16),
            Text('Starting Age:'),
            Slider(
              value: 18,
              min: 18,
              max: 60,
              divisions: 42,
              label: 'Age',
              onChanged: (value) {},
            ),
            SizedBox(height: 16),
            Text('Hints:'),
            DropdownButton<int>(
              value: 0,
              items: [
                DropdownMenuItem(
                  child: Text('None'),
                  value: 0,
                ),
                DropdownMenuItem(
                  child: Text('Show hints'),
                  value: 1,
                ),
                DropdownMenuItem(
                  child: Text('Teach me'),
                  value: 2,
                ),
              ],
              onChanged: (value) {},
            ),
          ],
        ),
      ),
    );
  }
}
