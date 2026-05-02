import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductsProvider with ChangeNotifier {
  List<Product> _products = [
    Product(
      id: '1',
      name: 'Manzanas',
      description: 'Manzanas rojas frescas',
      price: 8.99,
      category: 'Frutas',
      imageUrl: 'https://images.unsplash.com/photo-1568702846914-96b305d2aaeb',
      stock: 50,
      isAvailable: true,
    ),
    Product(
      id: '2',
      name: 'Zanahorias',
      description: 'Zanahorias orgánicas',
      price: 6.50,
      category: 'Verduras',
      imageUrl: 'https://images.unsplash.com/photo-1592924357228-91a4daadc4e5',
      stock: 30,
      isAvailable: true,
    ),
    Product(
      id: '3',
      name: 'Aceite de Oliva',
      description: 'Aceite extra virgen',
      price: 25.90,
      category: 'Aceites',
      imageUrl: 'https://images.unsplash.com/photo-1536935338788-846bb9981813',
      stock: 20,
      isAvailable: true,
    ),
    Product(
      id: '4',
      name: 'Queso Fresco',
      description: 'Queso fresco artesanal',
      price: 12.75,
      category: 'Lácteos',
      imageUrl: 'https://images.unsplash.com/photo-1486297678160-ebd5e0d430d8',
      stock: 15,
      isAvailable: true,
    ),
    Product(
      id: '5',
      name: 'Arroz',
      description: 'Arroz extra blanco 1kg',
      price: 4.50,
      category: 'Granos',
      imageUrl: 'https://images.unsplash.com/photo-1586201375761-83865001e31c',
      stock: 100,
      isAvailable: true,
    ),
    Product(
      id: '6',
      name: 'Frijoles',
      description: 'Frijoles negros 1kg',
      price: 7.80,
      category: 'Granos',
      imageUrl: 'https://images.unsplash.com/photo-1546833999-b9f581a1996f',
      stock: 60,
      isAvailable: true,
    ),
  ];

  List<Product> get products {
    return [..._products];
  }

  List<Product> get availableProducts {
    return _products.where((prod) => prod.isAvailable).toList();
  }

  List<String> get categories {
    return _products.map((prod) => prod.category).toSet().toList();
  }

  List<Product> getProductsByCategory(String category) {
    return _products.where((prod) => prod.category == category).toList();
  }

  Product findById(String id) {
    return _products.firstWhere((prod) => prod.id == id);
  }

  void addProduct(Product product) {
    _products.add(product);
    notifyListeners();
  }

  void updateProduct(String id, Product newProduct) {
    final index = _products.indexWhere((prod) => prod.id == id);
    if (index >= 0) {
      _products[index] = newProduct;
      notifyListeners();
    }
  }

  void deleteProduct(String id) {
    _products.removeWhere((prod) => prod.id == id);
    notifyListeners();
  }

  void toggleAvailability(String id) {
    final index = _products.indexWhere((prod) => prod.id == id);
    if (index >= 0) {
      _products[index] = _products[index].copyWith(
        isAvailable: !_products[index].isAvailable,
      );
      notifyListeners();
    }
  }
}