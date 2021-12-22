import 'package:flutter/material.dart';
import 'package:mounts_of_the_word/bottom_bar_item.dart';
import 'package:mounts_of_the_word/category_model.dart';
import 'package:mounts_of_the_word/mount_model.dart';

final Color mainColor = Color(0xFFFF5656);

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MountsApp() //SplashPage(),
    )
  );
}

class SplashPage extends StatelessWidget{
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(
        const Duration(seconds: 3),(){
          Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MountsApp()));
        }
        );
    return Container(
      color: mainColor,
      child: Stack(
        children:  [
          const Align(
            alignment: Alignment.center,
            child: Icon(Icons.terrain, color: Colors.white,size: 90,),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.only(bottom: 80),
              child: const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MountsApp extends StatelessWidget{
  const MountsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: mainColor),
        title: Center(
          child: Icon(
            Icons.terrain,
            color: mainColor,
            size: 40,
          ),
        ),
        actions: const [
          SizedBox(width: 40, height: 40)
        ],
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.red,
          padding: const EdgeInsets.all(20),
          child: const Align(
            alignment: Alignment.bottomLeft,
            child: Icon(
              Icons.terrain,
              color: Colors.white,
              size: 80,
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          AppHeader(),
          AppSearch(),
          Expanded(child: AppMountListView()),
          AppCategoryList(),
          AppBottomBar()
        ],
      )
    );
  }

}

class AppHeader extends StatelessWidget{
  const AppHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
      child: Row(
        children: [
          ClipOval(
            child: Image.network(
                'https://avatars.githubusercontent.com/u/5081804?v=4', // replace if you want
                width: 50,
                height: 50,
                fit: BoxFit.cover
            ),
          ),
          const SizedBox(width: 20,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              const Text(
                "Hello, Victor",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold
                ),
              ),
              Text(
                "Good Morning",
                style: TextStyle(
                  color: mainColor,
                  fontSize: 12
                ),
              )
            ],
          )
        ],
      )
    );
  }

}

class AppSearch extends StatelessWidget{
  const AppSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          const Text(
            "Discover",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w900
            ),
          ),
          const SizedBox(height: 20,),
          Row(
            children: [
              Expanded(
                  child: Container(
                    height: 50,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 10,),
                        Text("Search", style: TextStyle(color: Colors.grey),)
                      ],
                    ),
                  )
              ),
              Container(
                width: 50,
                height: 50,
                margin: const EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                    color: mainColor,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: const Icon(
                  Icons.tune,
                  color: Colors.white,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

}

class AppMountListView extends StatelessWidget{
  const AppMountListView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: mountItems.length,
        itemBuilder: (context, index){
          var item = mountItems[index];
          return Container(
            width: 150,
            alignment: Alignment.bottomLeft,
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: NetworkImage(item.path),
                fit: BoxFit.cover
              )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  item.location,
                  style: const TextStyle(
                    color: Colors.white
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

}

class AppCategoryList extends StatelessWidget{
  const AppCategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var items = categories;
    return Container(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                const Text(
                  "Category",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  "See more",
                  style: TextStyle(
                    color: mainColor,
                    fontSize: 12,
                    fontWeight: FontWeight.bold
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 100,
            margin: const EdgeInsets.only(left: 10),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              itemBuilder: (context, index) {
                var item = items[index];
                return Container(
                  width: 100,
                  margin: const EdgeInsets.only(top: 10, right: 10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.withOpacity(0.2), width: 2),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(item.icon, color: mainColor,),
                      Text(
                        item.category,
                        style: const TextStyle(
                          fontSize: 12,
                            fontWeight: FontWeight.bold
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

}

class AppBottomBar extends StatefulWidget{
  const AppBottomBar({Key? key}) : super(key: key);

  @override
  AppBottomBarState createState() => AppBottomBarState();

}

class AppBottomBarState extends State<AppBottomBar> {

  List<AppBottomBarItem> items = [
    AppBottomBarItem(icon: Icons.home, label: 'Home', isSelected: true),
    AppBottomBarItem(icon: Icons.explore, label: 'Explore', isSelected: false),
    AppBottomBarItem(icon: Icons.turned_in_not, label: 'Tag', isSelected: false),
    AppBottomBarItem(icon: Icons.person_outline,label: 'Profile', isSelected: false)
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.all(10),
      decoration:  BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 10,
          offset: Offset.zero
        )]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(items.length, (index) {
          AppBottomBarItem item = items[index];
          if (item.isSelected) {
            return Container(
              padding: const EdgeInsets.only(left: 15, top: 5, right: 15,bottom: 5),
              decoration: BoxDecoration(
                color: mainColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Icon(item.icon, color: Colors.white,),
                  const SizedBox(width: 5,),
                  Text(item.label, style: const TextStyle(color: Colors.white),)
                ],
              ),
            );
          } else {
            return IconButton(
              icon: Icon(item.icon),
              onPressed: () {
                setState(() {
                  for (var itemLoop in items) {
                    itemLoop.isSelected = itemLoop == item;
                  }
                });
              }
            );
          }
        }),
      ),
    );
  }
}
