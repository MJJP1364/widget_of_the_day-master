import 'package:flutter/material.dart';

class MyCoustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Color? backgroundcolor;
  const MyCoustomAppBar({
    Key? key,
    required this.title,
    required this.backgroundcolor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title!),
      backgroundColor: backgroundcolor,
      centerTitle: true,
      toolbarHeight: 100,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
