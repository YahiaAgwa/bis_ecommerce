import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/pages/product.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _cartPressed() {}

  List<dynamic> _listItems = [
    {'title': 'Home', 'icon': Icons.home},
    {'title': 'Categories', 'icon': Icons.category},
    {'title': 'Offers', 'icon': Icons.money},
    {'title': 'Brands', 'icon': Icons.branding_watermark},
    {'title': 'Contact Us', 'icon': Icons.call},
    {'title': 'About Us', 'icon': Icons.info},
    {'title': 'Settings', 'icon': Icons.settings}
  ];
  TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: Container(
            height: 40,
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(5),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration.collapsed(hintText: 'Search'),
                  ),
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.search))
              ],
            ),
          ),
        ),
        title: Image.asset(
          'assets/logo.png',
          width: 200,
        ),
        actions: [
          IconButton(
            onPressed: _cartPressed,
            icon: Icon(Icons.shopping_basket),
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              height: 250,
              color: Colors.blue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      radius: 40,
                    ),
                    title: Text('Hell Guest'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(onPressed: () {}, child: Text('Login')),
                        Switch(
                          value: true,
                          onChanged: (val) {},
                          activeColor: Colors.green,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _listItems.length,
                itemBuilder: (context, i) => ListTile(
                  leading: Icon(_listItems[i]['icon']),
                  title: Text(_listItems[i]['title']),
                ),
              ),
            ),
            ListTile(
              title: Text('Terms'),
              leading: Icon(Icons.shield),
            )
          ],
        ),
      ),
      body: ListView(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: 200.0,
              viewportFraction: 1,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 1),
            ),
            items: [1, 2, 3].map(
              (value) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage('assets/slider/$value.png'), fit: BoxFit.cover),
                      ),
                    );
                  },
                );
              },
            ).toList(),
          ),
          Container(
            height: 120,
            padding: EdgeInsets.all(10),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(10, (index) => index)
                  .map((e) => Padding(
                        // test
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage('assets/slider/${(e % 3) + 1}.png'),
                            ),
                            Text('Category $e')
                          ],
                        ),
                      ))
                  .toList(),
            ),
          ),
          Container(
            height: 120,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage('assets/slider/1.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: 260,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(10, (index) => index).map((e) => ProductWidget(index: e)).toList(),
            ),
          )
        ],
      ),
    );
  }
}
