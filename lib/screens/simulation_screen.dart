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

class SimulationScreen extends StatefulWidget {
  final int startingAge;

  SimulationScreen({this.startingAge});

  @override
  _SimulationScreenState createState() => _SimulationScreenState();
}

class _SimulationScreenState extends State<SimulationScreen> {
  int _age;
  DateTime _currentDate;
  Timer _timer;

  @override
  void initState() {
    super.initState();
    _age = widget.startingAge;
    _currentDate = DateTime(DateTime.now().year, 1, 1);
    _timer = Timer.periodic(Duration(days: 1), (timer) {
      setState(() {
        _currentDate = _currentDate.add(Duration(days: 1));
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  void _fastForward() {
    setState(() {
      _currentDate = _currentDate.add(Duration(days: 7));
    });
  }

  void _regularForward() {
    setState(() {
      _currentDate = _currentDate.add(Duration(days: 1));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Симуляция'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Возраст: $_age',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RaisedButton(
                onPressed: _regularForward,
                child: Text('Промотать день'),
              ),
              RaisedButton(
                onPressed: _fastForward,
                child: Text('Промотать неделю'),
              ),
            ],
          ),
          SizedBox(height: 20),
          Text(
            'Текущая дата: ${_currentDate.day}.${_currentDate.month}.${_currentDate.year}',
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
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
