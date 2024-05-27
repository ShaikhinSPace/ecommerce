import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/presentation/features/home/home.dart';
import 'package:flutter_ecommerce/presentation/features/searchbar/searchbar.dart';

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
      leading: Image.asset(
        width: MediaQuery.of(context).size.width,
        'assets/trybanner.png',
        height: 50 + 10 + 10 + 10 + 10,
      ),
      title: _buildSearchBar(),
      toolbarHeight: 100,
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomSearchBar(
          // searchName: TextEditingController(),
          ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60 + 10 + 10);
}
