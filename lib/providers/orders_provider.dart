import 'package:flutter/material.dart';
import '../models/order.dart';
import '../models/cart_item.dart';

class OrdersProvider with ChangeNotifier {
  List<Order> _orders = [
    Order(
      id: '1',
      customerName: 'María González',
      customerPhone: '999888777',
      customerAddress: 'Av. Principal 123, Lima',
      items: [
        CartItem(
          productId: '1',
          productName: 'Manzanas',
          price: 8.99,
          imageUrl: 'https://images.unsplash.com/photo-1568702846914-96b305d2aaeb',
          quantity: 2,
        ),
        CartItem(
          productId: '2',
          productName: 'Zanahorias',
          price: 6.50,
          imageUrl: 'https://images.unsplash.com/photo-1592924357228-91a4daadc4e5',
          quantity: 1,
        ),
      ],
      totalAmount: 24.48,
      orderDate: DateTime.now().subtract(const Duration(days: 2)),
      status: OrderStatus.delivered,
      notes: 'Entregar antes de las 6pm',
    ),
    Order(
      id: '2',
      customerName: 'Carlos Mendoza',
      customerPhone: '999111222',
      customerAddress: 'Calle Comercio 456, Lima',
      items: [
        CartItem(
          productId: '3',
          productName: 'Aceite de Oliva',
          price: 25.90,
          imageUrl: 'https://images.unsplash.com/photo-1536935338788-846bb9981813',
          quantity: 1,
        ),
        CartItem(
          productId: '4',
          productName: 'Queso Fresco',
          price: 12.75,
          imageUrl: 'https://images.unsplash.com/photo-1486297678160-ebd5e0d430d8',
          quantity: 3,
        ),
      ],
      totalAmount: 64.15,
      orderDate: DateTime.now().subtract(const Duration(days: 1)),
      status: OrderStatus.preparing,
      notes: 'Cliente restaurante',
    ),
    Order(
      id: '3',
      customerName: 'Ana Torres',
      customerPhone: '999333444',
      customerAddress: 'Jr. Flores 789, Lima',
      items: [
        CartItem(
          productId: '5',
          productName: 'Arroz',
          price: 4.50,
          imageUrl: 'https://images.unsplash.com/photo-1586201375761-83865001e31c',
          quantity: 5,
        ),
        CartItem(
          productId: '6',
          productName: 'Frijoles',
          price: 7.80,
          imageUrl: 'https://images.unsplash.com/photo-1546833999-b9f581a1996f',
          quantity: 2,
        ),
      ],
      totalAmount: 38.10,
      orderDate: DateTime.now(),
      status: OrderStatus.pending,
    ),
  ];

  List<Order> get orders {
    return [..._orders];
  }

  List<Order> get pendingOrders {
    return _orders.where((order) => order.status == OrderStatus.pending).toList();
  }

  List<Order> get preparingOrders {
    return _orders.where((order) => order.status == OrderStatus.preparing).toList();
  }

  List<Order> get readyOrders {
    return _orders.where((order) => order.status == OrderStatus.ready).toList();
  }

  Order findById(String id) {
    return _orders.firstWhere((order) => order.id == id);
  }

  void addOrder(Order order) {
    _orders.insert(0, order);
    notifyListeners();
  }

  void updateOrderStatus(String id, OrderStatus newStatus) {
    final index = _orders.indexWhere((order) => order.id == id);
    if (index >= 0) {
      _orders[index].status = newStatus;
      notifyListeners();
    }
  }

  void deleteOrder(String id) {
    _orders.removeWhere((order) => order.id == id);
    notifyListeners();
  }

  int get totalOrdersCount {
    return _orders.length;
  }

  double get totalRevenue {
    return _orders.fold(0.0, (sum, order) => sum + order.totalAmount);
  }

  Map<String, int> get ordersByStatus {
    final Map<String, int> result = {};
    for (final order in _orders) {
      final statusName = order.status.displayName;
      result[statusName] = (result[statusName] ?? 0) + 1;
    }
    return result;
  }
}