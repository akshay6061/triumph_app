import 'package:flutter/material.dart';

// Moved ScoreEntry from page2.dart
class ScoreEntry {
  final String name;
  final int score;
  final Color color;
  final IconData icon;

  const ScoreEntry({required this.name, required this.score, required this.color, required this.icon});
}

class ScorePage extends StatefulWidget {
  const ScorePage({super.key});

  @override
  State<ScorePage> createState() => _ScorePageState();
}

class _ScorePageState extends State<ScorePage> {
  List<ScoreEntry> entries = [
    ScoreEntry(name: 'Gladson George', score: 0, color: Colors.amber, icon: Icons.star),
    ScoreEntry(name: 'Amrutha B', score: 0, color: Colors.pink, icon: Icons.favorite),
    ScoreEntry(name: 'Akshay Murali', score: 0, color: Colors.blue, icon: Icons.sports_esports),
    ScoreEntry(name: 'Alex lison', score: 0, color: Colors.green, icon: Icons.emoji_events),
    ScoreEntry(name: 'Abhay Subramanian', score: 0, color: Colors.deepPurple, icon: Icons.sports_soccer),
    ScoreEntry(name: 'Aswathi Bindhu', score: 0, color: Colors.orange, icon: Icons.lightbulb),
    ScoreEntry(name: 'Athira P S', score: 0, color: Colors.teal, icon: Icons.bolt),
  ];

  final Map<String, String> remarks = {};
  final TextEditingController remarksController = TextEditingController();
  final TextEditingController pointsController = TextEditingController();
  int totalPoints = 0;

  void _showScoreDialog(int index, bool isAdd) {
    final pointsController = TextEditingController();
    final remarksDialogController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text((isAdd ? 'Add' : 'Subtract') + ' Points for ' + entries[index].name),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: pointsController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Points'),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: remarksDialogController,
                  decoration: const InputDecoration(labelText: 'Remarks'),
                  maxLines: 2,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                final int? value = int.tryParse(pointsController.text);
                if (value != null) {
                  setState(() {
                    final newScore = isAdd ? entries[index].score + value : entries[index].score - value;
                    entries[index] = ScoreEntry(
                      name: entries[index].name,
                      score: newScore < 0 ? 0 : newScore,
                      color: entries[index].color,
                      icon: entries[index].icon,
                    );
                    if (remarksDialogController.text.trim().isNotEmpty) {
                      remarks[entries[index].name] = remarksDialogController.text.trim();
                    }
                  });
                  Navigator.pop(context);
                }
              },
              child: Text(isAdd ? 'Add' : 'Subtract'),
            ),
          ],
        );
      },
    );
  }

  void _addPoints(int index, int points) {
    setState(() {
      final newScore = entries[index].score + points;
      entries[index] = ScoreEntry(
        name: entries[index].name,
        score: newScore < 0 ? 0 : newScore,
        color: entries[index].color,
        icon: entries[index].icon,
      );
    });
  }

  @override
  void dispose() {
    pointsController.dispose();
    remarksController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Score Page')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Card(
                elevation: 4,
                margin: const EdgeInsets.only(bottom: 16),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const Text('Overall Total Points', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      Text('${entries.fold<int>(0, (int sum, ScoreEntry e) => sum + e.score)}',
                          style: const TextStyle(fontSize: 40, color: Colors.blue, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 20),
                      TextField(
                        controller: remarksController,
                        decoration: const InputDecoration(
                          labelText: 'Overall Remarks',
                          border: OutlineInputBorder(),
                        ),
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: entries.length,
                itemBuilder: (context, index) {
                  final entry = entries[index];
                  return Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                    color: entry.color.withOpacity(0.12),
                    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
                    child: Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: entry.color,
                            child: Icon(entry.icon, color: Colors.white),
                          ),
                          title: Row(
  children: [
    Expanded(
      flex: 3,
      child: Text(
        entry.name,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
    ),
    Expanded(
      flex: 2,
      child: Align(
        alignment: Alignment.centerRight,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Score: ', style: TextStyle(fontWeight: FontWeight.w500)),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              transitionBuilder: (child, anim) => ScaleTransition(scale: anim, child: child),
              child: Text(
                '${entry.score}',
                key: ValueKey(entry.score),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                          trailing: Wrap(
                            spacing: 6,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.add_circle, color: Colors.green, size: 28),
                                onPressed: () => _addPoints(index, 1),
                                tooltip: 'Add 1 point',
                              ),
                              IconButton(
                                icon: const Icon(Icons.remove_circle, color: Colors.red, size: 28),
                                onPressed: () => _addPoints(index, -1),
                                tooltip: 'Subtract 1 point',
                              ),
                              IconButton(
                                icon: const Icon(Icons.edit, color: Colors.blueGrey, size: 26),
                                onPressed: () => _showScoreDialog(index, true),
                                tooltip: 'Custom Add/Subtract',
                              ),
                              IconButton(
                                icon: const Icon(Icons.edit_off, color: Colors.orange, size: 26),
                                onPressed: () => _showScoreDialog(index, false),
                                tooltip: 'Custom Subtract',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  color: Colors.deepOrange.shade100,
                  elevation: 8,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 24.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.calculate, color: Colors.deepOrange, size: 32),
                        const SizedBox(width: 12),
                        const Text('Total Score:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
                        const SizedBox(width: 10),
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 500),
                          transitionBuilder: (child, anim) => ScaleTransition(scale: anim, child: child),
                          child: Text(
                            '${entries.fold<int>(0, (int sum, ScoreEntry e) => sum + e.score)}',
                            key: ValueKey(entries.fold<int>(0, (int sum, ScoreEntry e) => sum + e.score)),
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 28, color: Colors.deepOrange),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
