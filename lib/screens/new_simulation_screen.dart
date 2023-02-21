import 'package:flutter/material.dart';
import 'package:stock_simulator/screens/simulation_screen.dart';

class NewSimulationScreen extends StatefulWidget {
  @override
  _NewSimulationScreenState createState() => _NewSimulationScreenState();
}

class SimulationSettings extends StatefulWidget {
  @override
  _SimulationSettingsState createState() => _SimulationSettingsState();
}

class _SimulationSettingsState extends State<SimulationSettings> {
  int _age = 30;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.25,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Возраст: $_age',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 10),
          Slider(
            value: _age.toDouble(),
            min: 15,
            max: 60,
            onChanged: (newValue) {
              setState(() {
                _age = newValue.round();
              });
            },
          ),
        ],
      ),
    );
  }
}


class _NewSimulationScreenState extends State<NewSimulationScreen> {
  final TextEditingController _nameController = TextEditingController();
  String _selectedDifficulty = 'Easy';

  void _onDifficultyChanged(String? value) {
    if (value != null) {
      setState(() {
        _selectedDifficulty = value;
      });
    }
  }

  void _onStartSimulationPressed(BuildContext context) {
    final String name = _nameController.text;
    double startingBalance = 0.0;

    switch (_selectedDifficulty) {
      case 'Easy':
        startingBalance = 100000.0;
        break;
      case 'Medium':
        startingBalance = 10000.0;
        break;
      case 'Hard':
        startingBalance = 3000.0;
        break;
      default:
        startingBalance = 100000.0;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SimulationScreen(
          name: name,
          startingBalance: startingBalance,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Simulation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Select difficulty:',
              style: TextStyle(fontSize: 20),
            ),
            DropdownButton<String>(
              value: _selectedDifficulty,
              items: [
                DropdownMenuItem(
                  child: Text('Easy'),
                  value: 'Easy',
                ),
                DropdownMenuItem(
                  child: Text('Medium'),
                  value: 'Medium',
                ),
                DropdownMenuItem(
                  child: Text('Hard'),
                  value: 'Hard',
                ),
              ],
              onChanged: _onDifficultyChanged,
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Name:'),
                  TextField(
                    controller: _nameController,
                  ),
                  SizedBox(height: 8),
                  Text('Starting Balance:'),
                  Text('${_selectedDifficulty == 'Easy' ? 100000.0 : _selectedDifficulty == 'Medium' ? 10000.0 : 3000.0}'),
                ],
              ),
            ),
            ElevatedButton(
              child: Text('Start Simulation'),
              onPressed: () => _onStartSimulationPressed(context),
            ),
          ],
        ),
      ),
    );
  }
}
