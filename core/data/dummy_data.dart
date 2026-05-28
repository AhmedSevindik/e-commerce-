import 'package:e_commerce_app_template/core/models/models.dart';

// ─────────────────────────────────────────────────────────────
//  DUMMY DATA  –  Firebase-ready yapı, gerçekten JSON'dan çeker gibi
// ─────────────────────────────────────────────────────────────

class DummyData {
  DummyData._();

  // ── Kategoriler ───────────────────────────────────────────
  static const List<CategoryModel> categories = [
    CategoryModel(id: 'all',         name: 'Tümü',        icon: '🛍️',  productCount: 120),
    CategoryModel(id: 'electronics', name: 'Elektronik',  icon: '📱',  productCount: 34),
    CategoryModel(id: 'fashion',     name: 'Moda',        icon: '👗',  productCount: 52),
    CategoryModel(id: 'home',        name: 'Ev & Yaşam',  icon: '🏠',  productCount: 28),
    CategoryModel(id: 'sports',      name: 'Spor',        icon: '⚽',  productCount: 19),
    CategoryModel(id: 'beauty',      name: 'Güzellik',    icon: '💄',  productCount: 41),
    CategoryModel(id: 'books',       name: 'Kitap',       icon: '📚',  productCount: 67),
    CategoryModel(id: 'toys',        name: 'Oyuncak',     icon: '🧸',  productCount: 15),
  ];

  // ── Banner'lar ────────────────────────────────────────────
  static const List<BannerModel> banners = [
    BannerModel(
      id: 'b1',
      title: 'Yaz Kampanyası',
      subtitle: '%40\'a varan indirimler',
      gradientStart: '#E8480C',
      gradientEnd: '#F5A623',
      badge: 'BUGÜN SON GÜN',
    ),
    BannerModel(
      id: 'b2',
      title: 'Yeni Sezon',
      subtitle: 'En yeni trendler burada',
      gradientStart: '#6366F1',
      gradientEnd: '#8B5CF6',
      badge: 'YENİ ÜRÜNLER',
    ),
    BannerModel(
      id: 'b3',
      title: 'Ücretsiz Kargo',
      subtitle: '500₺ üzeri tüm siparişlerde',
      gradientStart: '#16A34A',
      gradientEnd: '#059669',
      badge: 'SINIRLI SÜRE',
    ),
  ];

