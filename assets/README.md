# Cara Menggunakan Assets dalam Flutter

## 📁 Struktur Folder Assets
```
latihan_btn_icn_txt_img/
├── assets/
│   └── images/
│       └── sample_image.png  # Masukkan gambar Anda di sini
├── lib/
└── pubspec.yaml
```

## 🔧 Konfigurasi pubspec.yaml
File `pubspec.yaml` sudah dikonfigurasi dengan:
```yaml
flutter:
  uses-material-design: true
  
  # Konfigurasi untuk assets (gambar, font, dll)
  assets:
    - assets/images/
```

## 📝 Cara Menambahkan Gambar ke Assets

### 1. Siapkan Gambar
- Format yang didukung: PNG, JPG, JPEG, GIF, WebP
- Ukuran yang disarankan: maksimal 2MB per file
- Resolusi yang disarankan: sesuai kebutuhan (biasanya 1x, 2x, 3x untuk berbagai density)

### 2. Masukkan ke Folder Assets
- Buat folder `assets/images/` jika belum ada
- Masukkan file gambar ke folder tersebut
- Contoh: `assets/images/logo.png`, `assets/images/profile.jpg`

### 3. Update pubspec.yaml (Sudah dikonfigurasi)
```yaml
flutter:
  assets:
    - assets/images/
```

### 4. Gunakan dalam Kode
```dart
// Menggunakan AssetImage
Image(
  image: AssetImage('assets/images/logo.png'),
  width: 200,
  height: 200,
)

// Atau menggunakan Image.asset (lebih singkat)
Image.asset(
  'assets/images/logo.png',
  width: 200,
  height: 200,
)
```

## ⚠️ Tips Penting

1. **Path harus tepat**: Pastikan path di kode sama dengan struktur folder
2. **Case sensitive**: Nama file dan folder harus sesuai (huruf besar/kecil)
3. **Hot reload**: Setelah menambah asset baru, jalankan `flutter clean` dan `flutter pub get`
4. **Error handling**: Selalu gunakan `errorBuilder` untuk menangani asset yang tidak ditemukan

## 🎯 Contoh Implementasi
Lihat file `lib/image_script.dart` untuk contoh lengkap penggunaan AssetImage dengan error handling.

## 📱 Testing
Untuk menguji dengan gambar nyata:
1. Masukkan gambar ke `assets/images/sample_image.png`
2. Jalankan aplikasi
3. Lihat contoh di bagian "Image dari Assets"
