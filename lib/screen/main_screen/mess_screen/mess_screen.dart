import 'package:flutter/material.dart';

class MessScreen extends StatefulWidget {
  const MessScreen({Key? key}) : super(key: key);

  @override
  State<MessScreen> createState() => _MessScreenState();
}

class _MessScreenState extends State<MessScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellowAccent,
      child: Center(
        child: Text("Mess screen"),
      ),
    );
  }
}
