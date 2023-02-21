import 'package:flutter/material.dart';

class SimulationScreen extends StatefulWidget {
  final String name;
  final double startingBalance;

  SimulationScreen({
    required this.name,
    required this.startingBalance,
  });

  @override
  _SimulationScreenState createState() => _SimulationScreenState();
}

class _SimulationScreenState extends State<SimulationScreen> {
  double _balance = 0.0;

  @override
  void initState() {
    super.initState();
    _balance = widget.startingBalance;
  }

  void _onBuyPressed() {
    setState(() {
      _balance -= 100.0;
    });
  }

  void _onSellPressed() {
    setState(() {
      _balance += 100.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.name}\'s Simulation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Current Balance:',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '\$${_balance.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 36),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: Text('Buy'),
                  onPressed: _onBuyPressed,
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  child: Text('Sell'),
                  onPressed: _onSellPressed,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
