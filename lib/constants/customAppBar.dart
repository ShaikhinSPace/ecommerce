import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/presentation/features/home/home.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {Key? key,
      this.title = '',
      this.leading,
      this.titleWidget,
      this.appbarCOlor,
      this.toolbarHeight})
      : super(key: key);

  final String title;
  final Widget? leading;
  final Widget? titleWidget;
  final double? toolbarHeight;
  final Color? appbarCOlor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppCOlors.primary,
      leading: leading,
      title: Image.asset(
        width: MediaQuery.of(context).size.width,
        'assets/banner.png',
        height: 50 + 10 + 10 + 10,
      ),
      toolbarHeight: 100,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
