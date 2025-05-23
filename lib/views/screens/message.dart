import 'package:flutter/material.dart';

class Message extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Message> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 35, 44, 96),
      body: SafeArea(
        child: Column(
          children: [
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
                  color: Colors.black12,
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
          color: Colors.white,
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
                              fontSize: 17, fontWeight: FontWeight.bold)),
                      Text(time,
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    chat,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.bold),
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

class ChatPage extends StatefulWidget {
  final String name;
  final String avatar;

  const ChatPage({required this.name, required this.avatar});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                _topChat(),
                _bodyChat(),
                SizedBox(height: 120),
              ],
            ),
            _formChat(),
          ],
        ),
      ),
    );
  }

  Widget _topChat() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Icon(Icons.arrow_back_ios, size: 25, color: Colors.white),
              ),
              SizedBox(width: 10),
              Avatar(image: widget.avatar, size: 40),
              SizedBox(width: 10),
              Text(widget.name,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ],
          ),
          Row(
            children: [
              _circleButton(Icons.call),
              SizedBox(width: 10),
              _circleButton(Icons.videocam),
            ],
          )
        ],
      ),
    );
  }

  Widget _circleButton(IconData icon) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.black12,
      ),
      child: Icon(icon, size: 25, color: Colors.white),
    );
  }

  Widget _bodyChat() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(45), topRight: Radius.circular(45)),
          color: Colors.white,
        ),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            _itemChat(1, widget.avatar,
                'Hello! How are you?', '18.00'),
            _itemChat(0, null, 'I\'m fine, thanks!', '18.01'),
            _itemChat(1, widget.avatar,
                'Let’s meet tomorrow.', '18.02'),
          ],
        ),
      ),
    );
  }

  Widget _itemChat(int chat, String? avatar, String message, String time) {
    return Row(
      mainAxisAlignment:
          chat == 0 ? MainAxisAlignment.end : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        avatar != null
            ? Avatar(image: avatar, size: 50)
            : Text(time, style: TextStyle(color: Colors.grey.shade400)),
        Flexible(
          child: Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 20),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: chat == 0
                  ? Colors.indigo.shade100
                  : Colors.indigo.shade50,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
                bottomLeft:
                    chat == 0 ? Radius.circular(30) : Radius.circular(0),
                bottomRight:
                    chat == 1 ? Radius.circular(30) : Radius.circular(0),
              ),
            ),
            child: Text(message),
          ),
        ),
        chat == 1
            ? Text(time, style: TextStyle(color: Colors.grey.shade400))
            : SizedBox(),
      ],
    );
  }

  Widget _formChat() {
    return Positioned(
      bottom: 0,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 120,
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        color: Colors.white,
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Type your message...',
            suffixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _suffixIcon(Icons.mic, Colors.grey.shade300, Colors.indigo),
                SizedBox(width: 10),
                _suffixIcon(Icons.send_rounded, Colors.indigo, Colors.white),
              ],
            ),
            filled: true,
            fillColor: Colors.blueGrey[50],
            contentPadding: const EdgeInsets.all(20),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueGrey[50]!),
              borderRadius: BorderRadius.circular(25),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueGrey[50]!),
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ),
      ),
    );
  }

  Widget _suffixIcon(IconData icon, Color bgColor, Color iconColor) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Icon(icon, color: iconColor),
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
