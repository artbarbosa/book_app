import 'package:flutter/material.dart';

class MyBooksErrorPage extends StatelessWidget {
  const MyBooksErrorPage(
      {Key? key, required this.errorMenssage, required this.refresh})
      : super(key: key);
  final String errorMenssage;
  final void Function() refresh;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(errorMenssage)),
      floatingActionButton: FloatingActionButton(
        onPressed: refresh,
        child: const Icon(
          Icons.refresh_outlined,
        ),
      ),
    );
  }
}
