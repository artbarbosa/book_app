import 'package:flutter/material.dart';

import '../../consts/app_colors_const.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({
    Key? key,
    this.onTap,
    required this.currentIndex,
  }) : super(key: key);

  final int currentIndex;
  final Function(int)? onTap;
  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColorsConst.onPrimary,
      selectedItemColor: AppColorsConst.primary,
      unselectedItemColor: AppColorsConst.secondary,
      currentIndex: widget.currentIndex,
      onTap: widget.onTap,
      items: const [
        BottomNavigationBarItem(
          label: 'Início',
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: 'Adicionar',
          icon: Icon(Icons.add_circle),
        ),
        BottomNavigationBarItem(
          label: 'Buscar',
          icon: Icon(Icons.search),
        ),
        BottomNavigationBarItem(
          label: 'Favoritos',
          icon: Icon(Icons.favorite),
        )
      ],
    );
  }
}
