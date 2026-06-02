# MediFinder Mobile — Flutter Case Study
## Senior Implementation Plan

> **Stack:** Flutter · Riverpod · GoRouter · Clean Architecture · Freezed
> **Süre:** 48 saat · **Teslim:** Public GitHub repo + README

---

## 1. Mimari Karar: Clean Architecture + Feature-First

Case study olmasına rağmen **production-grade** bir yapı kurmak; değerlendirme kriterlerindeki
"kod organizasyonu", "sürdürülebilirlik" ve "yeniden kullanılabilirlik" maddelerini doğrudan karşılar.

```
Presentation Layer   ←→   Domain Layer   ←→   Data Layer
(Screens, Widgets,        (Entities,           (Models, Mock
 Notifiers)               UseCases,            DataSource,
                          Repositories)        Repository Impl)
```

**Neden bu üçlü?**

| Karar | Neden |
|---|---|
| **Clean Architecture** | Her katman bağımsız test edilebilir; gerçek API eklenince sadece Data Layer değişir |
| **Feature-first klasör yapısı** | Tek feature büyüdükçe izole kalır; yeni feature eklemek kolay |
| **Riverpod (code-gen)** | Boilerplate minimum, tip güvenli, testable, Flutter community standardı |
| **GoRouter** | Flutter team önerisi, declarative, deep-link, type-safe extras |
| **Freezed** | Immutable data class'lar, copyWith, equality, sealed unions — elle yazma yok |

---

## 2. Klasör Yapısı

```
medifinder/
│
├── lib/
│   ├── core/                          # Tüm feature'lardan bağımsız altyapı
│   │   ├── constants/
│   │   │   ├── app_colors.dart        # MediFinder brand palette
│   │   │   ├── app_typography.dart    # Font scale, weights
│   │   │   ├── app_spacing.dart       # 4px grid sistemi (4, 8, 12, 16, 24, 32...)
│   │   │   └── app_strings.dart       # Hardcoded string sabitleri (i18n hazırlığı)
│   │   │
│   │   ├── theme/
│   │   │   ├── app_theme.dart         # ThemeData light (+ dark hazırlığı)
│   │   │   └── app_theme_extension.dart # Custom ThemeExtension (badge renkleri vs.)
│   │   │
│   │   ├── router/
│   │   │   ├── app_router.dart        # GoRouter tanımı, provider ile wrap
│   │   │   └── app_routes.dart        # Route path sabitleri + GoRouteData sınıfları
│   │   │
│   │   ├── widgets/                   # Uygulama genelinde paylaşılan atomlar
│   │   │   ├── app_search_field.dart
│   │   │   ├── app_loading_shimmer.dart
│   │   │   ├── app_empty_state.dart
│   │   │   ├── app_error_state.dart
│   │   │   ├── app_rating_bar.dart
│   │   │   └── app_verified_badge.dart
│   │   │
│   │   ├── extensions/
│   │   │   ├── context_ext.dart       # context.colors, context.textTheme, context.screenSize
│   │   │   └── string_ext.dart        # capitalize, truncate, initials
│   │   │
│   │   └── utils/
│   │       ├── debouncer.dart         # Search debounce (300ms)
│   │       └── result.dart            # sealed Result<T, E> — success/failure wrapper
│   │
│   ├── features/
│   │   └── providers/                 # "Provider" = doktor, klinik, hastane feature'ı
│   │       │
│   │       ├── data/
│   │       │   ├── datasources/
│   │       │   │   └── provider_mock_datasource.dart   # 20 mock provider
│   │       │   ├── models/
│   │       │   │   ├── provider_model.dart             # JSON-serializable, Freezed
│   │       │   │   └── filter_model.dart               # Freezed
│   │       │   └── repositories/
│   │       │       └── provider_repository_impl.dart   # Domain interface'i impl eder
│   │       │
│   │       ├── domain/
│   │       │   ├── entities/
│   │       │   │   ├── provider_entity.dart            # Pure Dart, Freezed
│   │       │   │   └── filter_entity.dart              # Pure Dart, Freezed
│   │       │   ├── repositories/
│   │       │   │   └── provider_repository.dart        # abstract interface
│   │       │   └── usecases/
│   │       │       ├── get_providers_usecase.dart
│   │       │       ├── search_providers_usecase.dart
│   │       │       └── filter_providers_usecase.dart
│   │       │
│   │       └── presentation/
│   │           ├── screens/
│   │           │   ├── provider_list_screen.dart
│   │           │   ├── filter_screen.dart              # Modal bottom sheet olarak açılır
│   │           │   └── provider_detail_screen.dart
│   │           │
│   │           ├── widgets/
│   │           │   ├── provider_card.dart              # List item kartı
│   │           │   ├── provider_skeleton_card.dart     # Shimmer loading versiyonu
│   │           │   ├── filter_bottom_sheet.dart        # Filter UI container'ı
│   │           │   ├── filter_chip_group.dart          # Tekrar kullanılabilir chip group
│   │           │   ├── active_filters_row.dart         # Seçili filtreler özet satırı
│   │           │   ├── provider_avatar.dart            # Hero widget, fallback initials
│   │           │   └── contact_info_tile.dart          # Telefon, mail, web satırı
│   │           │
│   │           └── controllers/
│   │               ├── provider_list_notifier.dart     # @riverpod AsyncNotifier
│   │               ├── filter_notifier.dart            # @riverpod Notifier
│   │               └── provider_detail_notifier.dart   # @riverpod FutureProvider
│   │
│   ├── app.dart                       # MaterialApp.router, ProviderScope
│   └── main.dart                      # runApp
│
├── test/
│   ├── unit/
│   │   └── features/providers/
│   │       ├── usecases/
│   │       │   ├── get_providers_usecase_test.dart
│   │       │   └── filter_providers_usecase_test.dart
│   │       └── repositories/
│   │           └── provider_repository_impl_test.dart
│   ├── widget/
│   │   └── features/providers/widgets/
│   │       ├── provider_card_test.dart
│   │       └── filter_chip_group_test.dart
│   └── helpers/
│       ├── mock_providers.dart        # Test için fake provider listesi
│       └── mock_repository.dart       # mocktail ile mock repository
│
├── assets/
│   ├── images/
│   │   └── placeholder_avatar.png
│   └── icons/
│       └── medifinder_logo.svg
│
├── pubspec.yaml
├── analysis_options.yaml
└── README.md
```

