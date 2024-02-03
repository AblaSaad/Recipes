class Recipe {
  String? docId;
  num? calories;
  String? describition;
  Map<String, String>? directions;
  String? imageUrl;
  List<String>? ingredients;
  num? ratings;
  num? servings;
  String? title;
  num? total_time;
  String? type;
  List<String>? favourites_user_ids;

  Recipe();

  Recipe.fromJson(Map<String, dynamic> data, [String? id]) {
    docId = id;
    calories = data['calories'];
    describition = data['describition'];
    directions = data['directions'] != null
        ? Map<String, String>.from(data['directions'])
        : null;
    imageUrl = data['imageUrl'];
    ingredients = data['ingredients'] != null
        ? List<String>.from(data['ingredients'].map((e) => e.toString()))
        : null;
    ratings = data['ratings'];
    servings = data['servings'];
    title = data['title'];
    total_time = data['total_time'];
    type = data['type'];
    favourites_user_ids = data['favourites_user_ids'] != null
        ? List<String>.from(
            data['favourites_user_ids'].map((e) => e.toString()))
        : null;
  }

  Map<String, dynamic> toJson() {
    return {
      "calories": calories,
      "describition": describition,
      "directions": directions,
      "imageUrl": imageUrl,
      "ingredients": ingredients,
      "ratings": ratings,
      "servings": servings,
      "title": title,
      "total_time": total_time,
      "type": type,
      "favourites_user_ids": favourites_user_ids
    };
  }
}
