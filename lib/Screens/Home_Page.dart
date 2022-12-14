import 'package:flutter/material.dart';
import 'Drawer.dart';
import 'Donate_Page.dart';
import '../Models/Creator.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => HomePageState();
}



class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MyDrawer(ctx: context),
        appBar: AppBar(
          elevation: 4,
          title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Donation Tracker Dummy', style: TextStyle(fontSize: 17.5),),
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
                    MaterialPageRoute(builder: (context) => DonatePage(admin: CreatorList[index],),),
                  );
                },
                child: box(CreatorList[index].pic, CreatorList[index].name, CreatorList[index].profession),
              );
            }
        )
    );
  }
}

Widget box(String pic, String name, String profession){
  return Container(
    margin: const EdgeInsets.all(15),
    child: Column(
      children: [
        Container(
          height: 100,
          width: 170,
          padding: const EdgeInsets.all(2.5), // Border width
          decoration: BoxDecoration(color: Colors.deepPurple, borderRadius: BorderRadius.circular(15)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: SizedBox.fromSize(
              size: const Size.fromRadius(48), // Image radius
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
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold),),
                Text(profession),
              ],
            ),
            const Icon(Icons.favorite_outline_outlined)
          ],
        ),
      ],
    ),
  );
}