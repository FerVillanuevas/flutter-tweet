import 'package:demo/screens/Profile_Screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F8FB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Home',
          style: TextStyle(color: Colors.black),
        ),
        leading: Icon(
          Icons.adb,
          color: Color(0xFF46ADF0),
        ),
        actions: [
          IconButton(
              icon: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(
                    'https://straightdopeness.files.wordpress.com/2011/07/tumblr_ljvcy6eyzb1qb7rub.jpg'),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return ProfileScreen();
                  }),
                );
              })
        ],
      ),
      body: ListView.builder(
          itemCount: 5,
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 15),
          itemBuilder: (BuildContext context, int index) {
            return TwitterCard(i: index);
          }),
    );
  }
}

class Painter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    path.moveTo(0, 90);

    /** 
     * ? Left Line 
    **/
    path.lineTo(0, size.height - 10);
    path.conicTo(0, size.height, 10, size.height, 1);
    /** 
     * ? Bottom Line 
    **/
    path.lineTo(size.width - 10, size.height);
    path.conicTo(size.width, size.height, size.width, size.height - 10, 1);

    /**
      * ? Right Line
    **/
    path.lineTo(size.width, 10);
    path.conicTo(size.width, 0, size.width - 10, 0, 1);
    /** 
     * ? Top Line 
    **/
    path.lineTo(90, 0);
    path.conicTo(62, 0, 62, 27, 1);

    /** 
     * ? Circle 
    **/
    path.moveTo(62, 27);
    path.conicTo(62, 62, 27, 62, 1);
    path.conicTo(0, 62, 0, 90, 1);

    /** 
     * ?  Shadow of the path 
    **/
    canvas.drawShadow(path, Colors.grey.withAlpha(10), 10.0, false);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class TwitterCard extends StatelessWidget {
  final int i;

  TwitterCard({this.i});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 13),
      child: CustomPaint(
        painter: Painter(),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8, right: 8),
                child: Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(100),
                      spreadRadius: 0,
                      blurRadius: 10,
                      offset: Offset(2, 4), // changes position of shadow
                    ),
                  ], borderRadius: BorderRadius.circular(60)),
                  clipBehavior: Clip.hardEdge,
                  child: Image.network(
                    'https://straightdopeness.files.wordpress.com/2011/07/tumblr_ljvcy6eyzb1qb7rub.jpg',
                    width: 54,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'The New York Times',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text('@nytimes')
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          Container(
            padding: EdgeInsets.all(12.0),
            child: Column(
              children: [
                Text(
                  'The decision to cancel the 9/11 tribute lights in Manhattan was made because "the health risks during the pandemic were far too great" for the crew of about 40 stagehands and electricians',
                  style: TextStyle(fontSize: 14, color: Color(0xFF3F3D56)),
                ),
                if (i % 2 == 0) imageBox(),

                /* END: Image */
              ],
            ),
          ),
          buildBar()
        ]),
      ),
    );
  }

  Widget imageBox() {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
              'https://i.pinimg.com/originals/7b/c1/24/7bc12410da0124244008b81c5f9e37ec.jpg'),
        )
      ],
    );
  }

  Row buildBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconText(
          Icon(Icons.question_answer, color: Color(0xFF40AFF4)),
          text: Text('39'),
        ),
        IconText(Icon(Icons.loop, color: Color(0xFF00D05E)), text: Text('80')),
        IconText(
          Icon(Icons.favorite, color: Color(0xFFFF0451)),
          text: Text('290'),
        ),
        IconButton(
          icon: Icon(Icons.share, color: Color(0xFFA6A6B0)),
          onPressed: () {},
        )
      ],
    );
  }
}

class IconText extends StatelessWidget {
  final Icon _icon;
  final Text text;

  IconText(this._icon, {this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _icon,
        Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: text,
        )
      ],
    );
  }
}