---

## 3. Paket Listesi

### pubspec.yaml — dependencies

```yaml
# State Management
flutter_riverpod: ^2.6.1
riverpod_annotation: ^2.6.1

# Navigation
go_router: ^14.6.1

# Data / Code Generation
freezed_annotation: ^2.4.4
json_annotation: ^4.9.0

# UI & Animations
flutter_animate: ^4.5.2       # Micro-interaction & entrance animations
shimmer: ^3.0.0               # Skeleton loading
cached_network_image: ^3.4.1  # Network image cache + placeholder
gap: ^3.0.1                   # Spacing widget (SizedBox alternatifi)
google_fonts: ^6.2.1          # Inter veya Plus Jakarta Sans
flutter_svg: ^2.0.10+1        # SVG icon desteği

# Utils
intl: ^0.19.0                 # Tarih/sayı formatlama
collection: ^1.18.0           # groupBy, sortedBy helpers
```

### pubspec.yaml — dev_dependencies

```yaml
build_runner: ^2.4.13
freezed: ^2.5.7
riverpod_generator: ^2.6.1
json_serializable: ^6.8.0

# Testing
mocktail: ^1.0.4
flutter_test:
  sdk: flutter

# Linting
very_good_analysis: ^6.0.0
```

> **Not:** `connectivity_plus` bonus offline senaryosu için eklenebilir.

---

## 4. Provider (Doktor/Klinik/Hastane) Modeli

ProviderEntity domain katmanındaki saf Dart nesnesi:

```
ProviderEntity
  id            String
  name          String
  type          ProviderType     # doctor | clinic | hospital
  specialty     String           # Kardiyoloji, Ortopedi...
  city          String
  country       String
  rating        double           # 0.0 - 5.0
  reviewCount   int
  imageUrl      String?
  phone         String?
  email         String?
  website       String?
  bio           String?
  languages     List<String>
  isVerified    bool
  tags          List<String>     # arama/filtreleme için
```