  // ── Ürünler (25 adet) ─────────────────────────────────────
  static final List<ProductModel> products = [

    // ── Elektronik ────────────────────────────────────────
    const ProductModel(
      id: 'p1',
      name: 'iPhone 15 Pro Max',
      brand: 'Apple',
      category: 'electronics',
      price: 54999,
      originalPrice: 62999,
      rating: 4.9,
      reviewCount: 2341,
      stock: 8,
      imageUrl: 'https://images.unsplash.com/photo-1695048133142-1a20484d2569?w=600',
      colors: ['#1C1C1E', '#F5F5F0', '#4E3629', '#4B4F54'],
      description: 'Titanium kasası, A17 Pro çipi ve 48 MP ProRAW kamerası ile '
          'en güçlü iPhone. USB-C bağlantı, Action Button ve Pro sinema modu.',
      isFeatured: true,
    ),

    const ProductModel(
      id: 'p2',
      name: 'Samsung Galaxy S24 Ultra',
      brand: 'Samsung',
      category: 'electronics',
      price: 47999,
      originalPrice: 54999,
      rating: 4.8,
      reviewCount: 1876,
      stock: 12,
      imageUrl: 'https://images.unsplash.com/photo-1707757646981-0a8ad35e9099?w=600',
      colors: ['#1B1B1B', '#F2ECE3', '#5E4D9A', '#3D7D6D'],
      description: '200 MP kamera, dahili S Pen ve 5000 mAh batarya. '
          'Galaxy AI özellikleriyle üretkenliğinizi bir üst seviyeye taşıyın.',
      isFeatured: true,
    ),

    const ProductModel(
      id: 'p3',
      name: 'MacBook Air M3',
      brand: 'Apple',
      category: 'electronics',
      price: 42999,
      originalPrice: 47999,
      rating: 4.9,
      reviewCount: 987,
      stock: 5,
      imageUrl: 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=600',
      colors: ['#C0C5CE', '#E8D5B8', '#2D2D2D'],
      description: 'M3 çipiyle 18 saate kadar pil ömrü, Liquid Retina ekran ve '
          'fan gerektirmeyen sessiz tasarım. Taşınabilirlikte yeni standart.',
      isFeatured: true,
    ),

    const ProductModel(
      id: 'p4',
      name: 'Sony WH-1000XM5',
      brand: 'Sony',
      category: 'electronics',
      price: 8999,
      originalPrice: 10999,
      rating: 4.8,
      reviewCount: 3204,
      stock: 20,
      imageUrl: 'https://images.unsplash.com/photo-1546435770-a3e426bf472b?w=600',
      colors: ['#1A1A1A', '#D4C5B0'],
      description: 'Sektörün en iyi aktif gürültü önleme teknolojisi. '
          '30 saate kadar pil, çoklu cihaz bağlantısı ve kristal netliğinde ses.',
      isFeatured: true,
    ),

    const ProductModel(
      id: 'p5',
      name: 'iPad Pro 13" M4',
      brand: 'Apple',
      category: 'electronics',
      price: 38999,
      originalPrice: 44999,
      rating: 4.9,
      reviewCount: 654,
      stock: 7,
      imageUrl: 'https://images.unsplash.com/photo-1544244015-0df4b3ffc6b0?w=600',
      colors: ['#C0C5CE', '#1A1A1A'],
      description: 'Ultra İnce OLED tandem ekran, M4 çip ve Apple Pencil Pro uyumluluğu. '
          'Profesyonel yaratıcılık için tasarlandı.',
      isFeatured: true,
    ),

    const ProductModel(
      id: 'p6',
      name: 'DJI Mini 4 Pro',
      brand: 'DJI',
      category: 'electronics',
      price: 23999,
      originalPrice: 27999,
      rating: 4.7,
      reviewCount: 432,
      stock: 6,
      imageUrl: 'https://images.unsplash.com/photo-1508614589041-895b88991e3e?w=600',
      colors: ['#2C2C2C'],
      description: '4K/60fps video, 20km iletim mesafesi ve 34 dakika uçuş süresi. '
          '249g hafif gövdesiyle kayıt gerektirmeyen drone.',
      isFlashSale: true,
    ),

    const ProductModel(
      id: 'p7',
      name: 'Google Pixel 8 Pro',
      brand: 'Google',
      category: 'electronics',
      price: 31999,
      originalPrice: 35999,
      rating: 4.7,
      reviewCount: 891,
      stock: 9,
      imageUrl: 'https://images.unsplash.com/photo-1598327105666-5b89351aff97?w=600',
      colors: ['#1E3A5F', '#F0F4F0', '#6D3B2E'],
      description: 'Tensor G3 çipi, 50 MP telefoto ve Magic Eraser özelliği. '
          'Android\'in en saf ve güncel hali, 7 yıl güncelleme garantisi.',
      isFlashSale: true,
    ),

    const ProductModel(
      id: 'p8',
      name: 'Dyson V15 Detect',
      brand: 'Dyson',
      category: 'home',
      price: 18499,
      originalPrice: 21999,
      rating: 4.8,
      reviewCount: 1543,
      stock: 14,
      imageUrl: 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=600',
      colors: ['#FFD700', '#C0C5CE'],
      description: 'Lazer toz tespiti, akustik boyutlandırma sensörü ve '
          '60 dakika pil ömrü. Evinizin en derin temizliği için.',
      isFeatured: true,
    ),

    // ── Moda ─────────────────────────────────────────────
    const ProductModel(
      id: 'p9',
      name: 'Levi\'s 501 Original',
      brand: 'Levi\'s',
      category: 'fashion',
      price: 1299,
      originalPrice: 1799,
      rating: 4.6,
      reviewCount: 5432,
      stock: 45,
      imageUrl: 'https://images.unsplash.com/photo-1542272604-787c3835535d?w=600',
      colors: ['#1B2B4B', '#7B6F5A', '#1A1A1A'],
      sizes: ['28', '29', '30', '31', '32', '33', '34', '36'],
      description: 'İkonik 501 kesimi, sade dikişler ve premium denim. '
          '150 yılı aşkın bir mirasın sürdüğü klasik. Makine yıkamaya uygundur.',
      isFlashSale: true,
    ),

    const ProductModel(
      id: 'p10',
      name: 'Zara Oversize Blazer',
      brand: 'Zara',
      category: 'fashion',
      price: 1199,
      originalPrice: 1699,
      rating: 4.5,
      reviewCount: 876,
      stock: 22,
      imageUrl: 'https://images.unsplash.com/photo-1594938298603-c8148c4dae35?w=600',
      colors: ['#2C2C2C', '#E8DDD0', '#8B6F47'],
      sizes: ['XS', 'S', 'M', 'L', 'XL'],
      description: 'Modern oversize kesim, yapılandırılmış omuzlar ve '
          'yan cepli tasarım. Hem günlük hem ofis kombinleri için ideal.',
      isFeatured: true,
    ),

    const ProductModel(
      id: 'p11',
      name: 'Nike Air Max 270',
      brand: 'Nike',
      category: 'sports',
      price: 2899,
      originalPrice: 3799,
      rating: 4.7,
      reviewCount: 2109,
      stock: 18,
      imageUrl: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=600',
      colors: ['#FFFFFF', '#1A1A1A', '#E85D04'],
      sizes: ['39', '40', '41', '42', '43', '44', '45'],
      description: 'Tarihin en büyük Air ünitesi ile maksimum konfor. '
          'Nefes alabilen mesh üst, dayanıklı taban ve ikonik Air Max estetiği.',
      isFeatured: true,
    ),

    const ProductModel(
      id: 'p12',
      name: 'Adidas Ultraboost 23',
      brand: 'Adidas',
      category: 'sports',
      price: 3299,
      originalPrice: 4299,
      rating: 4.8,
      reviewCount: 1654,
      stock: 11,
      imageUrl: 'https://images.unsplash.com/photo-1608231387042-66d1773070a5?w=600',
      colors: ['#FFFFFF', '#1A1A1A', '#0057A0'],
      sizes: ['39', '40', '41', '42', '43', '44'],
      description: 'Boost ara taban teknolojisi ile her adımda enerji geri dönüşümü. '
          'Parsa yüzey kaplı Primeknit+ üst ve Continental taban.',
      isFlashSale: true,
    ),

    // ── Güzellik ─────────────────────────────────────────
    const ProductModel(
      id: 'p13',
      name: 'Charlotte Tilbury Pillow Talk',
      brand: 'Charlotte Tilbury',
      category: 'beauty',
      price: 459,
      originalPrice: 599,
      rating: 4.9,
      reviewCount: 8721,
      stock: 60,
      imageUrl: 'https://images.unsplash.com/photo-1599056407049-d0f4b36e7a7b?w=600',
      colors: ['#D4869A'],
      description: 'Dünyanın en çok aranan rujunun sırrı: nötr pembe rengi '
          'her ten tonuna uyum sağlar. Nemlendirici formül ve nefes kesen finish.',
      isFlashSale: true,
    ),

    const ProductModel(
      id: 'p14',
      name: 'Dyson Airwrap Multi-Styler',
      brand: 'Dyson',
      category: 'beauty',
      price: 14999,
      originalPrice: 17499,
      rating: 4.8,
      reviewCount: 3241,
      stock: 8,
      imageUrl: 'https://images.unsplash.com/photo-1522338242992-e1a54906a8da?w=600',
      colors: ['#C0A080', '#1A1A1A'],
      description: 'Tek cihazda şekillendirme, kıvırma ve düzleştirme. '
          'Aşırı ısı kullanmadan Coanda etkisiyle profesyonel sonuçlar.',
      isFeatured: true,
    ),

    const ProductModel(
      id: 'p15',
      name: 'La Mer Creme de la Mer',
      brand: 'La Mer',
      category: 'beauty',
      price: 4299,
      originalPrice: 4999,
      rating: 4.7,
      reviewCount: 1876,
      stock: 25,
      imageUrl: 'https://images.unsplash.com/photo-1556228578-567ba43e3b8d?w=600',
      description: 'Efsanevi Miracle Broth formülü ile deri yenilenmesi. '
          '60 ml. Deniz kenarı terapisi ile ilham alan ikonik nemlendirici krem.',
    ),

    // ── Ev & Yaşam ────────────────────────────────────────
    const ProductModel(
      id: 'p16',
      name: 'Instant Pot Duo 7-in-1',
      brand: 'Instant Pot',
      category: 'home',
      price: 1799,
      originalPrice: 2299,
      rating: 4.7,
      reviewCount: 6532,
      stock: 30,
      imageUrl: 'https://images.unsplash.com/photo-1556909114-f6e7ad7d3136?w=600',
      colors: ['#2C2C2C', '#C0C5CE'],
      description: '7 farklı pişirme yöntemi tek cihazda: basınçlı tencere, '
          'yavaş pişirici, pilav makinesi, buharlı pişirici, sauté, yoğurt yapıcı.',
      isFlashSale: true,
    ),

    const ProductModel(
      id: 'p17',
      name: 'Philips Hue Starter Kit',
      brand: 'Philips',
      category: 'home',
      price: 2499,
      originalPrice: 3199,
      rating: 4.6,
      reviewCount: 2143,
      stock: 17,
      imageUrl: 'https://images.unsplash.com/photo-1558618047-f4aa6ffddb62?w=600',
      colors: ['#FFFFFF'],
      description: '4 adet akıllı ampul + Bridge hub. 16 milyon renk seçeneği, '
          'sesli asistan uyumlu ve enerji tasarruflu LED teknolojisi.',
      isFeatured: true,
    ),

    const ProductModel(
      id: 'p18',
      name: 'Nespresso Vertuo Pop',
      brand: 'Nespresso',
      category: 'home',
      price: 2799,
      originalPrice: 3499,
      rating: 4.6,
      reviewCount: 1543,
      stock: 24,
      imageUrl: 'https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?w=600',
      colors: ['#1A1A1A', '#FF6B35', '#4A90D9', '#FFFFFF'],
      description: 'Centrifusion teknolojisi ile kapsülü otomatik tanıyan '
          'Barista kalitesinde kahve makinesi. 35 saniyelik ısınma süresi.',
      isFlashSale: true,
    ),

    // ── Spor ─────────────────────────────────────────────
    const ProductModel(
      id: 'p19',
      name: 'Garmin Fenix 7X Solar',
      brand: 'Garmin',
      category: 'sports',
      price: 18999,
      originalPrice: 22999,
      rating: 4.8,
      reviewCount: 876,
      stock: 6,
      imageUrl: 'https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=600',
      colors: ['#1A1A1A', '#C0A080'],
      description: 'Güneş enerjisiyle şarj, 37 gün pil ömrü, topografik haritalar '
          've 800\'den fazla aktivite profili. Extreme sporcular için tasarlandı.',
      isFeatured: true,
    ),

    const ProductModel(
      id: 'p20',
      name: 'Theragun Pro Gen 5',
      brand: 'Therabody',
      category: 'sports',
      price: 12999,
      originalPrice: 14999,
      rating: 4.8,
      reviewCount: 1231,
      stock: 9,
      imageUrl: 'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=600',
      colors: ['#1A1A1A', '#FFFFFF'],
      description: 'Klinik düzeyde perkusyon terapisi cihazı. '
          'Akıllı kuvvet kontrolü, 5 hız ayarı ve Bluetooth uygulama entegrasyonu.',
      isFlashSale: true,
    ),

    const ProductModel(
      id: 'p21',
      name: 'Lululemon Align Legging',
      brand: 'Lululemon',
      category: 'sports',
      price: 1899,
      originalPrice: 2399,
      rating: 4.9,
      reviewCount: 4321,
      stock: 35,
      imageUrl: 'https://images.unsplash.com/photo-1506629082955-511b1aa562c8?w=600',
      colors: ['#1A1A1A', '#4B0082', '#355E3B', '#8B2FC9'],
      sizes: ['XS', 'S', 'M', 'L', 'XL'],
      description: 'Nulu kumaşıyla tereyağı gibi yumuşak his. '
          '28" uzunluk, yüksek bel tasarımı ve tüm yoğunluktaki antrenmanlar için.',
      isFlashSale: true,
    ),

    // ── Kitap ────────────────────────────────────────────
    const ProductModel(
      id: 'p22',
      name: 'Atomic Habits',
      brand: 'James Clear',
      category: 'books',
      price: 189,
      originalPrice: 249,
      rating: 4.9,
      reviewCount: 15432,
      stock: 100,
      imageUrl: 'https://images.unsplash.com/photo-1544716278-ca5e3f4abd8c?w=600',
      description: 'Küçük alışkanlıkların büyük farklar yarattığını kanıtlayan '
          'uluslararası bestseller. 4 aşamalı sistem ile istediğiniz alışkanlıkları edinin.',
    ),

    const ProductModel(
      id: 'p23',
      name: 'Kindle Paperwhite 16GB',
      brand: 'Amazon',
      category: 'books',
      price: 3499,
      originalPrice: 4299,
      rating: 4.8,
      reviewCount: 7654,
      stock: 40,
      imageUrl: 'https://images.unsplash.com/photo-1549122728-f519709caa9c?w=600',
      colors: ['#1A1A1A', '#F5F5F0'],
      description: '300 ppi gözü yormayan ekran, su geçirmez tasarım ve '
          '12 haftalık pil ömrü. Milyonlarca kitaba tek cihazdan erişin.',
      isFeatured: true,
    ),

    // ── Oyuncak ──────────────────────────────────────────
    const ProductModel(
      id: 'p24',
      name: 'LEGO Technic Bugatti',
      brand: 'LEGO',
      category: 'toys',
      price: 5999,
      originalPrice: 7499,
      rating: 4.9,
      reviewCount: 2341,
      stock: 12,
      imageUrl: 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=600',
      colors: ['#0057A0', '#F5F5F0'],
      description: '3\'599 parça, çalışan W16 motor simülasyonu ve tam fonksiyonel '
          'şanzıman. 18+ yaş grubu için mühendislik şaheseri.',
      isFeatured: true,
    ),

    const ProductModel(
      id: 'p25',
      name: 'Nintendo Switch OLED',
      brand: 'Nintendo',
      category: 'toys',
      price: 9999,
      originalPrice: 11999,
      rating: 4.8,
      reviewCount: 5678,
      stock: 15,
      imageUrl: 'https://images.unsplash.com/photo-1578662996442-48f60103fc96?w=600',
      colors: ['#FFFFFF', '#1A1A1A'],
      description: '7 inç OLED ekran, 64 GB dahili depolama ve geliştirilmiş hoparlör. '
          'Evde ve dışarıda kesintisiz oyun deneyimi.',
      isFeatured: true,
    ),
  ];

  // ── Yardımcı getter'lar ────────────────────────────────────

  static List<ProductModel> get featuredProducts =>
      products.where((p) => p.isFeatured).toList();

  static List<ProductModel> get flashSaleProducts =>
      products.where((p) => p.isFlashSale).toList();

  static List<ProductModel> byCategory(String categoryId) {
    if (categoryId == 'all') return products;
    return products.where((p) => p.category == categoryId).toList();
  }

  // ── Adresler ──────────────────────────────────────────────
  static const List<AddressModel> addresses = [
    AddressModel(
      id: 'addr-1',
      title: 'Ev',
      fullName: 'Ahmet Yılmaz',
      phone: '+90 532 123 45 67',
      address: 'Bağcılar Mah. Gül Sokak No:12 D:4',
      city: 'İstanbul',
      district: 'Kadıköy',
      isDefault: true,
    ),
    AddressModel(
      id: 'addr-2',
      title: 'İş',
      fullName: 'Ahmet Yılmaz',
      phone: '+90 532 123 45 67',
      address: 'Levent Plaza Kat:8 No:802',
      city: 'İstanbul',
      district: 'Beşiktaş',
    ),
  ];
}