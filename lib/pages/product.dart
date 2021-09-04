import 'package:flutter/material.dart';

class ProductWidget extends StatefulWidget {
  final int index;
  const ProductWidget({Key? key, required this.index}) : super(key: key);

  @override
  _ProductWidgetState createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  bool isFav = false;
  _switchFav() {
    isFav = !isFav;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      width: 200,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                'assets/slider/1.png',
                width: double.infinity,
                height: 150,
                fit: BoxFit.cover,
              ),
              IconButton(
                  onPressed: _switchFav,
                  icon: Icon(
                    Icons.favorite,
                    color: isFav ? Colors.red : Colors.white,
                  ))
            ],
          ),
          Container(
            width: double.infinity,
            child: Text(
              'Item ${widget.index}',
              textAlign: TextAlign.start,
            ),
          ),
          Container(width: double.infinity, child: Text('details ${widget.index}')),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text('price ${widget.index}'), Icon(Icons.shopping_basket)],
          )
        ],
      ),
    );
  }
}
