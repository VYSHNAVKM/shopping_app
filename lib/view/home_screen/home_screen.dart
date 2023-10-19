import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/provider/shopping_app_provider.dart';
import 'package:shopping_app/view/cart_screen/cart_screen.dart';
import 'package:shopping_app/view/item_screen/item_screen.dart';
import 'package:shopping_app/view/home_screen/widgets/items_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text('ITEMS'),
          leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.person,
                size: 30,
              )),
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
      body: Column(children: [
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              child: SearchBar(
                  hintText: 'Search anything',
                  backgroundColor:
                      MaterialStatePropertyAll(Colors.grey.shade300),
                  leading: Icon(
                    Icons.search,
                    size: 30,
                  ),
                  shadowColor: MaterialStatePropertyAll(Colors.black)),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(10)),
              height: 50,
              width: 50,
              child: Icon(
                Icons.menu,
                color: Colors.white,
              ),
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 40,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(10)),
                    height: 40,
                    width: 100,
                    child: Center(
                      child: Text(
                        context.read<ShoppingAppProvider>().categorylist[index],
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(
                      width: 10,
                    ),
                itemCount: 4),
          ),
        ),
        Expanded(
          child: GridView.builder(
            padding: EdgeInsets.all(10),
            itemCount: 9,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 15, mainAxisSpacing: 15),
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ItemScreen(
                        index: index,
                      ),
                    ));
                  },
                  child: ItemContainer(
                    image:
                        context.read<ShoppingAppProvider>().items[index].images,
                  ));
            },
          ),
        ),
      ]),
    );
  }
}
