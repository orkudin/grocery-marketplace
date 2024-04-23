import 'package:grocery_marketplace/models/card_product.dart';

final List<String> categories = [
  "Fruits & Berries",
  "Vegetables",
  "Leafy Greens",
  "Herbs",
  "Microgreens",
  "Mushrooms",
  "Beef",
  "Pork",
  "Lamb",
  "Poultry",
  "Eggs",
  "Milk & Cream",
  "Cheese",
  "Yogurt",
  "Butter",
  "Honey",
  "Maple Syrup",
  "Jams & Preserves",
  "Bread & Pastries",
  "Flour & Grains",
  "Nuts & Seeds",
  "Dried Fruits",
  "Cider & Juice",
  "Wine & Spirits",
  "Coffee & Tea",
  "Sauces & Condiments",
  "Pickles & Ferments",
  "Salad Dressings",
  "Dips & Spreads",
  "Prepared Meals",
  "Gift Baskets",
  "Farm Merchandise"
];

List<CardProduct> dummyCardProductsList = [
  CardProduct(
    id: 1,
    title: "Apple",
    description: "Juicy and delicious apples straight from the orchard.",
    price: 205,
    images: [
      "https://images.pexels.com/photos/376464/pexels-photo-376464.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "https://images.pexels.com/photos/1099680/pexels-photo-1099680.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
    ],
    category: "Fruits & Berries",
  ),
  CardProduct(
    id: 2,
    title: "Carrot",
    description: "Fresh, healthy, and aromatic carrots.",
    price: 108,
    images: [
      "https://images.pexels.com/photos/1343975/pexels-photo-1343975.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "https://images.pexels.com/photos/162670/carrots-vegetables-market-organic-162670.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
    ],
    category: "Vegetables",
  ),
  CardProduct(
    id: 3,
    title: "Chicken",
    description: "Natural antibiotic-free chicken meat.",
    price: 500,
    images: [
      "https://images.pexels.com/photos/39320/chicken-breast-meat-portion-39320.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "https://images.pexels.com/photos/324028/pexels-photo-324028.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
    ],
    category: "Poultry",
  ),
  CardProduct(
    id: 4,
    title: "Salmon",
    description: "Fresh salmon, perfect for cooking.",
    price: 805,
    images: [
      "https://images.pexels.com/photos/4050298/pexels-photo-4050298.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "https://images.pexels.com/photos/2927504/pexels-photo-2927504.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
    ],
    category: "Seafood",
  ),
  CardProduct(
    id: 5,
    title: "Milk",
    description: "Fresh milk, an excellent source of calcium.",
    price: 200,
    images: [
      "https://images.pexels.com/photos/4042533/pexels-photo-4042533.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "https://images.pexels.com/photos/1344841/pexels-photo-1344841.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
    ],
    category: "Milk & Cream",
  ),
  CardProduct(
    id: 6,
    title: "Beef",
    description: "High-quality beef for your favorite recipes.",
    price: 1000,
    images: [
      "https://images.pexels.com/photos/708587/pexels-photo-708587.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "https://images.pexels.com/photos/385048/pexels-photo-385048.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
    ],
    category: "Beef",
  ),
  CardProduct(
    id: 7,
    title: "Lettuce",
    description: "Fresh and crispy lettuce leaves.",
    price: 105,
    images: [
      "https://images.pexels.com/photos/238744/pexels-photo-238744.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "https://images.pexels.com/photos/533360/pexels-photo-533360.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
    ],
    category: "Leafy Greens",
  ),
  CardProduct(
    id: 8,
    title: "Eggs",
    description: "Farm-fresh eggs for your breakfast.",
    price: 300,
    images: [
      "https://images.pexels.com/photos/323682/pexels-photo-323682.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "https://images.pexels.com/photos/1070975/pexels-photo-1070975.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
    ],
    category: "Eggs",
  ),
  CardProduct(
    id: 9,
    title: "Blueberries",
    description: "Plump and sweet blueberries for snacking.",
    price: 400,
    images: [
      "https://images.pexels.com/photos/109275/pexels-photo-109275.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "https://images.pexels.com/photos/3662880/pexels-photo-3662880.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
    ],
    category: "Fruits & Berries",
  ),
  CardProduct(
    id: 10,
    title: "Tomato",
    description: "Fresh and flavorful tomatoes.",
    price: 200,
    images: [
      "https://images.pexels.com/photos/461428/pexels-photo-461428.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "https://images.pexels.com/photos/533360/pexels-photo-533360.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
    ],
    category: "Vegetables",
  ),
  CardProduct(
    id: 11,
    title: "Spinach",
    description: "Nutritious spinach leaves for salads and cooking.",
    price: 205,
    images: [
      "https://images.pexels.com/photos/235291/pexels-photo-235291.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "https://images.pexels.com/photos/1397133/pexels-photo-1397133.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
    ],
    category: "Leafy Greens",
  ),
  CardProduct(
    id: 12,
    title: "Cucumber",
    description: "Crisp and refreshing cucumbers.",
    price: 102,
    images: [
      "https://images.pexels.com/photos/538721/pexels-photo-538721.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "https://images.pexels.com/photos/225161/pexels-photo-225161.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
    ],
    category: "Vegetables",
  ),
  CardProduct(
    id: 13,
    title: "Applesauce",
    description: "Homemade applesauce, sweet and delicious.",
    price: 300,
    images: [
      "https://images.pexels.com/photos/396228/pexels-photo-396228.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "https://images.pexels.com/photos/39553/food-apple-fresh-healthy.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
    ],
    category: "Jams & Preserves",
  ),
  CardProduct(
    id: 14,
    title: "Broccoli",
    description: "Nutrient-rich broccoli florets.",
    price: 108,
    images: [
      "https://images.pexels.com/photos/229007/pexels-photo-229007.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "https://images.pexels.com/photos/533360/pexels-photo-533360.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
    ],
    category: "Vegetables",
  ),
  CardProduct(
    id: 15,
    title: "Cheese",
    description: "Artisanal cheese, perfect for pairing.",
    price: 600,
    images: [
      "https://images.pexels.com/photos/675951/pexels-photo-675951.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "https://images.pexels.com/photos/618848/pexels-photo-618848.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
    ],
    category: "Cheese",
  ),
  CardProduct(
    id: 16,
    title: "Honey",
    description: "Pure, golden honey from local hives.",
    price: 500,
    images: [
      "https://images.pexels.com/photos/459793/pexels-photo-459793.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "https://images.pexels.com/photos/459805/pexels-photo-459805.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
    ],
    category: "Honey",
  ),
  CardProduct(
    id: 17,
    title: "Whole Wheat Bread",
    description: "Freshly baked whole wheat bread.",
    price: 305,
    images: [
      "https://images.pexels.com/photos/247685/pexels-photo-247685.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "https://images.pexels.com/photos/238194/pexels-photo-238194.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
    ],
    category: "Bread & Pastries",
  ),
  CardProduct(
    id: 18,
    title: "Coffee Beans",
    description: "Premium roasted coffee beans for brewing.",
    price: 1200,
    images: [
      "https://images.pexels.com/photos/1440862/pexels-photo-1440862.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "https://images.pexels.com/photos/273838/pexels-photo-273838.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
    ],
    category: "Coffee & Tea",
  ),
  CardProduct(
    id: 19,
    title: "Almonds",
    description: "Crunchy almonds, packed with nutrients.",
    price: 700,
    images: [
      "https://images.pexels.com/photos/1440862/pexels-photo-1440862.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "https://images.pexels.com/photos/6347868/pexels-photo-6347868.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
    ],
    category: "Nuts & Seeds",
  ),
  CardProduct(
    id: 20,
    title: "Orange Juice",
    description: "Freshly squeezed orange juice.",
    price: 400,
    images: [
      "https://images.pexels.com/photos/1211559/pexels-photo-1211559.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "https://images.pexels.com/photos/1211558/pexels-photo-1211558.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
    ],
    category: "Cider & Juice",
  ),
  CardProduct(
    id: 21,
    title: "Tomato Sauce",
    description: "Rich and flavorful tomato sauce for pasta.",
    price: 300,
    images: [
      "https://images.pexels.com/photos/1211559/pexels-photo-1211559.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "https://images.pexels.com/photos/1211558/pexels-photo-1211558.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
    ],
    category: "Sauces & Condiments",
  ),
  CardProduct(
    id: 22,
    title: "Pickles",
    description: "Crunchy pickles, perfect for snacking.",
    price: 205,
    images: [
      "https://images.pexels.com/photos/1211559/pexels-photo-1211559.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "https://images.pexels.com/photos/1211558/pexels-photo-1211558.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
    ],
    category: "Pickles & Ferments",
  ),
  CardProduct(
    id: 23,
    title: "Spaghetti",
    description: "Classic spaghetti pasta for your favorite dishes.",
    price: 200,
    images: [
      "https://images.pexels.com/photos/1211559/pexels-photo-1211559.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "https://images.pexels.com/photos/1211558/pexels-photo-1211558.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
    ],
    category: "Flour & Grains",
  ),
  CardProduct(
    id: 24,
    title: "Chocolate Chip Cookies",
    description: "Homemade chocolate chip cookies, warm and gooey.",
    price: 400,
    images: [
      "https://images.pexels.com/photos/1211559/pexels-photo-1211559.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "https://images.pexels.com/photos/1211558/pexels-photo-1211558.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
    ],
    category: "Bread & Pastries",
  ),
  CardProduct(
    id: 25,
    title: "Cherry Jam",
    description: "Sweet and tangy cherry jam.",
    price: 305,
    images: [
      "https://images.pexels.com/photos/1211559/pexels-photo-1211559.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "https://images.pexels.com/photos/1211558/pexels-photo-1211558.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
    ],
    category: "Jams & Preserves",
  ),
  CardProduct(
    id: 26,
    title: "Basil",
    description: "Fresh basil leaves, perfect for seasoning.",
    price: 100,
    images: [
      "https://images.pexels.com/photos/1211559/pexels-photo-1211559.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "https://images.pexels.com/photos/1211558/pexels-photo-1211558.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
    ],
    category: "Herbs",
  ),
  CardProduct(
    id: 27,
    title: "Potatoes",
    description: "Versatile potatoes for various culinary uses.",
    price: 200,
    images: [
      "https://images.pexels.com/photos/1211559/pexels-photo-1211559.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "https://images.pexels.com/photos/1211558/pexels-photo-1211558.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
    ],
    category: "Vegetables",
  ),
  CardProduct(
    id: 28,
    title: "Soy Milk",
    description: "Nutritious soy milk alternative.",
    price: 300,
    images: [
      "https://images.pexels.com/photos/1211559/pexels-photo-1211559.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "https://images.pexels.com/photos/1211558/pexels-photo-1211558.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
    ],
    category: "Milk & Cream",
  ),
  CardProduct(
    id: 29,
    title: "Gouda Cheese",
    description: "Smooth and creamy Gouda cheese.",
    price: 800,
    images: [
      "https://images.pexels.com/photos/1211559/pexels-photo-1211559.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "https://images.pexels.com/photos/1211558/pexels-photo-1211558.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
    ],
    category: "Cheese",
  ),
  CardProduct(
    id: 30,
    title: "Oatmeal",
    description: "Hearty oatmeal for a nutritious breakfast.",
    price: 205,
    images: [
      "https://images.pexels.com/photos/1211559/pexels-photo-1211559.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "https://images.pexels.com/photos/1211558/pexels-photo-1211558.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
    ],
    category: "Flour & Grains",
  ),
  CardProduct(
    id: 31,
    title: "Almond Butter",
    description: "Smooth and creamy almond butter.",
    price: 700,
    images: [
      "https://images.pexels.com/photos/1211559/pexels-photo-1211559.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "https://images.pexels.com/photos/1211558/pexels-photo-1211558.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
    ],
    category: "Nuts & Seeds",
  ),
  CardProduct(
    id: 32,
    title: "Maple Syrup",
    description: "Pure maple syrup, perfect for pancakes.",
    price: 600,
    images: [
      "https://images.pexels.com/photos/1211559/pexels-photo-1211559.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "https://images.pexels.com/photos/1211558/pexels-photo-1211558.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
    ],
    category: "Maple Syrup",
  ),
  CardProduct(
    id: 33,
    title: "Green Tea",
    description: "Refreshing green tea leaves.",
    price: 300,
    images: [
      "https://images.pexels.com/photos/1211559/pexels-photo-1211559.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "https://images.pexels.com/photos/1211558/pexels-photo-1211558.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
    ],
    category: "Coffee & Tea",
  ),
  CardProduct(
    id: 34,
    title: "Peanut Butter",
    description: "Creamy peanut butter spread.",
    price: 500,
    images: [
      "https://images.pexels.com/photos/1211559/pexels-photo-1211559.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "https://images.pexels.com/photos/1211558/pexels-photo-1211558.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
    ],
    category: "Nuts & Seeds",
  ),
  CardProduct(
    id: 35,
    title: "Cauliflower",
    description: "Fresh and versatile cauliflower.",
    price: 200,
    images: [
      "https://images.pexels.com/photos/1211559/pexels-photo-1211559.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "https://images.pexels.com/photos/1211558/pexels-photo-1211558.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
    ],
    category: "Vegetables",
  ),
  CardProduct(
    id: 36,
    title: "Pine Nuts",
    description: "Delicious pine nuts for salads and recipes.",
    price: 900,
    images: [
      "https://images.pexels.com/photos/1211559/pexels-photo-1211559.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "https://images.pexels.com/photos/1211558/pexels-photo-1211558.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
    ],
    category: "Nuts & Seeds",
  ),
  CardProduct(
    id: 37,
    title: "Strawberries",
    description: "Sweet and juicy strawberries.",
    price: 400,
    images: [
      "https://images.pexels.com/photos/1211559/pexels-photo-1211559.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "https://images.pexels.com/photos/1211558/pexels-photo-1211558.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
    ],
    category: "Fruits & Berries",
  ),
  CardProduct(
    id: 38,
    title: "Beetroot",
    description: "Nutrient-rich beetroot for salads and juicing.",
    price: 200,
    images: [
      "https://images.pexels.com/photos/1211559/pexels-photo-1211559.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "https://images.pexels.com/photos/1211558/pexels-photo-1211558.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
    ],
    category: "Vegetables",
  ),
  CardProduct(
    id: 39,
    title: "Green Beans",
    description: "Fresh green beans, perfect for stir-fries.",
    price: 250,
    images: [
      "https://images.pexels.com/photos/1211559/pexels-photo-1211559.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "https://images.pexels.com/photos/1211558/pexels-photo-1211558.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
    ],
    category: "Vegetables",
  ),
  CardProduct(
    id: 40,
    title: "Avocado",
    description: "Creamy and nutritious avocados.",
    price: 300,
    images: [
      "https://images.pexels.com/photos/1211559/pexels-photo-1211559.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "https://images.pexels.com/photos/1211558/pexels-photo-1211558.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
    ],
    category: "Fruits & Berries",
  ),
];
