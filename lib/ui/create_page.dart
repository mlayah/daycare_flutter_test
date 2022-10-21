import 'package:crud_exam/models/child.dart';
import 'package:flutter/material.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final _formKey = GlobalKey<FormState>();
  //text controllers
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController parentPhoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Child'),
      ),
      body: Container(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //first name
                TextFormField(
                  controller: firstNameController,
                  //outlined border
                  decoration: const InputDecoration(
                    labelText: 'First Name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a first name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: lastNameController,
                  decoration: const InputDecoration(
                    labelText: 'Last Name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a last name';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                //parent phone number
                TextFormField(
                  controller: parentPhoneNumberController,
                  decoration: const InputDecoration(
                      labelText: 'Parent Phone Number',
                      border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a parent phone number';
                    }
                    return null;
                  },
                ),

                //save button
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Validate returns true if the form is valid, or false otherwise.
                      if (_formKey.currentState!.validate()) {
                        DaycareChild daycareChild = DaycareChild(
                          firstName: firstNameController.text,
                          lastName: lastNameController.text,
                          parentPhoneNumber: parentPhoneNumberController.text,
                        );

                        //pop and pass the daycare child object back to the home page
                        Navigator.pop(context, daycareChild);
                      }
                    },
                    child: const Text('Add Child'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
