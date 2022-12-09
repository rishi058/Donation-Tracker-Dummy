import 'package:flutter/material.dart';
import 'package:donation/Info.dart';

Widget MyDrawer(BuildContext ctx) {
  return Drawer(
    child: Container(
      color: Colors.blueGrey.shade50,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              child: Stack(
                children: [
                  Container(
                    child: Positioned(
                      bottom: 10,
                      left: 120,
                      child: Container(
                        color: Colors.deepPurple.shade200.withOpacity(0.5),
                        child: Text(
                          'Menu',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w200),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                ctx,
                MaterialPageRoute(builder: (context) => DonationPreview()),
                );
              },
              child: Container(
                height: 60,
                margin: EdgeInsets.all(5),
                child: Card(
                  elevation: 0,
                  child: ListTile(
                    leading: Icon(Icons.info_outline),
                    title: Text(
                      'My Donations',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
