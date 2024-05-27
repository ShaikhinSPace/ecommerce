import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/constants/apiservice.dart';
import 'package:flutter_ecommerce/presentation/features/home/home.dart';

class CustomSearchBar extends StatelessWidget {
  CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController textEditingController = TextEditingController();
    return SearchBar(
      controller: textEditingController,
      backgroundColor: MaterialStatePropertyAll(AppCOlors.cardColor),
      leading: Icon(
        Icons.search,
        color: AppCOlors.primary,
      ),
      hintStyle: MaterialStatePropertyAll(
          TextStyle(color: AppCOlors.primary, fontSize: 15)),
      hintText: 'Search Products',
      onSubmitted: (value) {
        value = textEditingController.text;
      },
    );
  }
}

class SearchPage extends StatefulWidget {
  // final String name;
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  ApiProvider apiProvider = ApiProvider();
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
