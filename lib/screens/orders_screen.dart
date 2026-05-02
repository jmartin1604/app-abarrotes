import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/orders_provider.dart';
import '../widgets/order_card.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  OrderStatus? _selectedStatus;

  @override
  Widget build(BuildContext context) {
    final ordersProvider = Provider.of<OrdersProvider>(context);
    List<Order> filteredOrders;

    if (_selectedStatus != null) {
      filteredOrders = ordersProvider.orders
          .where((order) => order.status == _selectedStatus)
          .toList();
    } else {
      filteredOrders = ordersProvider.orders;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Pedidos'),
      ),
      body: Column(
        children: [
          // Filtros por estado
          SizedBox(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              children: [
                _buildStatusFilter('Todos', null),
                const SizedBox(width: 8),
                ...OrderStatus.values.map(
                  (status) => Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: _buildStatusFilter(status.displayName, status),
                  ),
                ),
              ],
            ),
          ),

          const Divider(height: 1),

          // Estadísticas rápidas
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatCard(
                  'Total',
                  '${ordersProvider.totalOrdersCount}',
                  Icons.receipt,
                  Colors.blue,
                ),
                _buildStatCard(
                  'Pendientes',
                  '${ordersProvider.pendingOrders.length}',
                  Icons.pending,
                  Colors.orange,
                ),
                _buildStatCard(
                  'En preparación',
                  '${ordersProvider.preparingOrders.length}',
                  Icons.restaurant,
                  Colors.purple,
                ),
              ],
            ),
          ),

          // Lista de pedidos
          Expanded(
            child: filteredOrders.isEmpty
                ? const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.receipt_long,
                          size: 100,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 20),
                        Text(
                          'No hay pedidos',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: filteredOrders.length,
                    itemBuilder: (ctx, index) {
                      return OrderCard(order: filteredOrders[index]);
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusFilter(String label, OrderStatus? status) {
    final isSelected = _selectedStatus == status;

    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (selected) {
        setState(() {
          _selectedStatus = selected ? status : null;
        });
      },
      backgroundColor: status?.color.withOpacity(0.1) ?? Colors.grey[200],
      selectedColor: status?.color ?? Colors.green,
      labelStyle: TextStyle(
        color: isSelected ? Colors.white : Colors.black,
      ),
      checkmarkColor: Colors.white,
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, Color color) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: color, size: 24),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}