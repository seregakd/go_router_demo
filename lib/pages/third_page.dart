import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_demo/router.dart';


class ThirdPage extends StatelessWidget {
  const ThirdPage({
    Key? key,
    required this.title,
    required this.text,
  }) : super(key: key);

  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        title: Text("Third Page"),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'title : $title',
                style: TextStyle(fontSize: 22),
              ),
              Text(
                'text : $text',
                style: TextStyle(fontSize: 22),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  backgroundColor: Colors.greenAccent,
                ),
                onPressed: () {
                  context.go(AppRouter.next);
                },
                child: const Text(
                  'to Next Page',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
