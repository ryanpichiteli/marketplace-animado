// providers/product_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marketplace_animado/models/product_model.dart';

final productsProvider = Provider<List<Product>>((ref) {
  return [
    Product(
      id: '1',
      name: 'Smartphone Pro',
      price: 1299.99,
      imageUrl: 'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?ixlib=rb-4.0.3',
      category: 'Eletrônicos',
      description: 'Último modelo com câmera avançada e bateria de longa duração.',
    ),
    Product(
      id: '2',
      name: 'Fones Bluetooth',
      price: 199.99,
      imageUrl: 'https://images.unsplash.com/photo-1583394838336-acd977736f90?ixlib=rb-4.0.3',
      category: 'Acessórios',
      description: 'Som premium com cancelamento de ruído.',
    ),
    Product(
      id: '3',
      name: 'Smartwatch Ultra',
      price: 399.99,
      imageUrl: 'https://images.unsplash.com/photo-1544117519-31a4b719223d?ixlib=rb-4.0.3',
      category: 'Eletrônicos',
      description: 'Monitoramento de saúde e notificações inteligentes.',
    ),
    Product(
      id: '4',
      name: 'Câmera DSLR',
      price: 899.99,
      imageUrl: 'https://images.unsplash.com/photo-1516035069371-29a1b244cc32?ixlib=rb-4.0.3',
      category: 'Fotografia',
      description: 'Fotos profissionais com 4K e lentes intercambiáveis.',
    ),
    Product(
      id: '5',
      name: 'Tablet Pro',
      price: 799.99,
      imageUrl: 'https://images.unsplash.com/photo-1542751110-97427bbecf20?ixlib=rb-4.0.3',
      category: 'Eletrônicos',
      description: 'Tela retina de 12.9 polegadas para trabalho e lazer.',
    ),
    Product(
      id: '6',
      name: 'Caixa de Som',
      price: 149.99,
      imageUrl: 'https://images.unsplash.com/photo-1608043152269-423dbba4e7e1?ixlib=rb-4.0.3',
      category: 'Áudio',
      description: 'Som potente e resistente à água.',
    ),
  ];
});

final productProvider = Provider.family<Product?, String>((ref, id) {
  final products = ref.watch(productsProvider);
  try {
    return products.firstWhere((product) => product.id == id);
  } catch (e) {
    return null;
  }
});