FilterEntity:

```
FilterEntity
  selectedCountries   List<String>    # boş = tümü
  selectedCities      List<String>
  selectedSpecialties List<String>
  activeCount         int             # computed — kaç filtre aktif
```

---

## 5. Mock Data Stratejisi

- En az **20 provider** oluştur (çeşitlilik önemli)
- **5 ülke**, **10 şehir**, **8 branş** içermeli
- Hem `doctor` hem `clinic` hem `hospital` type'ları temsil edilmeli
- Bazılarının `imageUrl: null` olmalı (fallback test)
- Bazılarının `rating: 0` / `reviewCount: 0` olmalı (edge case test)
- Bazı `phone / email / website` alanları null olmalı (null safety test)

> Mock datasource bir `Future<List<ProviderModel>>` döndürmeli ve içinde
> `await Future.delayed(const Duration(milliseconds: 800))` bulunmalı
> — böylece loading state'ler gerçekçi görünür.

---

## 6. State Yönetimi Detayı

### ProviderListNotifier
```
state: AsyncValue<List<ProviderEntity>>
  |
  ├─ loading   → Shimmer skeleton (5 kart)
  ├─ error     → ErrorState widget + Retry button
  └─ data      → Liste veya EmptyState

methods:
  loadProviders()
  onSearchChanged(String query)   ← Debouncer ile 300ms bekler
  refresh()
```

### FilterNotifier
```
state: FilterEntity
  (initialState = FilterEntity.empty())

methods:
  toggleCountry(String country)
  toggleCity(String city)
  toggleSpecialty(String specialty)
  clearAll()
  applyFilters()   ← Provider list notifier'ı tetikler
```

### Akış
```
FilterNotifier.state  ──┐
SearchQuery            ──┤──▶  filterProvidersUseCase  ──▶  ProviderListNotifier.state
AllProviders (cache)  ──┘
```

Tüm filtreleme client-side yapılır. Gerçek bir API'da sadece usecase içi değişir.

---

## 7. Navigation Kurgusu

```
/                         → ProviderListScreen
  ?search=...             → initial search query (deep link bonus)
/filter                   → FilterScreen (modal bottom sheet)
/providers/:id            → ProviderDetailScreen
  extra: ProviderEntity   → Hero animation için entity direkt geçilir
```

**GoRouter Tercihleri:**
- Detail screen'e `extra: provider` olarak `ProviderEntity` geçilir — `id` ile tekrar fetch yapılmaz
- Back button her iki platform için doğal davranır
- `ShellRoute` ileride bottom nav bar eklenirse kullanıma hazır

---

## 8. Ekran Bazlı UX Detayları

### 8.1 Provider List Screen

