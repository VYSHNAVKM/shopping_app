import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/provider/shopping_app_provider.dart';
import 'package:shopping_app/view/home_screen/home_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Cart',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.black,
          ),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
      ),
      body: context.watch<ShoppingAppProvider>().cartcount == 0
          ? Center(
              child: Text(
                'Empty Cart',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount:
                        context.read<ShoppingAppProvider>().cartitemCount,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.99,
                              color: Colors.black,
                              child: Row(
                                children: [
                                  Container(
                                    height: 200,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(context
                                                .read<ShoppingAppProvider>()
                                                .cartitems[index]
                                                .images),
                                            fit: BoxFit.cover)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, left: 25),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "Item Count : ${context.watch<ShoppingAppProvider>().cartitems[index].count} ",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17,
                                                  color: Colors.white),
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                context
                                                    .read<ShoppingAppProvider>()
                                                    .deleteFromCart(
                                                        index,
                                                        context
                                                            .read<
                                                                ShoppingAppProvider>()
                                                            .cartitems[index]);
                                              },
                                              icon: Icon(
                                                Icons.delete_outlined,
                                                color: Colors.white,
                                                size: 40,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 55),
                                          child: Row(
                                            children: [
                                              CircleAvatar(
                                                backgroundColor: Colors.white,
                                                radius: 20,
                                                child: IconButton(
                                                    onPressed: () {
                                                      context
                                                          .read<
                                                              ShoppingAppProvider>()
                                                          .addTocart(context
                                                              .read<
                                                                  ShoppingAppProvider>()
                                                              .cartitems[index]);
                                                    },
                                                    icon: Icon(
                                                      Icons.add,
                                                      size: 20,
                                                    )),
                                              ),
                                              SizedBox(
                                                width: 30,
                                              ),
                                              CircleAvatar(
                                                backgroundColor: Colors.white,
                                                radius: 20,
                                                child: IconButton(
                                                    onPressed: context
                                                                .watch<
                                                                    ShoppingAppProvider>()
                                                                .cartitems[
                                                                    index]
                                                                .count ==
                                                            0
                                                        ? null
                                                        : () {
                                                            context
                                                                .read<
                                                                    ShoppingAppProvider>()
                                                                .removeFromcart(context
                                                                    .read<
                                                                        ShoppingAppProvider>()
                                                                    .cartitems[index]);
                                                          },
                                                    icon: Icon(
                                                      Icons.remove,
                                                      size: 20,
                                                    )),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        ElevatedButton(
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStatePropertyAll(
                                                        Colors.white)),
                                            onPressed: () {},
                                            child: Text(
                                              'Make a payment',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17,
                                                  color: Colors.black),
                                            ))
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  height: 50,
                  color: Colors.black,
                  child: Center(
                    child: context.watch<ShoppingAppProvider>().price == 0
                        ? InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => HomeScreen(),
                              ));
                            },
                            child: Text(
                              "Continue Shopping",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          )
                        : Text(
                            "PAY  ${context.watch<ShoppingAppProvider>().price} Rs",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                  ),
                ),
              ],
            ),
    );
  }
}
