import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/shared/consts/app_colors_const.dart';
import '../../submodules/my_books/router/my_books_router.dart';
import '../components/custom_app_bar_home.dart';
import '../controller/home_controller.dart';
import '../states/home_states.dart';

class HomeContainerPage extends StatefulWidget {
  const HomeContainerPage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeContainerPage> createState() => _HomeContainerPageState();
}

class _HomeContainerPageState extends State<HomeContainerPage> {
  final controller = GetIt.I.get<HomeController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        controller.getUser();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller,
      builder: (context, value, _) {
        if (value is HomeLoadedState) {
          return DefaultTabController(
            length: 3,
            child: Scaffold(
              backgroundColor: AppColorsConst.background,
              body: NestedScrollView(
                headerSliverBuilder: (_, innerBoxIsScrolled) {
                  return [
                    CustomAppBarHome(
                      user: value.user,
                      innerBoxIsScrolled: innerBoxIsScrolled,
                    ),
                  ];
                },
                body: TabBarView(
                  children: [
                    const MyBooksRouter(),
                    const Center(
                      child: Text('Emprestados'),
                    ),
                    Container(),
                  ],
                ),
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}
