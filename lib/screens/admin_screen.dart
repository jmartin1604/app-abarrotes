import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/orders_provider.dart';
import '../providers/products_provider.dart';
import '../widgets/order_card.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    final ordersProvider = Provider.of<OrdersProvider>(context);
    final productsProvider = Provider.of<ProductsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Panel de Administración'),
      ),
      body: Column(
        children: [
          // Tabs de navegación
          Container(
            color: Colors.grey[50],
            child: Row(
              children: [
                _buildTabButton('Pedidos', 0),
                _buildTabButton('Productos', 1),
                _buildTabButton('Estadísticas', 2),
              ],
            ),
          ),

          const Divider(height: 1),

          // Contenido según tab seleccionado
          Expanded(
            child: IndexedStack(
              index: _selectedTab,
              children: [
                // Tab 0: Pedidos
                _buildOrdersTab(ordersProvider),

                // Tab 1: Productos
                _buildProductsTab(productsProvider),

                // Tab 2: Estadísticas
                _buildStatisticsTab(ordersProvider, productsProvider),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabButton(String label, int index) {
    final isSelected = _selectedTab == index;

    return Expanded(
      child: TextButton(
        onPressed: () {
          setState(() {
            _selectedTab = index;
          });
        },
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          backgroundColor: isSelected ? Colors.green.withOpacity(0.1) : null,
          foregroundColor: isSelected ? Colors.green : Colors.grey,
        ),
        child: Text(
          label,
          style: TextStyle(
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget _buildOrdersTab(OrdersProvider ordersProvider) {
    final pendingOrders = ordersProvider.pendingOrders;
    final preparingOrders = ordersProvider.preparingOrders;
    final readyOrders = ordersProvider.readyOrders;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Pedidos pendientes
        if (pendingOrders.isNotEmpty) ...[
          const Text(
            'Pedidos Pendientes',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          ...pendingOrders.map((order) {
            return Column(
              children: [
                OrderCard(order: order),
                _buildOrderActions(order),
                const SizedBox(height: 16),
              ],
            );
          }).toList(),
          const Divider(),
        ],

        // Pedidos en preparación
        if (preparingOrders.isNotEmpty) ...[
          const Text(
            'En Preparación',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          ...preparingOrders.map((order) {
            return Column(
              children: [
                OrderCard(order: order),
                _buildOrderActions(order),
                const SizedBox(height: 16),
              ],
            );
          }).toList(),
          const Divider(),
        ],

        // Pedidos listos
        if (readyOrders.isNotEmpty) ...[
          const Text(
            'Listos para Recoger',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          ...readyOrders.map((order) {
            return Column(
              children: [
                OrderCard(order: order),
                _buildOrderActions(order),
                const SizedBox(height: 16),
              ],
            );
          }).toList(),
        ],

        if (pendingOrders.isEmpty && preparingOrders.isEmpty && readyOrders.isEmpty)
          const Center(
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
                  'No hay pedidos pendientes',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildOrderActions(Order order) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (order.status.index < OrderStatus.ready.index)
          ElevatedButton(
            onPressed: () {
              // Actualizar estado al siguiente
              // En una app real, esto actualizaría en el backend
            },
            child: const Text('Siguiente Estado'),
          ),
        const SizedBox(width: 8),
        ElevatedButton(
          onPressed: () {
            // Marcar como completado
            // En una app real, esto actualizaría en el backend
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
          ),
          child: const Text('Completar'),
        ),
      ],
    );
  }

  Widget _buildProductsTab(ProductsProvider productsProvider) {
    final products = productsProvider.products;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Encabezado con botón agregar
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Productos',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                // Agregar nuevo producto
              },
              icon: const Icon(Icons.add),
              label: const Text('Agregar'),
            ),
          ],
        ),

        const SizedBox(height: 16),

        // Lista de productos
        ...products.map((product) {
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.shopping_basket, color: Colors.grey),
              ),
              title: Text(product.name),
              subtitle: Text('S/ ${product.price.toStringAsFixed(2)} - Stock: ${product.stock}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(
                      product.isAvailable ? Icons.check_circle : Icons.remove_circle,
                      color: product.isAvailable ? Colors.green : Colors.red,
                    ),
                    onPressed: () {
                      // Toggle disponibilidad
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.blue),
                    onPressed: () {
                      // Editar producto
                    },
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ],
    );
  }

  Widget _buildStatisticsTab(OrdersProvider ordersProvider, ProductsProvider productsProvider) {
    final ordersByStatus = ordersProvider.ordersByStatus;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Resumen general
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Text(
                  'Resumen General',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildStatItem('Total Pedidos', '${ordersProvider.totalOrdersCount}'),
                    _buildStatItem('Productos', '${productsProvider.products.length}'),
                    _buildStatItem('Ingresos', 'S/ ${ordersProvider.totalRevenue.toStringAsFixed(2)}'),
                  ],
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 20),

        // Pedidos por estado
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Pedidos por Estado',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                ...ordersByStatus.entries.map((entry) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(entry.key),
                        ),
                        Text(
                          '${entry.value}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ],
            ),
          ),
        ),

        const SizedBox(height: 20),

        // Acciones rápidas
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Acciones Rápidas',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  childAspectRatio: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: [
                    _buildAdminActionButton(
                      'Exportar Datos',
                      Icons.download,
                      Colors.blue,
                      () {},
                    ),
                    _buildAdminActionButton(
                      'Ver Reportes',
                      Icons.analytics,
                      Colors.purple,
                      () {},
                    ),
                    _buildAdminActionButton(
                      'Gestionar Usuarios',
                      Icons.people,
                      Colors.orange,
                      () {},
                    ),
                    _buildAdminActionButton(
                      'Configuración',
                      Icons.settings,
                      Colors.grey,
                      () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStatItem(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildAdminActionButton(
    String text,
    IconData icon,
    Color color,
    VoidCallback onPressed,
  ) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(text),
      style: ElevatedButton.styleFrom(
        backgroundColor: color.withOpacity(0.1),
        foregroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}