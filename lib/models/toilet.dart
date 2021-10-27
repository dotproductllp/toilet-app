

class Toilet {
  ToiletCategory? toiletCategory;
  Gender? gender;

  Toilet({required this.toiletCategory,required this.gender});
}

class ToiletCategory {
  int id;
  String title;

  ToiletCategory({required this.id,required this.title});
}

class Gender {
  int id;
  String title;

  Gender({required this.id, required this.title});
}