// ─────────────────────────────────────────────────────────────
//  MODELS  –  tüm veri modelleri tek dosyada
// ─────────────────────────────────────────────────────────────

class ProductModel {
  final String id;
  final String name;
  final String brand;
  final String category;
  final double price;
  final double? originalPrice;
  final double rating;
  final int reviewCount;
  final int stock;
  final String imageUrl;
  final List<String> images;
  final List<String> colors;
  final List<String> sizes;
  final String description;
  final bool isFavorite;
  final bool isFeatured;
  final bool isFlashSale;

  const ProductModel({
    required this.id,
    required this.name,
    required this.brand,
    required this.category,
    required this.price,
    this.originalPrice,
    this.rating = 0,
    this.reviewCount = 0,
    this.stock = 10,
    required this.imageUrl,
    this.images = const [],
    this.colors = const [],
    this.sizes = const [],
    this.description = '',
    this.isFavorite = false,
    this.isFeatured = false,
    this.isFlashSale = false,
  });

  double get discountPercent {
    if (originalPrice == null || originalPrice! <= price) return 0;
    return ((originalPrice! - price) / originalPrice! * 100).roundToDouble();
  }

  bool get hasDiscount => discountPercent > 0;
  bool get inStock => stock > 0;

  ProductModel copyWith({
    String? id,
    String? name,
    String? brand,
    String? category,
    double? price,
    double? originalPrice,
    double? rating,
    int? reviewCount,
    int? stock,
    String? imageUrl,
    List<String>? images,
    List<String>? colors,
    List<String>? sizes,
    String? description,
    bool? isFavorite,
    bool? isFeatured,
    bool? isFlashSale,
  }) {
    return ProductModel(
      id:            id            ?? this.id,
      name:          name          ?? this.name,
      brand:         brand         ?? this.brand,
      category:      category      ?? this.category,
      price:         price         ?? this.price,
      originalPrice: originalPrice ?? this.originalPrice,
      rating:        rating        ?? this.rating,
      reviewCount:   reviewCount   ?? this.reviewCount,
      stock:         stock         ?? this.stock,
      imageUrl:      imageUrl      ?? this.imageUrl,
      images:        images        ?? this.images,
      colors:        colors        ?? this.colors,
      sizes:         sizes         ?? this.sizes,
      description:   description   ?? this.description,
      isFavorite:    isFavorite    ?? this.isFavorite,
      isFeatured:    isFeatured    ?? this.isFeatured,
      isFlashSale:   isFlashSale   ?? this.isFlashSale,
    );
  }
}

// ── Sepet Öğesi ───────────────────────────────────────────────
class CartItem {
  final ProductModel product;
  final int quantity;          // artık final
  final String? selectedColor;
  final String? selectedSize;

  const CartItem({
    required this.product,
    this.quantity = 1,
    this.selectedColor,
    this.selectedSize,
  });

  double get total => product.price * quantity;

  CartItem copyWith({
    ProductModel? product,
    int? quantity,
    String? selectedColor,
    String? selectedSize,
  }) {
    return CartItem(
      product:       product       ?? this.product,
      quantity:      quantity      ?? this.quantity,
      selectedColor: selectedColor ?? this.selectedColor,
      selectedSize:  selectedSize  ?? this.selectedSize,
    );
  }
}

// ── Kategori Modeli ───────────────────────────────────────────
class CategoryModel {
  final String id;
  final String name;
  final String icon;
  final int productCount;

  const CategoryModel({
    required this.id,
    required this.name,
    required this.icon,
    this.productCount = 0,
  });
}

// ── Banner Modeli ─────────────────────────────────────────────
class BannerModel {
  final String id;
  final String title;
  final String subtitle;
  final String gradientStart;
  final String gradientEnd;
  final String badge;

  const BannerModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.gradientStart,
    required this.gradientEnd,
    required this.badge,
  });
}

// ── Adres Modeli ──────────────────────────────────────────────
class AddressModel {
  final String id;
  final String title;
  final String fullName;
  final String phone;
  final String address;
  final String city;
  final String district;
  final bool isDefault;

  const AddressModel({
    required this.id,
    required this.title,
    required this.fullName,
    required this.phone,
    required this.address,
    required this.city,
    required this.district,
    this.isDefault = false,
  });

  String get fullAddress => '$address, $district / $city';
}

// ── Sipariş Modeli ────────────────────────────────────────────
class OrderModel {
  final String id;
  final List<CartItem> items;
  final double total;
  final OrderStatus status;
  final DateTime date;
  final AddressModel address;
  final String shippingMethod;
  final String? trackingNumber;

  const OrderModel({
    required this.id,
    required this.items,
    required this.total,
    required this.status,
    required this.date,
    required this.address,
    required this.shippingMethod,
    this.trackingNumber,
  });

  int get itemCount => items.fold(0, (sum, i) => sum + i.quantity);
}

enum OrderStatus { pending, confirmed, shipped, delivered, cancelled }

extension OrderStatusExt on OrderStatus {
  // TODO: AppLocalizations'a taşı — örn: AppLocalizations.of(context)!.orderStatusPending
  String get label {
    switch (this) {
      case OrderStatus.pending:   return 'Onay Bekliyor';
      case OrderStatus.confirmed: return 'Onaylandı';
      case OrderStatus.shipped:   return 'Kargoya Verildi';
      case OrderStatus.delivered: return 'Teslim Edildi';
      case OrderStatus.cancelled: return 'İptal Edildi';
    }
  }
}

// ── Yorum Modeli ──────────────────────────────────────────────
class ReviewModel {
  final String id;
  final String userName;
  final double rating;
  final String comment;
  final DateTime date;

  const ReviewModel({
    required this.id,
    required this.userName,
    required this.rating,
    required this.comment,
    required this.date,
  });
}