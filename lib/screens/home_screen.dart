import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../providers/orders_provider.dart';
import '../widgets/product_grid.dart';
import '../widgets/order_summary_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final ordersProvider = Provider.of<OrdersProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Abarrotes Del Valle'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
            tooltip: 'Carrito',
          ),
          IconButton(
            icon: const Icon(Icons.receipt),
            onPressed: () {
              Navigator.pushNamed(context, '/orders');
            },
            tooltip: 'Pedidos',
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Bienvenida
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '¡Bienvenido!',
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Realiza tus pedidos de abarrotes de forma rápida y sencilla',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Resumen rápido
              Row(
                children: [
                  Expanded(
                    child: OrderSummaryCard(
                      title: 'Carrito',
                      value: '${cartProvider.totalQuantity} items',
                      icon: Icons.shopping_cart,
                      color: Colors.green,
                      onTap: () {
                        Navigator.pushNamed(context, '/cart');
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: OrderSummaryCard(
                      title: 'Pedidos',
                      value: '${ordersProvider.pendingOrders.length} pendientes',
                      icon: Icons.pending_actions,
                      color: Colors.orange,
                      onTap: () {
                        Navigator.pushNamed(context, '/orders');
                      },
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Productos destacados
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Productos Destacados',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/products');
                    },
                    child: const Text('Ver todos'),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              // Grid de productos destacados (solo 4)
              const ProductGrid(limit: 4),

              const SizedBox(height: 20),

              // Acciones rápidas
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Acciones Rápidas',
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      const SizedBox(height: 16),
                      GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        childAspectRatio: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        children: [
                          _buildActionButton(
                            context,
                            'Nuevo Pedido',
                            Icons.add_shopping_cart,
                            Colors.green,
                            () {
                              Navigator.pushNamed(context, '/products');
                            },
                          ),
                          _buildActionButton(
                            context,
                            'Ver Pedidos',
                            Icons.list_alt,
                            Colors.blue,
                            () {
                              Navigator.pushNamed(context, '/orders');
                            },
                          ),
                          _buildActionButton(
                            context,
                            'Administrar',
                            Icons.admin_panel_settings,
                            Colors.purple,
                            () {
                              Navigator.pushNamed(context, '/admin');
                            },
                          ),
                          _buildActionButton(
                            context,
                            'Contactar',
                            Icons.phone,
                            Colors.orange,
                            () {
                              // Aquí se podría implementar llamada telefónica
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Llamando a la tienda...'),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton(
    BuildContext context,
    String text,
    IconData icon,
    Color color,
    VoidCallback onPressed,
  ) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 20),
      label: Text(text),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}