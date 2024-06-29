import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping App',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('나비'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.green[100],
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('박지완 님이 지구를 아껴준 시간 🌱'),
                Text('SILVER 등급 (다음등급까지 30P)'),
              ],
            ),
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildCategoryIcon(Icons.local_shipping, '배송상품'),
              _buildCategoryIcon(Icons.star, '베스트 상품'),
              _buildCategoryIcon(Icons.new_releases, '특가 상품'),
              _buildCategoryIcon(Icons.card_giftcard, '마일리지'),
              _buildCategoryIcon(Icons.card_membership, '임박상품'),
            ],
          ),
          SizedBox(height: 16.0),
          _buildAdBanner(),
          SizedBox(height: 16.0),
          _buildPopularItemsSection('남성 의류 인기 순위', [
            'assets/tshirt1.png',
            'assets/tshirt2.png',
            'assets/tshirt3.png',
          ]),
          _buildPopularItemsSection('남성 의류 인기 순위', [
            'assets/tshirt1.png',
            'assets/tshirt2.png',
            'assets/tshirt3.png',
          ]),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '검색',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '내 정보',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildCategoryIcon(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, size: 40.0),
        SizedBox(height: 8.0),
        Text(label),
      ],
    );
  }

  Widget _buildAdBanner() {
    return Container(
      color: Colors.blue[100],
      padding: EdgeInsets.all(16.0),
      child: Row(
        children: [
          Icon(Icons.diamond, size: 40.0),
          SizedBox(width: 16.0),
          Text('주 4.5일 꿀근무 어때요?'),
        ],
      ),
    );
  }

  Widget _buildPopularItemsSection(String title, List<String> imagePaths) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
        SizedBox(height: 8.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: imagePaths.map((path) {
            return Image.asset(path, width: 100.0, height: 100.0);
          }).toList(),
        ),
      ],
    );
  }
}