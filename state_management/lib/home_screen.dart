import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'list_map_provider.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  HomeScreen({super.key}); // Added key for StatelessWidget

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ItemProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('CRUD with Provider'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      labelText: 'Enter item name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    final name = _controller.text.trim();
                    if (name.isNotEmpty) {
                      provider.addItem({
                        'id': DateTime.now().millisecondsSinceEpoch.toString(),
                        'name': name,
                      });
                      _controller.clear();
                    }
                  },
                  child: Text('Add'),
                ),
              ],
            ),
          ),
          Expanded(
            child: Consumer<ItemProvider>(
              builder: (context, provider, _) {
                final items = provider.getItems;
                return items.isNotEmpty
                    ? ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return ListTile(
                      title: Text(item['name'] ?? 'Unnamed'),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          provider.deleteItem(item['id']);
                        },
                      ),
                      onTap: () {
                        provider.updateItem(item['id'], {
                          'name': '${item['name']} (updated)',
                        });
                      },
                    );
                  },
                )
                    : Center(child: Text("No items yet"));
              },
            ),
          ),
        ],
      ),
    );
  }
}