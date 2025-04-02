// food_item.dart
class FoodItem {
  String name;
  int sodium;

  FoodItem({required this.name, required this.sodium});
}

// ข้อมูลรายการอาหาร
final List<FoodItem> foodItems = [
  FoodItem(name: 'Apple', sodium: 1),
  FoodItem(name: 'Banana', sodium: 1),
  FoodItem(name: 'Pizza', sodium: 500),
  FoodItem(name: 'Cheese', sodium: 700),
  FoodItem(name: 'Bread', sodium: 250),
];
