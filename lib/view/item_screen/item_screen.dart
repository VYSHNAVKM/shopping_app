import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/provider/shopping_app_provider.dart';
import 'package:shopping_app/view/cart_screen/cart_screen.dart';

class ItemScreen extends StatelessWidget {
  const ItemScreen({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text('ITEMS'),
          actions: [
            context.read<ShoppingAppProvider>().cartcount == 0
                ? IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => CartScreen(),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.shopping_cart,
                      size: 30,
                    ))
                : Stack(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => CartScreen(),
                            ));
                          },
                          icon: Icon(
                            Icons.shopping_cart,
                            size: 40,
                          )),
                      Positioned(
                          right: 3,
                          child: CircleAvatar(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                            radius: 10,
                            child: Center(
                                child: Text(
                                    '${context.watch<ShoppingAppProvider>().cartcount}')),
                          ))
                    ],
                  ),
          ]),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Container(
              height: 300,
              width: 350,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(context
                        .read<ShoppingAppProvider>()
                        .items[index]
                        .images),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Stack(alignment: Alignment(1, -1), children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite_border,
                        )),
                  ),
                ]),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '₹1500',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                Text(
                  '4.5/5',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 5,
                ),
                Text('[45 reviews]')
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Text(context.read<ShoppingAppProvider>().items[index].description),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Price',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "${context.watch<ShoppingAppProvider>().price} Rs ",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ],
                    ),
                    CircleAvatar(
                      child: IconButton(
                          onPressed: () {
                            context.read<ShoppingAppProvider>().addTocart(
                                context
                                    .read<ShoppingAppProvider>()
                                    .items[index]);
                          },
                          icon: Icon(Icons.add)),
                    ),
                    CircleAvatar(
                      child: IconButton(
                          onPressed: context
                                      .watch<ShoppingAppProvider>()
                                      .items[index]
                                      .count ==
                                  0
                              ? null
                              : () {
                                  context
                                      .read<ShoppingAppProvider>()
                                      .removeFromcart(context
                                          .read<ShoppingAppProvider>()
                                          .items[index]);
                                },
                          icon: Icon(Icons.remove)),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
                  Colors.black,
                ),
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CartScreen(),
                ));
              },
              child: Text(
                'Add to Cart',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
