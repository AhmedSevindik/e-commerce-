// lib/core/l10n/app_localizations.dart
//
// Basit, paket bağımlılığı olmayan localization sistemi.
// 4 dil: Türkçe (tr), İngilizce (en), Almanca (de), Arapça (ar)

import 'package:flutter/material.dart';

class AppLocalizations {
  AppLocalizations(this.locale);

  final Locale locale;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const delegate = _AppLocalizationsDelegate();

  static const supportedLocales = [
    Locale('tr'),
    Locale('en'),
    Locale('de'),
    Locale('ar'),
  ];

  static const Map<String, Map<String, String>> _strings = {
    'appName': {'tr': 'ShopApp', 'en': 'ShopApp', 'de': 'ShopApp', 'ar': 'ShopApp'},
    'appTagline': {'tr': 'Alışverişin yeni adresi', 'en': 'Your new shopping destination', 'de': 'Ihr neues Einkaufsziel', 'ar': 'وجهتك الجديدة للتسوق'},
    'login': {'tr': 'Giriş Yap', 'en': 'Sign In', 'de': 'Anmelden', 'ar': 'تسجيل الدخول'},
    'register': {'tr': 'Kayıt Ol', 'en': 'Sign Up', 'de': 'Registrieren', 'ar': 'إنشاء حساب'},
    'logout': {'tr': 'Çıkış Yap', 'en': 'Sign Out', 'de': 'Abmelden', 'ar': 'تسجيل الخروج'},
    'forgotPassword': {'tr': 'Şifremi Unuttum', 'en': 'Forgot Password', 'de': 'Passwort vergessen', 'ar': 'نسيت كلمة المرور'},
    'email': {'tr': 'E-posta', 'en': 'Email', 'de': 'E-Mail', 'ar': 'البريد الإلكتروني'},
    'password': {'tr': 'Şifre', 'en': 'Password', 'de': 'Passwort', 'ar': 'كلمة المرور'},
    'fullName': {'tr': 'Ad Soyad', 'en': 'Full Name', 'de': 'Vollständiger Name', 'ar': 'الاسم الكامل'},
    'noAccount': {'tr': 'Hesabın yok mu?', 'en': 'Don\'t have an account?', 'de': 'Kein Konto?', 'ar': 'ليس لديك حساب؟'},
    'haveAccount': {'tr': 'Zaten hesabın var mı?', 'en': 'Already have an account?', 'de': 'Bereits ein Konto?', 'ar': 'لديك حساب بالفعل؟'},
    'continueWith': {'tr': 'veya şununla devam et', 'en': 'or continue with', 'de': 'oder weiter mit', 'ar': 'أو المتابعة مع'},
    'termsOfService': {'tr': 'Kullanım Şartları', 'en': 'Terms of Service', 'de': 'Nutzungsbedingungen', 'ar': 'شروط الخدمة'},
    'privacyPolicy': {'tr': 'Gizlilik Politikası', 'en': 'Privacy Policy', 'de': 'Datenschutzrichtlinie', 'ar': 'سياسة الخصوصية'},
    'home': {'tr': 'Ana Sayfa', 'en': 'Home', 'de': 'Startseite', 'ar': 'الرئيسية'},
    'search': {'tr': 'Ara', 'en': 'Search', 'de': 'Suchen', 'ar': 'بحث'},
    'cart': {'tr': 'Sepet', 'en': 'Cart', 'de': 'Warenkorb', 'ar': 'السلة'},
    'profile': {'tr': 'Profil', 'en': 'Profile', 'de': 'Profil', 'ar': 'الملف الشخصي'},
    'settings': {'tr': 'Ayarlar', 'en': 'Settings', 'de': 'Einstellungen', 'ar': 'الإعدادات'},
    'notifications': {'tr': 'Bildirimler', 'en': 'Notifications', 'de': 'Benachrichtigungen', 'ar': 'الإشعارات'},
    'favorites': {'tr': 'Favoriler', 'en': 'Favorites', 'de': 'Favoriten', 'ar': 'المفضلة'},
    'myOrders': {'tr': 'Siparişlerim', 'en': 'My Orders', 'de': 'Meine Bestellungen', 'ar': 'طلباتي'},
    'checkout': {'tr': 'Siparişi Tamamla', 'en': 'Checkout', 'de': 'Zur Kasse', 'ar': 'إتمام الطلب'},
    'checkoutTitle': {'tr': 'Sipariş Özeti', 'en': 'Order Summary', 'de': 'Bestellübersicht', 'ar': 'ملخص الطلب'},
    'addToCart': {'tr': 'Sepete Ekle', 'en': 'Add to Cart', 'de': 'In den Warenkorb', 'ar': 'أضف إلى السلة'},
    'buyNow': {'tr': 'Hemen Satın Al', 'en': 'Buy Now', 'de': 'Jetzt kaufen', 'ar': 'اشتر الآن'},
    'loading': {'tr': 'Yükleniyor...', 'en': 'Loading...', 'de': 'Wird geladen...', 'ar': 'جار التحميل...'},
    'error': {'tr': 'Bir hata oluştu', 'en': 'An error occurred', 'de': 'Ein Fehler ist aufgetreten', 'ar': 'حدث خطأ'},
    'retry': {'tr': 'Tekrar Dene', 'en': 'Retry', 'de': 'Erneut versuchen', 'ar': 'إعادة المحاولة'},
    'cancel': {'tr': 'İptal', 'en': 'Cancel', 'de': 'Abbrechen', 'ar': 'إلغاء'},
    'confirm': {'tr': 'Onayla', 'en': 'Confirm', 'de': 'Bestätigen', 'ar': 'تأكيد'},
    'save': {'tr': 'Kaydet', 'en': 'Save', 'de': 'Speichern', 'ar': 'حفظ'},
    'delete': {'tr': 'Sil', 'en': 'Delete', 'de': 'Löschen', 'ar': 'حذف'},
    'connectionError': {'tr': 'Bağlantı hatası', 'en': 'Connection error', 'de': 'Verbindungsfehler', 'ar': 'خطأ في الاتصال'},
    'markAllRead': {'tr': 'Tümünü Okundu İşaretle', 'en': 'Mark All as Read', 'de': 'Alle als gelesen markieren', 'ar': 'تحديد الكل كمقروء'},
    'noNotifications': {'tr': 'Bildirim yok', 'en': 'No notifications', 'de': 'Keine Benachrichtigungen', 'ar': 'لا توجد إشعارات'},
    'address': {'tr': 'Adres', 'en': 'Address', 'de': 'Adresse', 'ar': 'العنوان'},
    'city': {'tr': 'Şehir', 'en': 'City', 'de': 'Stadt', 'ar': 'المدينة'},
    'district': {'tr': 'İlçe', 'en': 'District', 'de': 'Bezirk', 'ar': 'الحي'},
    'phone': {'tr': 'Telefon', 'en': 'Phone', 'de': 'Telefon', 'ar': 'الهاتف'},
    'language': {'tr': 'Dil', 'en': 'Language', 'de': 'Sprache', 'ar': 'اللغة'},
    'appearance': {'tr': 'Görünüm', 'en': 'Appearance', 'de': 'Erscheinungsbild', 'ar': 'المظهر'},
    'currency': {'tr': 'Para Birimi', 'en': 'Currency', 'de': 'Währung', 'ar': 'العملة'},
    'freeShipping': {'tr': 'Ücretsiz Kargo', 'en': 'Free Shipping', 'de': 'Kostenloser Versand', 'ar': 'شحن مجاني'},
    'greeting': {'tr': 'Merhaba', 'en': 'Hello', 'de': 'Hallo', 'ar': 'مرحباً'},
    'featured': {'tr': 'Öne Çıkanlar', 'en': 'Featured', 'de': 'Empfohlen', 'ar': 'مميز'},
    'featuredSub': {'tr': 'Seçilmiş ürünler', 'en': 'Curated picks', 'de': 'Ausgewählte Produkte', 'ar': 'منتجات مختارة'},
    'discoverTrends': {'tr': 'Trendleri Keşfet', 'en': 'Discover Trends', 'de': 'Trends entdecken', 'ar': 'اكتشف الاتجاهات'},
    'myProfile': {'tr': 'Profilim', 'en': 'My Profile', 'de': 'Mein Profil', 'ar': 'ملفي الشخصي'},
    'account': {'tr': 'Hesap', 'en': 'Account', 'de': 'Konto', 'ar': 'الحساب'},
    'security': {'tr': 'Güvenlik', 'en': 'Security', 'de': 'Sicherheit', 'ar': 'الأمان'},
    'general': {'tr': 'Genel', 'en': 'General', 'de': 'Allgemein', 'ar': 'عام'},
    'support': {'tr': 'Destek', 'en': 'Support', 'de': 'Support', 'ar': 'الدعم'},
    'about': {'tr': 'Hakkında', 'en': 'About', 'de': 'Über', 'ar': 'حول'},
    'version': {'tr': 'Sürüm', 'en': 'Version', 'de': 'Version', 'ar': 'الإصدار'},
    'changePassword': {'tr': 'Şifre Değiştir', 'en': 'Change Password', 'de': 'Passwort ändern', 'ar': 'تغيير كلمة المرور'},
    'deleteAccount': {'tr': 'Hesabı Sil', 'en': 'Delete Account', 'de': 'Konto löschen', 'ar': 'حذف الحساب'},
    'biometricLogin': {'tr': 'Biyometrik Giriş', 'en': 'Biometric Login', 'de': 'Biometrische Anmeldung', 'ar': 'تسجيل الدخول البيومتري'},
    'biometricSub': {'tr': 'Parmak izi veya yüz tanıma ile giriş yap', 'en': 'Login with fingerprint or face recognition', 'de': 'Mit Fingerabdruck oder Gesichtserkennung anmelden', 'ar': 'تسجيل الدخول ببصمة الإصبع أو التعرف على الوجه'},
    'orderNotifications': {'tr': 'Sipariş Bildirimleri', 'en': 'Order Notifications', 'de': 'Bestellbenachrichtigungen', 'ar': 'إشعارات الطلبات'},
    'orderNotifSub': {'tr': 'Sipariş durumu güncellemeleri', 'en': 'Order status updates', 'de': 'Bestellstatusaktualisierungen', 'ar': 'تحديثات حالة الطلب'},
    'campaignNotifications': {'tr': 'Kampanya Bildirimleri', 'en': 'Campaign Notifications', 'de': 'Kampagnenbenachrichtigungen', 'ar': 'إشعارات الحملات'},
    'campaignNotifSub': {'tr': 'Özel teklifler ve indirimler', 'en': 'Special offers and discounts', 'de': 'Sonderangebote und Rabatte', 'ar': 'عروض خاصة وخصومات'},
    'priceNotifications': {'tr': 'Fiyat Bildirimleri', 'en': 'Price Notifications', 'de': 'Preisbenachrichtigungen', 'ar': 'إشعارات الأسعار'},
    'priceNotifSub': {'tr': 'Favori ürünlerde fiyat düşüşleri', 'en': 'Price drops on favorite products', 'de': 'Preissenkungen bei Lieblingsprodukten', 'ar': 'انخفاض الأسعار على المنتجات المفضلة'},
    'helpCenter': {'tr': 'Yardım Merkezi', 'en': 'Help Center', 'de': 'Hilfecenter', 'ar': 'مركز المساعدة'},
    'liveSupport': {'tr': 'Canlı Destek', 'en': 'Live Support', 'de': 'Live-Support', 'ar': 'دعم مباشر'},
    'rateApp': {'tr': 'Uygulamayı Değerlendir', 'en': 'Rate App', 'de': 'App bewerten', 'ar': 'تقييم التطبيق'},
    'myAddresses': {'tr': 'Adreslerim', 'en': 'My Addresses', 'de': 'Meine Adressen', 'ar': 'عناواني'},
    'addAddress': {'tr': 'Adres Ekle', 'en': 'Add Address', 'de': 'Adresse hinzufügen', 'ar': 'إضافة عنوان'},
    'addNewAddress': {'tr': 'Yeni Adres Ekle', 'en': 'Add New Address', 'de': 'Neue Adresse hinzufügen', 'ar': 'إضافة عنوان جديد'},
    'newAddress': {'tr': 'Yeni Adres', 'en': 'New Address', 'de': 'Neue Adresse', 'ar': 'عنوان جديد'},
    'editAddress': {'tr': 'Adresi Düzenle', 'en': 'Edit Address', 'de': 'Adresse bearbeiten', 'ar': 'تعديل العنوان'},
    'deleteAddress': {'tr': 'Adresi Sil', 'en': 'Delete Address', 'de': 'Adresse löschen', 'ar': 'حذف العنوان'},
    'deleteAddressConfirm': {'tr': 'Bu adresi silmek istediğinize emin misiniz?', 'en': 'Are you sure you want to delete this address?', 'de': 'Möchten Sie diese Adresse wirklich löschen?', 'ar': 'هل أنت متأكد أنك تريد حذف هذا العنوان؟'},
    'addressDeleted': {'tr': 'Adres silindi', 'en': 'Address deleted', 'de': 'Adresse gelöscht', 'ar': 'تم حذف العنوان'},
    'addressTitle': {'tr': 'Adres Başlığı', 'en': 'Address Title', 'de': 'Adresstitel', 'ar': 'عنوان العنوان'},
    'addressTitleHint': {'tr': 'Ev, İş, vb.', 'en': 'Home, Work, etc.', 'de': 'Zuhause, Arbeit, usw.', 'ar': 'المنزل، العمل، إلخ'},
    'defaultAddress': {'tr': 'Varsayılan Adres', 'en': 'Default Address', 'de': 'Standardadresse', 'ar': 'العنوان الافتراضي'},
    'setAsDefault': {'tr': 'Varsayılan Yap', 'en': 'Set as Default', 'de': 'Als Standard setzen', 'ar': 'تعيين كافتراضي'},
    'noAddress': {'tr': 'Adres bulunamadı', 'en': 'No address found', 'de': 'Keine Adresse gefunden', 'ar': 'لم يتم العثور على عنوان'},
    'noAddressYet': {'tr': 'Henüz adres eklemediniz', 'en': 'No addresses added yet', 'de': 'Noch keine Adressen hinzugefügt', 'ar': 'لم تتم إضافة عناوين بعد'},
    'deliveryAddress': {'tr': 'Teslimat Adresi', 'en': 'Delivery Address', 'de': 'Lieferadresse', 'ar': 'عنوان التسليم'},
    'paymentMethod': {'tr': 'Ödeme Yöntemi', 'en': 'Payment Method', 'de': 'Zahlungsmethode', 'ar': 'طريقة الدفع'},
    'paymentMethods': {'tr': 'Ödeme Yöntemleri', 'en': 'Payment Methods', 'de': 'Zahlungsmethoden', 'ar': 'طرق الدفع'},
    'creditDebitCard': {'tr': 'Kredi / Banka Kartı', 'en': 'Credit / Debit Card', 'de': 'Kredit- / Debitkarte', 'ar': 'بطاقة ائتمانية / خصم'},
    'cashOnDelivery': {'tr': 'Kapıda Ödeme', 'en': 'Cash on Delivery', 'de': 'Nachnahme', 'ar': 'الدفع عند الاستلام'},
    'cardDetails': {'tr': 'Kart Bilgileri', 'en': 'Card Details', 'de': 'Kartendetails', 'ar': 'تفاصيل البطاقة'},
    'cardNumber': {'tr': 'Kart Numarası', 'en': 'Card Number', 'de': 'Kartennummer', 'ar': 'رقم البطاقة'},
    'cardholderName': {'tr': 'Kart Sahibinin Adı', 'en': 'Cardholder Name', 'de': 'Name des Karteninhabers', 'ar': 'اسم حامل البطاقة'},
    'expiryDate': {'tr': 'Son Kullanma Tarihi', 'en': 'Expiry Date', 'de': 'Ablaufdatum', 'ar': 'تاريخ انتهاء الصلاحية'},
    'shippingOption': {'tr': 'Kargo Seçeneği', 'en': 'Shipping Option', 'de': 'Versandoption', 'ar': 'خيار الشحن'},
    'shipping': {'tr': 'Kargo', 'en': 'Shipping', 'de': 'Versand', 'ar': 'الشحن'},
    'standardShipping': {'tr': 'Standart Kargo', 'en': 'Standard Shipping', 'de': 'Standardversand', 'ar': 'الشحن القياسي'},
    'expressShipping': {'tr': 'Ekspres Kargo', 'en': 'Express Shipping', 'de': 'Expressversand', 'ar': 'الشحن السريع'},
    'sameDayShipping': {'tr': 'Aynı Gün Kargo', 'en': 'Same Day Shipping', 'de': 'Gleichtagesversand', 'ar': 'شحن في نفس اليوم'},
    'sameDayDelivery': {'tr': 'Aynı Gün Teslimat', 'en': 'Same Day Delivery', 'de': 'Lieferung am gleichen Tag', 'ar': 'توصيل في نفس اليوم'},
    'estimatedDelivery': {'tr': 'Tahmini Teslimat', 'en': 'Estimated Delivery', 'de': 'Geschätzte Lieferung', 'ar': 'التسليم المتوقع'},
    'placeOrder': {'tr': 'Siparişi Ver', 'en': 'Place Order', 'de': 'Bestellung aufgeben', 'ar': 'تقديم الطلب'},
    'total': {'tr': 'Toplam', 'en': 'Total', 'de': 'Gesamt', 'ar': 'المجموع'},
    'orderSuccessTitle': {'tr': 'Siparişiniz Alındı! 🎉', 'en': 'Order Placed! 🎉', 'de': 'Bestellung aufgegeben! 🎉', 'ar': 'تم تقديم الطلب! 🎉'},
    'orderSuccessBody': {'tr': 'Siparişiniz başarıyla alındı. En kısa sürede kargoya verilecek.', 'en': 'Your order has been placed successfully. It will be shipped soon.', 'de': 'Ihre Bestellung wurde erfolgreich aufgegeben. Sie wird bald versandt.', 'ar': 'تم تقديم طلبك بنجاح. سيتم شحنه قريبًا.'},
    'goToOrders': {'tr': 'Siparişlerime Git', 'en': 'Go to Orders', 'de': 'Zu Bestellungen', 'ar': 'الانتقال إلى الطلبات'},
    'goHome': {'tr': 'Ana Sayfaya Dön', 'en': 'Go to Home', 'de': 'Zur Startseite', 'ar': 'الذهاب إلى الرئيسية'},
    'continueShopping': {'tr': 'Alışverişe Devam Et', 'en': 'Continue Shopping', 'de': 'Weiter einkaufen', 'ar': 'مواصلة التسوق'},
    'orderNo': {'tr': 'Sipariş No', 'en': 'Order No', 'de': 'Bestellnr.', 'ar': 'رقم الطلب'},
    'orderAll': {'tr': 'Tümü', 'en': 'All', 'de': 'Alle', 'ar': 'الكل'},
    'orderStatusPending': {'tr': 'Onay Bekliyor', 'en': 'Pending', 'de': 'Ausstehend', 'ar': 'في الانتظار'},
    'orderStatusConfirmed': {'tr': 'Onaylandı', 'en': 'Confirmed', 'de': 'Bestätigt', 'ar': 'تم التأكيد'},
    'orderStatusShipped': {'tr': 'Kargoya Verildi', 'en': 'Shipped', 'de': 'Versandt', 'ar': 'تم الشحن'},
    'orderStatusDelivered': {'tr': 'Teslim Edildi', 'en': 'Delivered', 'de': 'Geliefert', 'ar': 'تم التسليم'},
    'color': {'tr': 'Renk', 'en': 'Color', 'de': 'Farbe', 'ar': 'اللون'},
    'size': {'tr': 'Beden', 'en': 'Size', 'de': 'Größe', 'ar': 'الحجم'},
    'fieldRequired': {'tr': 'Bu alan zorunludur', 'en': 'This field is required', 'de': 'Dieses Feld ist erforderlich', 'ar': 'هذا الحقل مطلوب'},
    'inStock': {'tr': 'Stokta Var', 'en': 'In Stock', 'de': 'Auf Lager', 'ar': 'متوفر'},
    'outOfStock': {'tr': 'Stok Yok', 'en': 'Out of Stock', 'de': 'Nicht vorrätig', 'ar': 'نفد المخزون'},
    'limitedStock': {'tr': 'Son Ürünler!', 'en': 'Limited Stock!', 'de': 'Begrenzte Stückzahl!', 'ar': 'مخزون محدود!'},
    'seeAll': {'tr': 'Tümünü Gör', 'en': 'See All', 'de': 'Alle anzeigen', 'ar': 'عرض الكل'},
    'flashSale': {'tr': 'Flaş İndirim', 'en': 'Flash Sale', 'de': 'Flash Sale', 'ar': 'تخفيض سريع'},
    'searchHint': {'tr': 'Ürün, marka veya kategori ara...', 'en': 'Search products, brands...', 'de': 'Produkte, Marken suchen...', 'ar': 'ابحث عن منتجات...'},
    'emptyCart': {'tr': 'Sepetiniz Boş', 'en': 'Your Cart is Empty', 'de': 'Ihr Warenkorb ist leer', 'ar': 'سلتك فارغة'},
    'emptyCartSub': {'tr': 'Ürünlere göz atarak sepetinizi doldurun.', 'en': 'Browse products to fill your cart.', 'de': 'Durchsuchen Sie Produkte, um Ihren Warenkorb zu füllen.', 'ar': 'تصفح المنتجات لملء سلتك.'},
    'categories': {'tr': 'Kategoriler', 'en': 'Categories', 'de': 'Kategorien', 'ar': 'الفئات'},
    'products': {'tr': 'Ürünler', 'en': 'Products', 'de': 'Produkte', 'ar': 'المنتجات'},
    'subtotal': {'tr': 'Ara Toplam', 'en': 'Subtotal', 'de': 'Zwischensumme', 'ar': 'المجموع الفرعي'},
    'shippingFree': {'tr': 'Ücretsiz', 'en': 'Free', 'de': 'Kostenlos', 'ar': 'مجاني'},
    'checkoutButton': {'tr': 'Siparişi Tamamla', 'en': 'Place Order', 'de': 'Bestellen', 'ar': 'إتمام الطلب'},
    'addedToCart': {'tr': '{name} sepete eklendi', 'en': '{name} added to cart', 'de': '{name} zum Warenkorb hinzugefügt', 'ar': 'تمت إضافة {name} إلى السلة'},
    'goToCart': {'tr': 'Sepete Git', 'en': 'Go to Cart', 'de': 'Zum Warenkorb', 'ar': 'اذهب إلى السلة'},
    'inCart': {'tr': '✓ Sepette', 'en': '✓ In Cart', 'de': '✓ Im Warenkorb', 'ar': '✓ في السلة'},
    'searchTitle': {'tr': 'Ne aramak istersiniz?', 'en': 'What are you looking for?', 'de': 'Was suchen Sie?', 'ar': 'ما الذي تبحث عنه؟'},
    'searchSubtitle': {'tr': 'Ürün adı, marka veya kategori yazın', 'en': 'Type a product name, brand or category', 'de': 'Produktname, Marke oder Kategorie eingeben', 'ar': 'اكتب اسم منتج أو علامة تجارية أو فئة'},
    'orderStatusCancelled': {'tr': 'İptal Edildi', 'en': 'Cancelled', 'de': 'Storniert', 'ar': 'ملغى'},
    'orderStatusOnTheWay': {'tr': 'Kargoda', 'en': 'On the Way', 'de': 'Unterwegs', 'ar': 'في الطريق'},
    'catAll': {'tr': 'Tümü', 'en': 'All', 'de': 'Alle', 'ar': 'الكل'},
    'catElectronics': {'tr': 'Elektronik', 'en': 'Electronics', 'de': 'Elektronik', 'ar': 'إلكترونيات'},
    'catFashion': {'tr': 'Moda', 'en': 'Fashion', 'de': 'Mode', 'ar': 'الأزياء'},
    'catHome': {'tr': 'Ev & Yaşam', 'en': 'Home & Living', 'de': 'Heim & Leben', 'ar': 'المنزل والمعيشة'},
    'catSports': {'tr': 'Spor', 'en': 'Sports', 'de': 'Sport', 'ar': 'الرياضة'},
    'catBeauty': {'tr': 'Güzellik', 'en': 'Beauty', 'de': 'Schönheit', 'ar': 'الجمال'},
    'catBooks': {'tr': 'Kitap', 'en': 'Books', 'de': 'Bücher', 'ar': 'الكتب'},
    'catToys': {'tr': 'Oyuncak', 'en': 'Toys', 'de': 'Spielzeug', 'ar': 'الألعاب'},
    'bannerSummerTitle': {'tr': 'Yaz Kampanyası', 'en': 'Summer Sale', 'de': 'Sommerverkauf', 'ar': 'تخفيضات الصيف'},
    'bannerSummerSub': {'tr': '%40\'a varan indirimler', 'en': 'Up to 40% off', 'de': 'Bis zu 40% Rabatt', 'ar': 'خصم يصل إلى 40٪'},
    'bannerSummerBadge': {'tr': 'BUGÜN SON GÜN', 'en': 'LAST DAY TODAY', 'de': 'LETZTER TAG', 'ar': 'اليوم آخر يوم'},
    'bannerNewSeasonTitle': {'tr': 'Yeni Sezon', 'en': 'New Season', 'de': 'Neue Saison', 'ar': 'موسم جديد'},
    'bannerNewSeasonSub': {'tr': 'En yeni trendler burada', 'en': 'The latest trends are here', 'de': 'Die neuesten Trends sind da', 'ar': 'أحدث الاتجاهات هنا'},
    'bannerNewSeasonBadge': {'tr': 'YENİ ÜRÜNLER', 'en': 'NEW ARRIVALS', 'de': 'NEUHEITEN', 'ar': 'وصل حديثاً'},
    'bannerFreeShipTitle': {'tr': 'Ücretsiz Kargo', 'en': 'Free Shipping', 'de': 'Kostenloser Versand', 'ar': 'شحن مجاني'},
    'bannerFreeShipSub': {'tr': '500₺ üzeri tüm siparişlerde', 'en': 'On all orders over ₺500', 'de': 'Bei allen Bestellungen über ₺500', 'ar': 'على جميع الطلبات فوق ₺500'},
    'bannerFreeShipBadge': {'tr': 'SINIRLI SÜRE', 'en': 'LIMITED TIME', 'de': 'BEGRENZTE ZEIT', 'ar': 'وقت محدود'},
    'itemCount': {'tr': '{n} ürün', 'en': '{n} items', 'de': '{n} Artikel', 'ar': '{n} عناصر'},
  };

