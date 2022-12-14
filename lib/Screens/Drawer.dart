import 'package:flutter/material.dart';
import 'package:donation/Screens/Donations_Table_Page.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import '../main.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key, required this.ctx})
      : super(key: key);

  final BuildContext ctx;

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {

  void toggleSwitch(bool value){
    if(isDark==true){
      setState(() {
        isDark=false;
        AdaptiveTheme.of(widget.ctx).setLight();
      });
    }
    else{
      setState(() {
        isDark=true;
        AdaptiveTheme.of(widget.ctx).setDark();
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 200,
              width: double.infinity,
              child: Stack(
                children: [
                  Positioned(
                    bottom: 10,
                    left: 120,
                    child: Container(
                      color: Colors.deepPurple.shade200.withOpacity(0.5),
                      child: const Text(
                        'Menu',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w200),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  widget.ctx,
                  MaterialPageRoute(builder: (context) => const DonationPreview()),
                );
              },
              child: Container(
                height: 60,
                margin: const EdgeInsets.all(5),
                child: Card(
                  color: Theme.of(widget.ctx).primaryColorLight,
                  elevation: 0,
                  child: const ListTile(
                    leading: Icon(Icons.info_outline),
                    title: Text(
                      'My Donations',
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 60,
              margin: const EdgeInsets.all(5),
              child: Card(
                color: Theme.of(widget.ctx).primaryColorLight,
                elevation: 0,
                child: ListTile(
                  leading: const Icon(Icons.dark_mode_outlined),
                  title: const Text(
                    'Dark Mode',
                  ),
                  trailing: Switch(
                      value: isDark,
                      onChanged: (val){toggleSwitch(val);}
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
