import 'package:flutter/material.dart';
import 'Creator.dart';
import 'My_Donations.dart';
import 'main.dart';


class Donate_Page extends StatefulWidget {
  const Donate_Page({Key? key, required this.admin})
      : super(key: key);

  final Creator admin;

  @override
  State<Donate_Page> createState() => Donate_PageState();
}

class Donate_PageState extends State<Donate_Page> {

  String name = "";
  String pic = "";

  TextEditingController titleController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  void submit(){
    if(amountController.text.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Amount must be a greater than zero'),
      ));
    }
    else{
      My_Donations.add(Donation(creator_id: widget.admin.id, currency: dropdownvalue, amount: int.parse(price), name: titleController.text, message: descriptionController.text));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Successfully donated to ' + widget.admin.name),
      ));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage(),),
      );
    }
  }

  @override
  void initState() {
    name = widget.admin.name ;
    pic = widget.admin.pic;
    super.initState();
  }

  String dropdownvalue = '\$';
  String price = "0";

  Widget dropdown() {
    return DropdownButton<String>(
      isExpanded: false,
      value: dropdownvalue,
      elevation: 10,
      onChanged: (String? newValue) {
        setState(() {
          dropdownvalue = newValue!;
        });
      },
      items: <String>['\$', '₹', '¥', '₽', '£']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.white,
        title: Row(
          children : [
            CircleAvatar(
              radius: 20, // Image radius
              backgroundImage: NetworkImage(pic),
            ),
          SizedBox(width: 20,),
          Text(name, style: TextStyle(color: Colors.black),),
          ]
        ),
      ),

      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 40),
          Text('Send Your Love to $name \n to become a real fan', style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic), textAlign: TextAlign.center,),
          SizedBox(height: 45),
          Container(
            height: 60,
            margin: EdgeInsets.fromLTRB(25, 7, 25,0),
            padding: EdgeInsets.fromLTRB(30, 0,0,0),
            decoration: BoxDecoration(
                border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(10),
            ),

            child: Row(
              children: <Widget>[
                  dropdown(),
                  SizedBox(width: 20),
            Expanded(
              child: Center(
                child: TextField(
                  onChanged: (text){
                    setState(() {
                      price = text;
                    });
                  },
                  controller: amountController,
                  decoration: new InputDecoration.collapsed(hintText: '2000'),
                  keyboardType: TextInputType.number,
                ),
              ),
            ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            height: 60,
            margin: EdgeInsets.fromLTRB(25, 0, 25,0),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(width: 1),
              borderRadius: BorderRadius.circular(10),
            ),

            child: Center(
              child: TextField(
                controller: titleController,
                decoration: new InputDecoration.collapsed(hintText: 'Your Name (optional)'),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            height: 170,
            margin: EdgeInsets.fromLTRB(25, 0, 25,0),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            constraints: BoxConstraints(maxHeight: 500),

            child: TextField(
              controller: descriptionController,
              decoration: new InputDecoration.collapsed(hintText: 'Say Something Nice... (Optional)'),
              keyboardType: TextInputType.multiline,
              maxLines: null,
            ),
          ),

          const SizedBox(
            height: 20,
          ),
          
          GestureDetector(
            onTap: (){
              submit();
            },
            child: Container(
              margin: EdgeInsets.all(100),
              width: 80,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(25)
              ),
              child: Center(
                  child: Text(
                    dropdownvalue+'  '+price,
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),

                  ),
              ),
            ),
          ),
        ],
      ),



    );
  }
}














