import 'package:flutter/material.dart';

class NewSimulationScreen extends StatefulWidget {
  const NewSimulationScreen({Key? key}) : super(key: key);

  @override
  _NewSimulationScreenState createState() => _NewSimulationScreenState();
}

class _NewSimulationScreenState extends State<NewSimulationScreen> {
  String _name = '';
  String _difficulty = '';
  int _age = 18;
  String _hints = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('New Simulation'),
    ),
    body: Padding(
    padding: EdgeInsets.all(16.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    TextField(
    decoration: InputDecoration(
    labelText: 'Name',
    ),
    onChanged: (value) {
    setState(() {
    _name = value;
    });
    },
    ),
      DropdownButton<String>(
        value: _difficulty.isEmpty ? 'easy' : _difficulty,
        hint: Text('Difficulty'),
        items: [
          DropdownMenuItem(
            value: 'easy',
            child: Text('Easy'),
          ),
          DropdownMenuItem(
            value: 'normal',
            child: Text('Normal'),
          ),
          DropdownMenuItem(
            value: 'hard',
            child: Text('Hard'),
          ),
        ],
        onChanged: (value) {
          setState(() {
            _difficulty = value!;
          });
        },
      ),


    Slider(
    value: _age.toDouble(),
    min: 18,
    max: 60,
    divisions: 42,
    label: _age.toString(),
    onChanged: (value) {
    setState(() {
    _age = value.round();
    });
    },
    ),

      DropdownButton<String>(
        value: _hints.isEmpty ? 'none' : _hints,
        hint: Text('Hints'),
        items: [
          DropdownMenuItem(
            value: 'none',
            child: Text('No hints'),
          ),
          DropdownMenuItem(
            value: 'some',
            child: Text('Some hints'),
          ),
          DropdownMenuItem(
            value: 'teach',
            child: Text('Teach me'),
          ),
        ],
        onChanged: (value) {
          setState(() {
            _hints = value!;
          });
        },
      ),


      Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SimulationScreen(
                  name: _name,
                  difficulty: _difficulty,
                  age: _age,
                  hints: _hints,
                ),
              ),
            );
          },
          child: Text('Start Simulation'),
        ),
      ),

    ],
    ),
    ),
    );
  }
}

class SimulationScreen extends StatelessWidget {
  final String name;
  final String difficulty;
  final int age;
  final String hints;

  SimulationScreen({
    required this.name,
    required this.difficulty,
    required this.age,
    required this.hints,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simulation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Name: $name'),
            Text('Difficulty: $difficulty'),
            Text('Age: $age'),
            Text('Hints: $hints'),
          ],
        ),
      ),
    );
  }
}
