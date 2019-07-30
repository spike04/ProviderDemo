import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/pages/multiProviderSample/MultiProviderSample.dart';
import 'package:provider_demo/pages/simpleCounterProvider/CounterBloc.dart';
import 'package:provider_demo/pages/simpleCounterProvider/SimpleCounterProvider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CounterBloc>.value(
          value: CounterBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => SampleList(),
          '/simple': (context) => SimpleCounterProvider(),
          '/multiprovider': (context) => MultiProviderSample(),
        },
      ),
    );
  }
}

class SampleList extends StatelessWidget {
  final List itemList = [
    {'title': 'Simple Provider Demo', 'route': '/simple'},
    {'title': 'MultiProvider Demo', 'route': '/multiprovider'}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Demo Samples'),
      ),
      body: ListView.builder(
        itemCount: itemList.length,
        itemBuilder: (context, position) {
          var item = itemList[position];
          return ListTile(
            title: Text(item['title']),
            onTap: () {
              Navigator.of(context).pushNamed(item['route']);
            },
          );
        },
      ),
    );
  }
}
