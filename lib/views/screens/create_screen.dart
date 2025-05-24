import 'package:flutter/material.dart';

class CreationsScreen extends StatelessWidget {
  const CreationsScreen({Key? key}) : super(key: key);

  void onBackTap(BuildContext context) {
    Navigator.pop(context);
  }

  void onEditTap() {
    print('Edit tapped');
  }

  void onPublishTap() {
    print('Publish tapped');
  }

  void onCreateNewTap() {
    print('Create New tapped');
  }

  void onUpdateTap() {
    print('Update tapped');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2F3A54),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2F3A54),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => onBackTap(context),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12.0),
            child: CircleAvatar(
              backgroundColor: Colors.orange,
              child: Icon(Icons.person, color: Colors.white),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Shibuli678\'s creations',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            _buildSectionHeader('Ongoing creations'),
            _buildOngoingCard(),
            const SizedBox(height: 12),
            _buildCreateNewButton(),
            const SizedBox(height: 16),
            _buildSectionHeader('Published creations'),
            _buildPublishedCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white70,
      ),
    );
  }

  Widget _buildOngoingCard() {
    return Card(
      color: const Color(0xFFDAE0EC),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Placeholder(fallbackHeight: 80), // Replace with image if needed
            const SizedBox(height: 8),
            const Text('Title', style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('About'),
            const SizedBox(height: 8),
            Row(
              children: [
                ElevatedButton(onPressed: onEditTap, child: const Text('Comic')),
                const SizedBox(width: 8),
                ElevatedButton(onPressed: onPublishTap, child: const Text('Book')),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPublishedCard() {
    return Card(
      color: const Color(0xFFDAE0EC),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Placeholder(fallbackHeight: 80),
            const SizedBox(height: 8),
            const Text(
              'All about the court',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Text('Basketball court reviewer for colleges.'),
            const SizedBox(height: 8),
            Row(
              children: [
                ElevatedButton(onPressed: onEditTap, child: const Text('Edit')),
                const SizedBox(width: 8),
                ElevatedButton(onPressed: onUpdateTap, child: const Text('Update')),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCreateNewButton() {
    return Center(
      child: ElevatedButton.icon(
        onPressed: onCreateNewTap,
        icon: const Icon(Icons.add),
        label: const Text('Create New'),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange,
        ),
      ),
    );
  }
}
