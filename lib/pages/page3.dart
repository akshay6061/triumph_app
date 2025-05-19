import 'package:flutter/material.dart';

class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  final List<String> _alerts = [
    'Welcome to Triumph!',
    'Scoreboard updated.',
    'Event registration is open.',
  ];
  final TextEditingController _controller = TextEditingController();

  void _addAlert() {
    final text = _controller.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        _alerts.insert(0, text);
        _controller.clear();
      });
    }
  }

  void _deleteAlert(int index) {
    setState(() {
      _alerts.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alerts'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Enter new alert...',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _addAlert,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Icon(Icons.add_alert, color: Colors.white),
                ),
              ],
            ),
          ),
          Expanded(
            child: _alerts.isEmpty
                ? const Center(child: Text('No alerts yet.'))
                : ListView.builder(
                    reverse: false,
                    itemCount: _alerts.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        elevation: 4,
                        child: ListTile(
                          leading: const Icon(Icons.notification_important, color: Colors.redAccent),
                          title: Text(_alerts[index]),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () => _deleteAlert(index),
                            tooltip: 'Delete alert',
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

