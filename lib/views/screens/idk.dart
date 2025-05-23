import 'package:flutter/material.dart';
import 'package:read_hear/views/screens/homescreen1.dart';

class BookReaderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Reader',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF2B3E5E),
        primaryColor: Colors.indigo,
      ),
      home: ReaderScreen(),
    );
  }
}

class ReaderScreen extends StatelessWidget {
  final String bookTitle = "How Doctors Think";
  final String author = "ApTheHack45";
  final String bookDescription =
      "How Doctors Think is a book released in March 2007 by Jerome Groopman, the Dina and Raphael Recanati Chair of Medicine at Harvard Medical School...";

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
