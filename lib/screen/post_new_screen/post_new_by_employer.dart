import 'package:flutter/material.dart';

class PostNewEmployer extends StatefulWidget {
  const PostNewEmployer({Key? key}) : super(key: key);

  @override
  State<PostNewEmployer> createState() => _PostNewEmployerState();
}

class _PostNewEmployerState extends State<PostNewEmployer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.redAccent,
      ),
    );
  }
}
