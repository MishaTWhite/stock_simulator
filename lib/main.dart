import 'package:flutter/material.dart';
import 'package:stock_simulator/screens/new_simulation_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stock Simulator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stock Simulator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to Stock Simulator!',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 32),
            ElevatedButton(
              child: Text('New Simulation'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NewSimulationScreen()),
                );
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              child: Text('Load Simulation'),
              onPressed: () {},
            ),
            SizedBox(height: 16),
            ElevatedButton(
              child: Text('Support Project'),
              onPressed: () {},
            ),
            SizedBox(height: 16),
            ElevatedButton(
              child: Text('Project News'),
              onPressed: () {},
            ),
            SizedBox(height: 32),
            ElevatedButton(
              child: Text('Exit'),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
