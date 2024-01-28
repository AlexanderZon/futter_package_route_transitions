import 'package:custom_route_transition_al/custom_route_transition_al.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'page1',
      routes: {
        'page1': (_) => const Pagina1Page(),
        'page2': (_) => const Pagina2Page(),
      },
    );
  }
}

class Pagina1Page extends StatelessWidget {
  const Pagina1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 1'),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.blue,
      body: Center(
        child: MaterialButton(
          onPressed: () {
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (_) => const Pagina2Page()));
            RouteTransitions(
              context: context,
              child: const Pagina2Page(),
              animation: AnimationType.fadeIn,
              duration: const Duration(milliseconds: 1000),
              replacement: false,
            );
          },
          color: Colors.white,
          child: const Text('Go to Page 2'),
        ),
      ),
    );
  }
}

class Pagina2Page extends StatelessWidget {
  const Pagina2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 1'),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.blueGrey,
      body: const Center(
        child: Text('Pagina2Page'),
      ),
    );
  }
}
