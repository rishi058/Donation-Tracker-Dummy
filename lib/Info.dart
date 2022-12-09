import 'package:flutter/material.dart';
import 'My_Donations.dart';

class DonationPreview extends StatelessWidget {
  const DonationPreview({Key? key}) : super(key: key);

  Widget createTable() {
    List<TableRow> rows = [];
    for (int i = 0; i < My_Donations.length; i++) {
      rows.add(TableRow(children: [
        Container(
            padding: EdgeInsets.all(10),
            child: Center(child: Text(My_Donations[i].creator_id.toString()))),
        Container(
            padding: EdgeInsets.all(10),
            child: Center(child: Text(My_Donations[i].currency))),
        Container(
            padding: EdgeInsets.all(10),
            child: Center(child: Text(My_Donations[i].amount.toString()))),
        Container(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Text(My_Donations[i].name),
            )),
        Container(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Text(My_Donations[i].message),
            )),
      ]));
    }
    return Table(
        border: TableBorder.all(color: Colors.deepPurple, width: 2),
        columnWidths: const {
          0: FlexColumnWidth(0.7),
          1: FlexColumnWidth(0.7),
          2: FlexColumnWidth(2),
          3: FlexColumnWidth(3),
          4: FlexColumnWidth(4),
        },
        children: rows);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My Donations'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.all(5),
                width: double.infinity,
                child: Table(
                  border: TableBorder.all(color: Colors.black, width: 2),
                  columnWidths: const {
                    0: FlexColumnWidth(1.5),
                    1: FlexColumnWidth(1.5),
                    2: FlexColumnWidth(1.5),
                    3: FlexColumnWidth(2),
                    4: FlexColumnWidth(2),
                  },
                  children: [
                    TableRow(children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        child: const Center(
                          child: Text('Creator \n Id', textAlign: TextAlign.center,),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(2),
                        child: Center(
                          child: Text('Currency'),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(7),
                        child: Center(
                          child: Text('Amount'),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Center(
                          child: Text('Name'),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Center(
                          child: Text('Message'),
                        ),
                      ),
                    ]),
                  ],
                ),
              ),
              SizedBox(height: 5,),
              My_Donations.length==0 ? Center(child: Text('No Donations Made. .  .', style: TextStyle(color: Colors.deepPurple),)): Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.all(5),
                width: double.infinity,
                child: createTable(),
              ),
            ],
          ),
        ));
  }
}
