import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// Providers
import './product.dart';

// Models
import '../models/http_exception.dart';

class Products with ChangeNotifier {
  static const baseUrl = 'https://shop-app-server-eb241.firebaseio.com';
  List<Product> _items = [];

// Left here for future testing
//    Product(
//      id: 'p1',
//      title: 'Red Shirt',
//      description: 'A red shirt - it is pretty red!',
//      price: 29.99,
//      imageUrl:
//          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
//    ),
//    Product(
//      id: 'p2',
//      title: 'Trousers',
//      description: 'A nice pair of trousers.',
//      price: 59.99,
//      imageUrl:
//          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
//    ),
//    Product(
//      id: 'p3',
//      title: 'Yellow Scarf',
//      description: 'Warm and cozy - exactly what you need for the winter.',
//      price: 19.99,
//      imageUrl:
//          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
//    ),
//    Product(
//      id: 'p4',
//      title: 'A Pan',
//      description: 'Prepare any meal you want.',
//      price: 49.99,
//      imageUrl:
//          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
//    ),
//  ];

  final String authToken;

  Products(this.authToken, this._items);

  // Make sure users of this class cannot manipulate objects in memory
  List<Product> get items {
    return new List<Product>.from(_items);
  }

  List<Product> get favoriteItems {
    return _items.where((product) => product.isFavorite).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((product) => product.id == id);
  }

  Future<void> fetchAndSetProducts() async {
    try {
      final response = await http.get("$baseUrl/products.json?auth=$authToken");
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      List<Product> fetchedProducts = [];
      extractedData.forEach((productId, prodData) {
        fetchedProducts.add(Product.fromMap(
          newId: productId,
          map: prodData,
        ));
      });
      _items = fetchedProducts;
      notifyListeners();
    } catch (error) {
      print(error);
//      throw (error);
    }
  }

  Future<void> addProduct(Product product) async {
    try {
      final response = await http.post(
        "$baseUrl/products.json?auth=$authToken",
        body: json.encode(product.toMap()),
      );
      final newProduct = product.newModifiedProduct(
        id: json.decode(response.body)['name'],
      );
      _items.insert(0, newProduct);
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }

  Future<void> updateProduct(Product product) async {
    final prodIndex = _items.indexWhere((prod) => prod.id == product.id);
    if (prodIndex >= 0) {
      await http.patch(
        "$baseUrl/products/${product.id}.json?auth=$authToken",
        body: json.encode(product.toMap()),
      );
      _items[prodIndex] = product;
      notifyListeners();
    } else {
      print('No product matching this id was found');
    }
  }

  Future<void> deleteProduct(String id) async{
    final existingProductIndex = _items.indexWhere((prod) => prod.id == id);
    var existingProduct = _items[existingProductIndex];
    _items.removeAt(existingProductIndex);
    notifyListeners();

    var errorExists = false;
    try {
      final response = await http.delete("$baseUrl/products/$id.json?auth=$authToken");
      if (response.statusCode >= 400) {
        errorExists = true;
      }
    }
    catch (error){
      print(error);
      errorExists = true;
    }

    if (errorExists) {
      _items.insert(existingProductIndex, existingProduct);
      notifyListeners();
      throw HttpException('Could not delete product.');
    }

    existingProduct = null;
  }
}
