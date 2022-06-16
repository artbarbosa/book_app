import 'package:flutter/material.dart';

import '../ui/container/detail_container.dart';
import 'detail_arguments.dart';

class DetailRouter extends StatelessWidget {
  const DetailRouter({Key? key, required this.arguments}) : super(key: key);
  final DetailArguments arguments;
  @override
  Widget build(BuildContext context) {
    return DetailContainer(
      arguments: arguments,
    );
  }
}
