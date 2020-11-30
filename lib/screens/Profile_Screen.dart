import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F8FB),
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: PersistenHeader(),
            pinned: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Column(
                children: [Text('Hola'), Text('Hola'), Text('Hola')],
              )
            ]),
          )
        ],
      ),
    );
  }
}

class PersistenHeader extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.network(
          'https://static01.nyt.com/newsgraphics/images/icons/defaultPromoCrop.png',
          fit: BoxFit.cover,
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: CustomPaint(
            painter: Painter(),
            child: Container(
              color: Colors.transparent,
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(bottom: 10, left: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: Image.network(
                  'https://straightdopeness.files.wordpress.com/2011/07/tumblr_ljvcy6eyzb1qb7rub.jpg',
                  height: 54,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate _) => true;

  @override
  double get maxExtent => 172.0;

  @override
  double get minExtent => 74.0;
}

class Painter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint()
      ..color = Color(0xFFF4F8FB)
      ..style = PaintingStyle.fill;

    /* path.moveTo(0, 40);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 40);
    path.lineTo(114, 40);
    path.conicTo(110, 74, 74, 74, 1);
    path.conicTo(34, 74, 30, 40, 1);
    path.lineTo(0, 40); */

    path.moveTo(0, 27);
    path.quadraticBezierTo(10, 30, 15, 38);
    path.quadraticBezierTo(47, 74, 79, 38);
    path.quadraticBezierTo(84, 30, 94, 27);
    path.lineTo(size.width, 27);
    path.lineTo(size.width, size.height + 1);
    path.lineTo(0, size.height + 1);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
