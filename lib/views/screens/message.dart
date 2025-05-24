import 'package:flutter/material.dart';
import 'package:read_hear/views/screens/homescreen1.dart'; // Replace with actual import path for BookApp

class Message extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Message> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1C1C2E),
      body: SafeArea(
        child: Column(
          children: [
            // Back button at top-left
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  label: Text(
                    'Back',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => BookApp()),
                    );
                  },
                ),
              ),
            ),

            _top(),
            _body(),
          ],
        ),
      ),
    );
  }

  Widget _top() {
    return Container(
      padding: EdgeInsets.only(top: 30, left: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Chat with \nyour friends',
            style: TextStyle(
                fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey[800],
                ),
                child: Icon(
                  Icons.search,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 15),
              Expanded(
                child: Container(
                  height: 100,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      return Avatar(
                        margin: EdgeInsets.only(right: 15),
                        image: 'assets/images/${index + 1}.jpg',
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _body() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(45), topRight: Radius.circular(45)),
          color: Color(0xFF2C2C3E),
        ),
        child: ListView(
          padding: EdgeInsets.only(top: 35),
          physics: BouncingScrollPhysics(),
          children: [
            _itemChats('assets/images/2.jpg', 'Johnny Doe',
                'Lorem Ipsum is simply dummy text', '08.10'),
            _itemChats('assets/images/4.jpg', 'Adrian',
                'Excepteur sint occaecat cupidatat non proident', '03.19'),
            _itemChats('assets/images/5.jpg', 'Fiona', 'Hii... 😎', '02.53'),
            _itemChats('assets/images/6.jpg', 'Emma',
                'Consectetur adipiscing elit', '11.39'),
            _itemChats('assets/images/7.jpg', 'Alexander',
                'Duis aute irure dolor in reprehenderit', '00.09'),
          ],
        ),
      ),
    );
  }

  Widget _itemChats(String avatar, String name, String chat, String time) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ChatPage(name: name, avatar: avatar),
        ));
      },
      child: Card(
        color: Color(0xFF3A3A4D),
        margin: EdgeInsets.symmetric(vertical: 20),
        elevation: 0,
        child: Row(
          children: [
            Avatar(margin: EdgeInsets.only(right: 20), size: 60, image: avatar),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(name,
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white)),
                      Text(time,
                          style: TextStyle(
                              color: Colors.grey.shade400,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    chat,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.grey.shade300, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Avatar extends StatelessWidget {
  final double size;
  final String image;
  final EdgeInsets margin;

  const Avatar({
    required this.image,
    this.size = 50,
    this.margin = const EdgeInsets.all(0),
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class ChatPage extends StatelessWidget {
  final String name;
  final String avatar;

  const ChatPage({required this.name, required this.avatar, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1C1C2E),
      appBar: AppBar(
        backgroundColor: Color(0xFF2C2C3E),
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(avatar),
            ),
            SizedBox(width: 10),
            Text(name),
          ],
        ),
      ),
      body: Center(
        child: Text(
          'Chat with $name',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
