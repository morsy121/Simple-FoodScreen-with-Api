import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:foodapp/models/recipe.dart';
import 'package:foodapp/models/recipe_api.dart';
import 'package:foodapp/views/widgets/recipe_card.dart';

class HomePage extends StatefulWidget {
  // const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Recipe>? _recipes;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();

    getRecipes();
  }

  Future<void> getRecipes() async {
    _recipes = await RecipeApi.getRecipe();
    setState(() {
      _isLoading = false;
    });
    print(_recipes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        // elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.restaurant_menu,
              color: Colors.black,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "Food Recipe",
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _recipes!.length,
              itemBuilder: (context, index) {
                return RecipeCard(
                  title: _recipes![index].name,
                  cookTime: _recipes![index].totalTime,
                  rating: _recipes![index].rating.toString(),
                  thumbnailUrl: _recipes![index].images,
                );
              },
            ),
      // body: RecipeCard(
      //     title: "my recipe",
      //     cookTime: "30 min",
      //     rating: "4.3",
      //     thumbnailUrl:
      //         "https://lh3.googleusercontent.com/ei5eF1LRFkkcekhjdR_8XgOqgdjpomf-rda_vvh7jIauCgLlEWORINSKMRR6I6iTcxxZL9riJwFqKMvK0ixS0xwnRHGMY4I5Zw=s360"),
    );
  }
}
