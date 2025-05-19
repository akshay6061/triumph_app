import 'package:flutter/material.dart';
import 'pages/score_page.dart';
import 'pages/page1.dart';
import 'pages/page2.dart';
import 'pages/page3.dart';
import 'pages/page4.dart';

void main() {
  runApp(const TriumphApp());
}

class TriumphApp extends StatelessWidget {
  const TriumphApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Triumph',
      theme: ThemeData(
        primaryColor: const Color(0xFF232C3B),
        scaffoldBackgroundColor: const Color(0xFFE8E2D3),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFF232C3B),
          secondary: const Color(0xFF232C3B),
          background: const Color(0xFFE8E2D3),
        ),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Color(0xFF232C3B),
          ),
          bodyLarge: TextStyle(
            fontSize: 18,
            color: Color(0xFF232C3B),
          ),
        ),
        fontFamily: 'Roboto',
      ),
      home: const LandingPage(),
      routes: {
        '/home': (context) => const MainNavigation(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 160,
                child: Image.asset('assets/motto.jpeg'),
              ),
              const SizedBox(height: 32),
              Text(
                'BUILT TO BREAK BOUNDARIES',
                style: Theme.of(context).textTheme.headlineLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF232C3B),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
                child: const Text(
                  'Enter',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;
  static final List<Widget> _pages = <Widget>[
    const Page1(),
    const ScorePage(),
    const Page3(),
    const Page4(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_events),
            label: 'Score',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Alerts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

