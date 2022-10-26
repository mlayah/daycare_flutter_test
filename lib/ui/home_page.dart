import 'package:crud_exam/models/child.dart';
import 'package:crud_exam/ui/create_page.dart';
import 'package:crud_exam/ui/edit_page.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<DaycareChild> daycareChildren;
  @override
  void initState() {
    super.initState();
   
   // initialize the list of daycare children with sample data 
   // ideally,this would be done in a service class,or state manager like bloc,provider,etc
   // which would be injected into this class. I have kept it simple for the sake of this test

    daycareChildren = [
      DaycareChild(
        firstName: 'John',
        lastName: 'Doe',
        parentPhoneNumber: '555-555-5555',
      ),
      DaycareChild(
        firstName: 'Jane',
        lastName: 'Doe',
        parentPhoneNumber: '555-555-5555',
      ),
      DaycareChild(
        firstName: 'Jack',
        lastName: 'Doe',
        parentPhoneNumber: '555-555-5555',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Arabellsoft Daycare Test'),
      ),
      body: Container(
        padding: const EdgeInsets.all(24),
        child: DataTable(
          columns: const <DataColumn>[
            DataColumn(
              label: Text(
                'First Name',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            DataColumn(
              label: Text(
                'Last Name',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            DataColumn(
              label: Text(
                'Parent Phone Number',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            DataColumn(
              label: Text(
                'Actions',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ],
          rows: daycareChildren
              .map(
                (dayCareChild) => DataRow(
                  cells: [
                    DataCell(
                      Text(dayCareChild.firstName),
                    ),
                    DataCell(
                      Text(dayCareChild.lastName),
                    ),
                    DataCell(
                      Text(dayCareChild.parentPhoneNumber),
                    ),
                    DataCell(
                      IconButton(
                        onPressed: () async {
                       
                          var updatedChild = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditPage(
                                dayCareChild: dayCareChild,
                              ),
                            ),
                          );

                          //if updatedChild is not null, update the value of dayCareChild with the updatedChild
                          if (updatedChild != null) {
                            setState(() {
                              dayCareChild = updatedChild;
                            });
                          }
                        },
                        icon: const Icon(Icons.edit),
                      ),
                    ),
                  ],
                ),
              )
              .toList(),
        ),
      ),

      
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          

          var newChild = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CreatePage(),
            ),
          );

          //if newChild is not null, add it to the list of children
          if (newChild != null) {
            setState(() {
              daycareChildren.add(newChild as DaycareChild);
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
