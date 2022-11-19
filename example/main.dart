import 'package:flutter/material.dart';
import 'package:custom_route_transitions_vk/custom_route_transitions_vk.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: 'page1',
      routes: {
        'page1' : (_) => const Page1(),
        'page2' : (_) => const Page2()
      },
    );
  }
}


class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Page 1'),
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white, 
            foregroundColor: Colors.black
          ), 
          onPressed: () {
            RouteTransitions(
              context: context,
              child: const Page2(),
              animation: AnimationType.fadeIn,
              // replace: true
              // duration: const Duration(seconds: 2)
            );
          },
          child: const Text('Go to page 2')
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Page 2'),
      ),
      body: const Center(
        child: Text('Page 2'),
      ),
    );
  }
}