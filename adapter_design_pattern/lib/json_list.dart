
import 'package:adapter_design_pattern/contact.dart';
import 'package:flutter/material.dart';

class JsonLongListWithSeparator extends StatelessWidget {
  List<Contact> listOfItems = JsonContactsAdapter().getContacts();
  JsonLongListWithSeparator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.separated(
        itemCount: listOfItems.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: () {
              print('Clicked on item #$index'); // Print to console
            },
            title: Text(listOfItems[index].fullName),
            subtitle: Text('${listOfItems[index].email} ${listOfItems[index].phoneNumber}'),
            leading: Container(
              height: 50,
              width: 50,
               color: listOfItems[index].friend ? Colors.blue : Colors.amber,
            ),
            trailing: Icon(Icons.edit),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider();
        },
      ),
    );
  }
}