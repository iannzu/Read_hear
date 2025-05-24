import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:read_hear/views/screens/message.dart';
import 'package:read_hear/views/screens/idk.dart';
import 'package:read_hear/views/Profile.dart';
import 'package:read_hear/views/screens/create_screen.dart';

class BookApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bookshelf',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF2B3E5E),
        primaryColor: Colors.indigo,
      ),
      home: BookshelfScreen(),
    );
  }
}

class BookshelfScreen extends StatelessWidget {
  final List<Map<String, String>> books = [
    {
      'title': 'How Doctors Think',
      'author': 'Jerome Groopman',
      'details':
          'ASIN: B0038B7R74\nPublished: Nov 26, 2019\nLanguage: English\n...',
    },
    {
      'title': 'Harry Potter',
      'author': 'J.K. Rowling',
      'details':
          'Originally published: June 26, 1997\nGenre: Fantasy Fiction\n...',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFF1E2A47)),
              child: Icon(Icons.person, size: 60, color: Colors.orange),
            ),
            ListTile(
              title: Text('Profile'),
              onTap:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Profile()),
                  ),
            ),
            ListTile(
              title: Text('Create'),
              onTap:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CreationsScreen()),
                  ),
            ),
            ListTile(
              title: Text('Messages'),
              onTap:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Message()),
                  ),
            ),
            ListTile(
              title: Text('Savelist'),
              onTap:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => PlaceholderScreen(title: 'Savelist'),
                    ),
                  ),
            ),
            ListTile(
              title: Text('Settings'),
              onTap:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => PlaceholderScreen(title: 'Settings'),
                    ),
                  ),
            ),
            ListTile(
              title: Text('Assistance'),
              onTap:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => PlaceholderScreen(title: 'Assistance'),
                    ),
                  ),
            ),
            ListTile(
              title: Text('Help'),
              onTap:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PlaceholderScreen(title: 'Help'),
                    ),
                  ),
            ),
            ListTile(
              title: Text('Log out'),
              onTap:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PlaceholderScreen(title: 'Log out'),
                    ),
                  ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Bookshelf'),
        actions: [
          IconButton(icon: Icon(LineAwesomeIcons.book), onPressed: () {}),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
          ),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(12),
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            margin: EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => ReaderScreen(
                          bookTitle: book['title']!,
                          author: book['author']!,
                          bookDescription: book['details']!,
                        ),
                  ),
                );
              },
              title: Text(
                book['title']!,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(book['details']!),
              trailing: Icon(Icons.volume_up),
            ),
          );
        },
      ),
    );
  }
}

class ReaderScreen extends StatelessWidget {
  final String bookTitle;
  final String author;
  final String bookDescription;

  const ReaderScreen({
    Key? key,
    required this.bookTitle,
    required this.author,
    required this.bookDescription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(bookTitle),
        actions: [IconButton(icon: Icon(Icons.favorite), onPressed: () {})],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/book-1.png',
                    width: 120,
                    height: 180,
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Author: $author",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(bookDescription, style: TextStyle(fontSize: 14)),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton.icon(
                icon: Icon(Icons.menu_book),
                label: Text("Read now!"),
                onPressed: () {},
              ),
            ),
            SizedBox(height: 20),
            Divider(),
            Text(
              "Comments",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            CommentWidget(
              username: "GoatMeh",
              comment:
                  "This got me wanna be a doctor. FREE GOAT MILK FOR EVERYONE!!",
            ),
            CommentWidget(
              username: "BusinessMeow",
              comment: "The book is great. All change BusMeow to DocMeow now.",
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                hintText: 'Add a comment...',
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CommentWidget extends StatelessWidget {
  final String username;
  final String comment;

  CommentWidget({required this.username, required this.comment});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(username, style: TextStyle(fontWeight: FontWeight.bold)),
          Text(comment),
        ],
      ),
    );
  }
}

class PlaceholderScreen extends StatelessWidget {
  final String title;

  const PlaceholderScreen({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text('This is the $title screen.')),
    );
  }
}
