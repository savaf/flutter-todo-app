
import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // toolbarHeight: 80,
      backgroundColor: Theme.of(context).colorScheme.background,
      elevation: 0,
      // title: _searchBox(),
      // leading: IconButton(
      //   icon: const Icon(Icons.menu),
      //   color: Theme.of(context).colorScheme.onPrimary,
      //   onPressed: () {},
      // ),
    );
  }
}
