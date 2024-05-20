import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce/authbloc/sharedprefsutil.dart';
import 'package:flutter_ecommerce/constants/Apirepo.dart';
import 'package:flutter_ecommerce/constants/apiservice.dart';
import 'package:flutter_ecommerce/constants/approuter.dart';
import 'package:flutter_ecommerce/models/cart_model.dart';
import 'package:flutter_ecommerce/models/user_moel.dart';
import 'package:flutter_ecommerce/presentation/features/categories/bloc/categories_bloc.dart';
import 'package:flutter_ecommerce/presentation/features/home/bloc/home_bloc.dart';
import 'package:flutter_ecommerce/presentation/features/home/home.dart';
import 'package:go_router/go_router.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final CategoriesBloc categoriesBloc = CategoriesBloc();

  @override
  void initState() {
    categoriesBloc.add(LoadCategoriesEvent());

    super.initState();
  }

  @override
  void dispose() {
    categoriesBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppCOlors.secondary,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: _buildCategories(),
          )
        ],
      ),
    );
  }

  _buildCategories() {
    return Container(
      height: 700,
      width: MediaQuery.of(context).size.width,
      child: BlocProvider(
        create: (context) => categoriesBloc,
        child: BlocListener<CategoriesBloc, CategoriesState>(
          listener: (context, state) {
            if (state is CategoriesError) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text('error')));
            }
          },
          child: BlocBuilder<CategoriesBloc, CategoriesState>(
            builder: (context, state) {
              if (state is CategoriesInitial) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is CategoriesLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is CategoriesLoaded) {
                return _buildList(context, state.categoryList);
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }

  _buildList(BuildContext context, List categorylist) {
    return ListView.builder(
      itemCount: categorylist.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            context.go(Approutes.productCategory);
          },
          child: Card(
            elevation: 5,
            shadowColor: AppCOlors.CardBorder,
            color: AppCOlors.cardColor,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    categorylist[index].toString().toUpperCase(),
                    style: TextStyle(
                        color: AppCOlors.primary, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
