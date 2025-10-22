import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Breakfast Website',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // Terapkan font default
        textTheme: GoogleFonts.montserratTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // 1. Latar Belakang Kuning Melengkung
            _buildBackgroundCurve(screenSize),

            // 2. Konten Utama (Navbar + Hero)
            Column(
              children: [
                NavBar(),
                HeroSection(),
              ],
            ),

            // 3. Elemen Samping (recipe, review)
            _buildSideElements(screenSize),
          ],
        ),
      ),
    );
  }

  // Widget untuk latar belakang kuning
  Widget _buildBackgroundCurve(Size screenSize) {
    return Positioned(
      top: 0,
      left: 0,
      child: Container(
        width: screenSize.width * 0.65, // Lebar lengkungan
        height: screenSize.height * 1.1, // Tinggi agar menutupi
        decoration: BoxDecoration(
          color: Color(0xFFF9C74F), // Warna kuning dari gambar
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(500),
            topRight: Radius.circular(500),
          ),
        ),
      ),
    );
  }

  // Widget untuk elemen teks di samping
  Widget _buildSideElements(Size screenSize) {
    return Positioned(
      top: screenSize.height * 0.4,
      right: 20,
      child: Column(
        children: [
          RotatedBox(
            quarterTurns: 1, // Putar 90 derajat
            child: TextButton(
              onPressed: () {},
              child: Text(
                'recipe >',
                style: TextStyle(
                    color: Colors.black54, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(height: 150),
          RotatedBox(
            quarterTurns: 1, // Putar 90 derajat
            child: TextButton(
              onPressed: () {},
              child: Text(
                'review >',
                style: TextStyle(
                    color: Colors.black54, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(height: 100),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[200],
            ),
            child: Icon(Icons.arrow_downward, color: Colors.black54),
          )
        ],
      ),
    );
  }
}

// Widget untuk Navbar (Bagian Atas)
class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 48.0, vertical: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo
          Row(
            children: [
              // Ganti dengan Icon atau Image aset Anda
              Icon(Icons.restaurant_menu, color: Colors.black, size: 28),
              SizedBox(width: 8),
              Text(
                'breakfast',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          // Menu Links
          Row(
            children: [
              _buildNavLink('home'),
              _buildNavLink('recipe'),
              _buildNavLink('foodlover'),
              _buildNavLink('aboutus'),
              _buildNavLink('contact'),
            ],
          ),

          // Hamburger Menu (untuk mobile, di sini hanya ikon)
          Icon(Icons.menu, color: Colors.black, size: 28),
        ],
      ),
    );
  }

  Widget _buildNavLink(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextButton(
        onPressed: () {},
        child: Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

// Widget untuk Hero Section (Gambar dan Teks)
class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 48.0),
      height: MediaQuery.of(context).size.height * 0.8, // 80% tinggi layar
      child: Row(
        children: [
          // Bagian Kiri (Gambar)
          Expanded(
            flex: 6, // Ambil 60% lebar
            child: Container(
              // Alignment.centerRight akan mendorong gambar ke kanan,
              // membuatnya tumpang tindih dengan bagian putih
              alignment: Alignment.centerRight,
              child:
                  // GANTI DENGAN GAMBAR ANDA
                  // Pastikan gambar ini punya background transparan
                  Image.asset(
                'assets/images/breakfast015.png',
                fit: BoxFit.contain,
                height: 500, // Sesuaikan ukuran gambar
                // Fallback jika gambar error
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 500,
                    width: 500,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                        child: Text(
                            'Tempatkan breakfast015.png di assets/images/')),
                  );
                },
              ),
            ),
          ),

          // Bagian Kanan (Teks)
          Expanded(
            flex: 4, // Ambil 40% lebar
            child: Padding(
              padding: const EdgeInsets.only(left: 32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Do you eat',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(height: 16),
                  // Judul Utama
                  Text(
                    'Breakfast',
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 64,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'a t   a n y   t i m e', // Menggunakan spasi untuk efek
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      letterSpacing: 4.0, // Efek spasi antar huruf
                    ),
                  ),
                  SizedBox(height: 32),
                  // Paragraf
                  Text(
                    'Remember the days when you let your child have\nsome chocolate if he finished his cereal? Now,\nchocolate is one of the cereals',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                      height: 1.5, // Jarak antar baris
                    ),
                  ),
                  SizedBox(height: 48),
                  // Tombol Book Now
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Color(0xFFF9C74F), // Warna kuning yang sama
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 0, // Tanpa bayangan
                    ),
                    child: Text(
                      'Book Now',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