  String _t(String key) {
    final lang = locale.languageCode;
    return _strings[key]?[lang] ?? _strings[key]?['tr'] ?? key;
  }

  String get appName           => _t('appName');
  String get appTagline        => _t('appTagline');
  String get login             => _t('login');
  String get register          => _t('register');
  String get logout            => _t('logout');
  String get forgotPassword    => _t('forgotPassword');
  String get email             => _t('email');
  String get password          => _t('password');
  String get fullName          => _t('fullName');
  String get noAccount         => _t('noAccount');
  String get haveAccount       => _t('haveAccount');
  String get continueWith      => _t('continueWith');
  String get termsOfService    => _t('termsOfService');
  String get privacyPolicy     => _t('privacyPolicy');
  String get home              => _t('home');
  String get search            => _t('search');
  String get cart              => _t('cart');
  String get profile           => _t('profile');
  String get settings          => _t('settings');
  String get notifications     => _t('notifications');
  String get favorites         => _t('favorites');
  String get myOrders          => _t('myOrders');
  String get checkout          => _t('checkout');
  String get checkoutTitle     => _t('checkoutTitle');
  String get addToCart         => _t('addToCart');
  String get buyNow            => _t('buyNow');
  String get loading           => _t('loading');
  String get error             => _t('error');
  String get retry             => _t('retry');
  String get cancel            => _t('cancel');
  String get confirm           => _t('confirm');
  String get save              => _t('save');
  String get delete            => _t('delete');
  String get connectionError   => _t('connectionError');
  String get markAllRead       => _t('markAllRead');
  String get noNotifications   => _t('noNotifications');
  String get address           => _t('address');
  String get city              => _t('city');
  String get district          => _t('district');
  String get phone             => _t('phone');
  String get language          => _t('language');
  String get appearance        => _t('appearance');
  String get currency          => _t('currency');
  String get freeShipping      => _t('freeShipping');
  String get greeting          => _t('greeting');
  String get featured          => _t('featured');
  String get featuredSub       => _t('featuredSub');
  String get discoverTrends    => _t('discoverTrends');
  String get myProfile         => _t('myProfile');
  String get account           => _t('account');
  String get security          => _t('security');
  String get general           => _t('general');
  String get support           => _t('support');
  String get about             => _t('about');
  String get version           => _t('version');
  String get changePassword    => _t('changePassword');
  String get deleteAccount     => _t('deleteAccount');
  String get biometricLogin    => _t('biometricLogin');
  String get biometricSub      => _t('biometricSub');
  String get orderNotifications   => _t('orderNotifications');
  String get orderNotifSub        => _t('orderNotifSub');
  String get campaignNotifications => _t('campaignNotifications');
  String get campaignNotifSub      => _t('campaignNotifSub');
  String get priceNotifications   => _t('priceNotifications');
  String get priceNotifSub        => _t('priceNotifSub');
  String get helpCenter        => _t('helpCenter');
  String get liveSupport       => _t('liveSupport');
  String get rateApp           => _t('rateApp');
  String get myAddresses       => _t('myAddresses');
  String get addAddress        => _t('addAddress');
  String get addNewAddress     => _t('addNewAddress');
  String get newAddress        => _t('newAddress');
  String get editAddress       => _t('editAddress');
  String get deleteAddress     => _t('deleteAddress');
  String get deleteAddressConfirm => _t('deleteAddressConfirm');
  String get addressDeleted    => _t('addressDeleted');
  String get addressTitle      => _t('addressTitle');
  String get addressTitleHint  => _t('addressTitleHint');
  String get defaultAddress    => _t('defaultAddress');
  String get setAsDefault      => _t('setAsDefault');
  String get noAddress         => _t('noAddress');
  String get noAddressYet      => _t('noAddressYet');
  String get deliveryAddress   => _t('deliveryAddress');
  String get paymentMethod     => _t('paymentMethod');
  String get paymentMethods    => _t('paymentMethods');
  String get creditDebitCard   => _t('creditDebitCard');
  String get cashOnDelivery    => _t('cashOnDelivery');
  String get cardDetails       => _t('cardDetails');
  String get cardNumber        => _t('cardNumber');
  String get cardholderName    => _t('cardholderName');
  String get expiryDate        => _t('expiryDate');
  String get shippingOption    => _t('shippingOption');
  String get shipping          => _t('shipping');
  String get standardShipping  => _t('standardShipping');
  String get expressShipping   => _t('expressShipping');
  String get sameDayShipping   => _t('sameDayShipping');
  String get sameDayDelivery   => _t('sameDayDelivery');
  String get estimatedDelivery => _t('estimatedDelivery');
  String get placeOrder        => _t('placeOrder');
  String get total             => _t('total');
  String get orderSuccessTitle => _t('orderSuccessTitle');
  String get orderSuccessBody  => _t('orderSuccessBody');
  String get goToOrders        => _t('goToOrders');
  String get goHome            => _t('goHome');
  String get continueShopping  => _t('continueShopping');
  String get orderNo           => _t('orderNo');
  String get orderAll          => _t('orderAll');
  String get orderStatusPending   => _t('orderStatusPending');
  String get orderStatusConfirmed => _t('orderStatusConfirmed');
  String get orderStatusShipped   => _t('orderStatusShipped');
  String get orderStatusDelivered => _t('orderStatusDelivered');
  String get color             => _t('color');
  String get size              => _t('size');
  String get fieldRequired     => _t('fieldRequired');
  String get inStock           => _t('inStock');
  String get outOfStock        => _t('outOfStock');
  String get limitedStock      => _t('limitedStock');
  String get seeAll            => _t('seeAll');
  String get flashSale         => _t('flashSale');
  String get searchHint        => _t('searchHint');
  String get emptyCart         => _t('emptyCart');
  String get emptyCartSub      => _t('emptyCartSub');
  String get categories        => _t('categories');
  String get products              => _t('products');
  String get subtotal              => _t('subtotal');
  String get shippingFree          => _t('shippingFree');
  String get checkoutButton        => _t('checkoutButton');
  String addedToCart(String name)  => _t('addedToCart').replaceAll('{name}', name);
  String get goToCart              => _t('goToCart');
  String get inCart                => _t('inCart');
  String get searchTitle           => _t('searchTitle');
  String get searchSubtitle        => _t('searchSubtitle');
  String get orderStatusCancelled  => _t('orderStatusCancelled');
  String get orderStatusOnTheWay   => _t('orderStatusOnTheWay');
  String get catAll                => _t('catAll');
  String get catElectronics        => _t('catElectronics');
  String get catFashion            => _t('catFashion');
  String get catHome               => _t('catHome');
  String get catSports             => _t('catSports');
  String get catBeauty             => _t('catBeauty');
  String get catBooks              => _t('catBooks');
  String get catToys               => _t('catToys');
  String get bannerSummerTitle     => _t('bannerSummerTitle');
  String get bannerSummerSub       => _t('bannerSummerSub');
  String get bannerSummerBadge     => _t('bannerSummerBadge');
  String get bannerNewSeasonTitle  => _t('bannerNewSeasonTitle');
  String get bannerNewSeasonSub    => _t('bannerNewSeasonSub');
  String get bannerNewSeasonBadge  => _t('bannerNewSeasonBadge');
  String get bannerFreeShipTitle   => _t('bannerFreeShipTitle');
  String get bannerFreeShipSub     => _t('bannerFreeShipSub');
  String get bannerFreeShipBadge   => _t('bannerFreeShipBadge');
  String itemCount(int n)           => _t('itemCount').replaceAll('{n}', '$n');

