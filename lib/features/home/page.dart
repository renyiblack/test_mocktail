import 'package:flutter/material.dart';
import 'package:mocktail_test/features/home/controller.dart';

class HomePage extends StatefulWidget {
  final HomeController controller;

  const HomePage({
    Key? key,
    required this.title,
    required this.controller,
  }) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    widget.controller.getCounter();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'You have pushed the button this many times:',
            ),
            AnimatedBuilder(
              animation: widget.controller.counterNotifier,
              builder: (BuildContext context, Widget? child) => Text(
                '${widget.controller.counter}',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            TextButton(
              onPressed: widget.controller.saveCounter,
              child: const Text('save'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: widget.controller.incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
