import 'package:flutter/material.dart';

import '../../../../modules/home/router/home_router.dart';

class CustomPageView extends StatefulWidget {
  const CustomPageView({
    Key? key,
    required this.pageController,
  }) : super(key: key);

  final PageController pageController;

  @override
  State<CustomPageView> createState() => _CustomPageViewState();
}

class _CustomPageViewState extends State<CustomPageView> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: widget.pageController,
      children: const [
        HomeRouter(),
        Center(child: Text('Adicionar')),
        Center(child: Text('Buscar')),
        Center(child: Text('Favoritos')),
      ],
    );
  }
}