  /// dummy_data'daki sabit kategori id'sine göre lokalize isim döner
  String categoryName(String id) {
    switch (id) {
      case 'all':         return _t('catAll');
      case 'electronics': return _t('catElectronics');
      case 'fashion':     return _t('catFashion');
      case 'home':        return _t('catHome');
      case 'sports':      return _t('catSports');
      case 'beauty':      return _t('catBeauty');
      case 'books':       return _t('catBooks');
      case 'toys':        return _t('catToys');
      default:            return id;
    }
  }

  /// dummy_data'daki sabit banner id'sine göre lokalize title döner
  String bannerTitle(String id) {
    switch (id) {
      case 'b1': return _t('bannerSummerTitle');
      case 'b2': return _t('bannerNewSeasonTitle');
      case 'b3': return _t('bannerFreeShipTitle');
      default:   return id;
    }
  }

  /// dummy_data'daki sabit banner id'sine göre lokalize subtitle döner
  String bannerSubtitle(String id) {
    switch (id) {
      case 'b1': return _t('bannerSummerSub');
      case 'b2': return _t('bannerNewSeasonSub');
      case 'b3': return _t('bannerFreeShipSub');
      default:   return id;
    }
  }

  /// dummy_data'daki sabit banner id'sine göre lokalize badge döner
  String bannerBadge(String id) {
    switch (id) {
      case 'b1': return _t('bannerSummerBadge');
      case 'b2': return _t('bannerNewSeasonBadge');
      case 'b3': return _t('bannerFreeShipBadge');
      default:   return id;
    }
  }
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      ['tr', 'en', 'de', 'ar'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async =>
      AppLocalizations(locale);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}