import 'package:flutter/material.dart';
import 'Drawer.dart';
import 'Creator.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'Donate_Page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Donation Tracker',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          },
        ),
      ),
      home: const HomePage(),
    );
  }
}

//*****************************************************************************

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => HomePageState();
}



class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(context),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Donation Tracker Dummy'),
              CircleAvatar(
                radius: 17, // Image radius
                backgroundImage: NetworkImage('https://m.media-amazon.com/images/I/91u1OKpJzWL._SL1500_.jpg'),
              ),
            ]
        ),
      ),

      body: MasonryGridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 2,
          crossAxisSpacing: 10,
          itemCount: CreatorList.length,
          itemBuilder: (context, index){
              return InkWell(
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Donate_Page(admin: CreatorList[index],),),
                    );
                  },
                  child: Box(CreatorList[index].pic, CreatorList[index].name, CreatorList[index].profession),
              );
          }
      )
    );
  }
}

Widget Box(String pic, String name, String profession){
  return Container(
    margin: EdgeInsets.all(15),
    child: Column(
      children: [
        Container(
          height: 100,
          width: 170,
          padding: EdgeInsets.all(2.5), // Border width
          decoration: BoxDecoration(color: Colors.deepPurple, borderRadius: BorderRadius.circular(15)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: SizedBox.fromSize(
              size: Size.fromRadius(48), // Image radius
              child: Image.network(pic, fit: BoxFit.cover),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: TextStyle(fontWeight: FontWeight.bold),),
                Text(profession),
              ],
            ),
            Icon(Icons.favorite_outline_outlined)
          ],
        ),
      ],
    ),
  );
}