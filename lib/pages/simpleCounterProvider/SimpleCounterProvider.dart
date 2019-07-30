import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/pages/simpleCounterProvider/CounterBloc.dart';

class SimpleCounterProvider extends StatelessWidget {
  SimpleCounterProvider({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final counterBloc = Provider.of<CounterBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Counter Provider'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Counter Demo Using Provider',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Count: ${counterBloc.counter}',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            heroTag: "Increment Button",
            child: Icon(Icons.exposure_plus_1),
            onPressed: () {
              counterBloc.increment();
            },
          ),
          SizedBox(height: 20.0),
          FloatingActionButton(
            heroTag: "Decrement Button",
            child: Icon(Icons.exposure_neg_1),
            onPressed: () {
              counterBloc.decrment();
            },
          ),
        ],
      ),
    );
  }
}
