import 'package:flutter/material.dart';

class Page4 extends StatelessWidget {
  const Page4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Team Profile'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Animated Logo
            TweenAnimationBuilder<double>(
              tween: Tween(begin: 0.8, end: 1.1),
              duration: const Duration(seconds: 2),
              curve: Curves.elasticInOut,
              builder: (context, scale, child) => Transform.scale(
                scale: scale,
                child: child,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(32),
                child: Image.asset('assets/logo.jpeg', height: 100, width: 100, fit: BoxFit.cover),
              ),
              onEnd: () {},
            ),
            const SizedBox(height: 18),
            // Team Motto
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.deepPurple, Colors.orangeAccent]),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Text(
                'Together We Triumph!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.2,
                  shadows: [Shadow(blurRadius: 8, color: Colors.black26, offset: Offset(2, 2))],
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Achievements
            const Text('Achievements', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Wrap(
              spacing: 18,
              runSpacing: 14,
              alignment: WrapAlignment.center,
              children: const [
                _Achievement(icon: Icons.emoji_events, label: 'Winners, 2024 Hackathon'),
                _Achievement(icon: Icons.star, label: 'Best UI Award'),
                _Achievement(icon: Icons.people, label: 'Most Collaborative Team'),
                _Achievement(icon: Icons.lightbulb, label: 'Innovation Champions'),
              ],
            ),
            const SizedBox(height: 32),
            // Fun Facts
            const Text('Fun Facts', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('• Our team has members from 3 different states!'),
                  SizedBox(height: 4),
                  Text('• We code best after midnight.'),
                  SizedBox(height: 4),
                  Text('• 3 members play musical instruments.'),
                  SizedBox(height: 4),
                  Text('• We have a team mascot: a plush penguin.'),
                ],
              ),
            ),
            const SizedBox(height: 32),
            // Timeline
            const Text('Milestone Timeline', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            _Timeline(),
          ],
        ),
      ),
    );
  }
}

class _Achievement extends StatelessWidget {
  final IconData icon;
  final String label;
  const _Achievement({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          backgroundColor: Colors.orangeAccent,
          child: Icon(icon, color: Colors.white),
        ),
        const SizedBox(height: 6),
        Text(label, textAlign: TextAlign.center, style: const TextStyle(fontSize: 13)),
      ],
    );
  }
}

class _Timeline extends StatelessWidget {
  const _Timeline();

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> milestones = [
      {'year': '2023', 'event': 'Team formed'},
      {'year': '2024', 'event': 'Won Hackathon'},
      {'year': '2024', 'event': 'Launched first app'},
      {'year': '2025', 'event': 'Expanded to 7 members'},
    ];
    return Column(
      children: milestones.map((m) => Row(
        children: [
          Container(
            width: 32,
            alignment: Alignment.center,
            child: Text(m['year'], style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade50,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(m['event'], style: const TextStyle(fontSize: 15)),
            ),
          ),
        ],
      )).toList(),
    );
  }
}

