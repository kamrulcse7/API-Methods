import 'package:e_commerce_app_with_api/const.dart';
import 'package:e_commerce_app_with_api/model/category_list_model.dart';
import 'package:e_commerce_app_with_api/providers/category_provider.dart';
import 'package:e_commerce_app_with_api/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widget/my_category_card.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  // List<CategoryListModel> categoryList = [];
  // @override
  // void didChangeDependencies() async {
  //   categoryList = await ApiService().fetchCategory();
  //   setState(() {});
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    var categoryList = Provider.of<CategoryProvider>(context).categoryList;
    var categoryProvider = Provider.of<CategoryProvider>(context).getcategoryData();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "All Category",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.teal,
      ),
      body: categoryList.isNotEmpty
          ? Container(
              width: double.infinity,
              height: double.infinity,
              padding: EdgeInsets.all(12.0),
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: categoryList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (context, index) {
                  return MyCategoryCard(
                    categoryList: categoryList,
                    index: index,
                  );
                },
              ),
            )
          : Container(
              width: double.infinity,
              height: double.infinity,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
    );
  }
}