| Element | Detay |
|---|---|
| AppBar | MediFinder logo + başlık, sağda filter icon (aktif filtre sayısı badge'i) |
| Search Field | Leading search icon, trailing clear button, `onChanged` debounced |
| Active Filters Row | Seçili filtreler chip olarak görünür, X ile tek tek kaldırılabilir |
| Provider Cards | Avatar + Verified badge + İsim + Branş + Şehir + Rating bar + Review count |
| Loading State | 5 adet `ProviderSkeletonCard` shimmer animasyonu |
| Empty State | İllüstrasyon + açıklama + "Filtreleri temizle" butonu |
| Error State | İllüstrasyon + hata mesajı + "Tekrar dene" butonu |
| Pull to Refresh | `RefreshIndicator` ile `loadProviders()` tetiklenir |

### 8.2 Filter Screen (Modal Bottom Sheet)

| Element | Detay |
|---|---|
| Handle bar | Üstte pill şeklinde drag indicator |
| Section: Ülke | Wrap layout chip group, multi-select |
| Section: Şehir | Seçili ülkeye göre dinamik filtrele (UX bonus) |
| Section: Branş | Wrap layout chip group, multi-select |
| Footer | "Temizle" (ghost button) + "Uygula" (primary button) |
| Animasyon | Sheet açılırken slide-up + fade, chip seçimde scale bounce |

### 8.3 Provider Detail Screen

| Element | Detay |
|---|---|
| SliverAppBar | Expandable, provider fotoğrafı veya gradient placeholder |
| Hero Widget | List ekranındaki avatar ile expand/collapse animasyonu |
| Verified Badge | İsim yanında küçük badge |
| Branş & Şehir | Chip görünümünde |
| Rating Summary | Yıldızlar + sayısal rating + kaç review |
| Bio | Expandable text (max 3 satır → "Devamını göster") |
| Diller | Tag list |
| İletişim | Telefon (tap to call), e-posta (tap to mail), website — icon + label satırları |
| Geri Buton | iOS swipe-back doğal çalışır |

---

## 9. Animasyon & Micro-interaction Planı

`flutter_animate` paketi ile:

| Eleman | Animasyon |
|---|---|
| Provider card — giriş | `fadeIn` + `slideY` staggered (her kart 50ms arayla) |
| Card — tap | `scale` 0.97 → 1.0 haptic feedback ile |
| Filter chip — seçim | `scale` bounce + renk geçişi |
| Active filter chip — silme | `fadeOut` + `slideX` |
| Detail screen — hero | Flutter built-in Hero widget |
| Detail screen — içerik | Section'lar `fadeIn` + `slideY` on scroll |
| Bottom sheet — açılış | GoRouter + DraggableScrollableSheet |
| Error/empty state | `scale` entrance |
| Shimmer | `shimmer` paketi, soldan sağa sweep |

---

## 10. Null ve Edge Case Yönetimi

| Durum | Yaklaşım |
|---|---|
| `imageUrl == null` | `ProviderAvatar` widget initials gösterir (renkli daire) |
| `rating == 0` | "Henüz değerlendirilmedi" yazısı |
| `bio == null` | Bio section gizlenir |
| `phone / email == null` | İlgili contact tile gizlenir |
| `languages.isEmpty` | Dil satırı gizlenir |
| Boş arama sonucu | `AppEmptyState` widget |
| Boş filtre sonucu | "Eşleşen provider bulunamadı" + "Filtreleri temizle" |
| Datasource gecikmesi | Loading skeleton |
| Datasource hatası | Error state + retry |

---

## 11. Test Stratejisi

### Unit Tests
- `GetProvidersUsecaseTest` — mock repository ile happy path + error
- `FilterProvidersUsecaseTest` — farklı filtre kombinasyonları
- `SearchProvidersUsecaseTest` — boş query, kısmi match, no match
- `ProviderRepositoryImplTest` — mock datasource ile

### Widget Tests
- `ProviderCard` — gerekli bilgileri render ediyor mu?
- `ProviderCard` — `imageUrl: null` durumunda initials gösteriyor mu?
- `FilterChipGroup` — seçim ve seçim kaldırma
- `AppEmptyState` — doğru mesaj render ediyor mu?

### Test Helper Yapısı
```
test/helpers/
  mock_providers.dart     # List<ProviderEntity> sabit test verisi
  mock_repository.dart    # mocktail MockProviderRepository
```

---

## 12. analysis_options.yaml

```yaml
include: package:very_good_analysis/analysis_options.yaml

analyzer:
  exclude:
    - "**/*.g.dart"
    - "**/*.freezed.dart"
```

`very_good_analysis` çok katı; değerlendirmede "kod kalitesine önem veriyor" mesajı verir.

---

## 13. README Şablonu (Teslimde)

README şu bölümleri içermeli:

```
# MediFinder Flutter

## Ekran Görüntüleri / GIF
[3 ekran görüntüsü yan yana]

## Mimari
Clean Architecture + Feature-first yapısı kısaca açıklanır

## State Yönetimi
Riverpod seçim gerekçesi, notifier'ların sorumluluğu

## Navigation
GoRouter yapısı, route listesi

## Önemli Teknik Kararlar
- Debounce stratejisi
- Client-side filtreleme
- Hero animation yaklaşımı
- Null safety edge case'leri

## Kurulum
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter run

## Test
flutter test

## Bonus
Offline/retry senaryosu varsa açıkla
```

---

## 14. Faz Planı (48 Saat)

```
FAZ 1 — Setup & Altyapı                        (2-3 saat)
├── Flutter projesi oluştur (bundle id: com.medifinder.app)
├── pubspec.yaml paketleri ekle
├── analysis_options.yaml konfigürasyonu
├── Klasör yapısını oluştur (boş dosyalar)
├── Git repo init + ilk commit
└── GitHub repo oluştur (public)

FAZ 2 — Core Katman                             (2-3 saat)
├── app_colors.dart — MediFinder mavi + nötr palet
├── app_typography.dart — Inter/Plus Jakarta Sans font scale
├── app_spacing.dart — 4px grid sabitleri
├── app_theme.dart — ThemeData tanımı
├── app_router.dart + app_routes.dart
└── Core widget'lar (EmptyState, ErrorState, SearchField, RatingBar, VerifiedBadge)

FAZ 3 — Data Katmanı                            (2-3 saat)
├── ProviderModel (Freezed + json_serializable) + build_runner
├── FilterModel (Freezed)
├── ProviderMockDatasource — 20 provider, 800ms delay
├── ProviderRepository (abstract interface)
└── ProviderRepositoryImpl

FAZ 4 — Domain Katmanı                          (1-2 saat)
├── ProviderEntity (Freezed)
├── FilterEntity (Freezed)
├── GetProvidersUsecase
├── SearchProvidersUsecase
└── FilterProvidersUsecase

FAZ 5 — Provider List Feature                   (3-4 saat)
├── ProviderListNotifier (@riverpod)
├── FilterNotifier (@riverpod)
├── ProviderCard widget
├── ProviderSkeletonCard widget
├── ActiveFiltersRow widget
└── ProviderListScreen (search + liste + state'ler)

FAZ 6 — Filter Feature                          (2-3 saat)
├── FilterChipGroup widget (reusable)
├── FilterBottomSheet widget
├── FilterScreen entegrasyonu
└── ProviderList ile bağlantı

FAZ 7 — Provider Detail Feature                 (2-3 saat)
├── ProviderDetailNotifier (@riverpod)
├── ProviderAvatar (Hero wrapper)
├── ContactInfoTile widget
└── ProviderDetailScreen (SliverAppBar + içerik)

FAZ 8 — Animasyonlar & Polish                   (3-4 saat)
├── flutter_animate ile card entrance stagger
├── Chip selection micro-interaction
├── Hero animation detail/list arası
├── Detail screen section animations
├── Genel UX gözden geçirme
└── Loading/error/empty state'lerin animasyonları

FAZ 9 — Testing                                 (2-3 saat)
├── Unit testler (usecase'ler)
├── Widget testler (card, chip group)
└── Test helper'ları

FAZ 10 — README & Teslim                        (1-2 saat)
├── README yazımı
├── Ekran görüntüleri / screen recording
├── Son lint kontrolü (flutter analyze)
├── Flutter test (tüm testler geçmeli)
└── GitHub push + repo linki hazır
```

---

## 15. Değerlendirme Kriteri Karşılaştırması

| Kriter | Nasıl Karşılandı |
|---|---|
| Kod organizasyonu | Clean Arch + Feature-first + core ayrımı |
| Component yapısı ve yeniden kullanılabilirlik | Atomic widget'lar, `FilterChipGroup` birden fazla yerde kullanılır |
| Navigation kurgusu | GoRouter, named routes, type-safe extras |
| State yönetimi yaklaşımı | Riverpod AsyncNotifier, tek yönlü veri akışı |
| Null ve eksik veri yönetimi | Her entity field'ı için fallback davranış tanımlı |
| Loading, empty ve error state'leri | Shimmer / EmptyState / ErrorState + Retry |
| Genel kullanıcı deneyimi | Animasyonlar, micro-interactions, Hero transition |
| Kod okunabilirliği ve sürdürülebilirliği | very_good_analysis, Freezed, anlamlı isimlendirme |
| **BONUS** Test örnekleri | Unit + Widget testler |
| **BONUS** Offline/retry senaryosu | Error state + Retry butonu (connectivity_plus opsiyonel) |

---

> Bu plan, değerlendirmede "senior engineer" izlenimi bırakacak şekilde tasarlanmıştır.
> Her karar gerekçesiyle birlikte README'ye yansıtılmalıdır — kodu kadar kararlarını açıklamak önemlidir.