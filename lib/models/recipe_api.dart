import 'dart:convert';
import 'package:foodapp/models/recipe.dart';
import 'package:http/http.dart' as http;

class RecipeApi {
  static Future<List<Recipe>> getRecipe() async {
    var uri = Uri.https("yummly2.p.rapidapi.com", "/feeds/list", {
      "limit": "24",
      "start": "0",
      "tag": "list.recipe.popular",
    });

    final Response = await http.get(uri, headers: {
      "X-RapidAPI-Host": "yummly2.p.rapidapi.com",
      "X-RapidAPI-Key": "ad75eeeb8bmsh5057d69cb0c031fp19f47ejsn6dcf89382722",
      "useQueryString": "true"
    });

    Map data = jsonDecode(Response.body);
    List _temp = [];

    for (var i in data["feed"]) {
      _temp.add(i["content"]["details"]);
    }

    return Recipe.recipesFromSnapshot(_temp);
  }
}
