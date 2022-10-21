import 'package:crud_exam/models/child.dart';
import 'package:flutter/material.dart';

class EditPage extends StatefulWidget {
  final DaycareChild dayCareChild;
  const EditPage({
    super.key,
    required this.dayCareChild,
  });

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  //form key
  final _formKey = GlobalKey<FormState>();
  //text controllers
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController parentPhoneNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    firstNameController.text = widget.dayCareChild.firstName;
    lastNameController.text = widget.dayCareChild.lastName;
    parentPhoneNumberController.text = widget.dayCareChild.parentPhoneNumber;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Child Details'),
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
                const SizedBox(height: 24),
                //last name
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

                const SizedBox(height: 24),
                //parent phone number
                TextFormField(
                  controller: parentPhoneNumberController,
                  decoration: const InputDecoration(
                    labelText: 'Parent Phone Number',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a parent phone number';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 24),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Validate returns true if the form is valid, or false otherwise.
                      if (_formKey.currentState!.validate()) {
                        widget.dayCareChild.firstName =
                            firstNameController.text;
                        widget.dayCareChild.lastName = lastNameController.text;
                        widget.dayCareChild.parentPhoneNumber =
                            parentPhoneNumberController.text;
                        //pop page and pass back the updated child
                        Navigator.pop(context, widget.dayCareChild);
                      }
                    },
                    child: const Text('Update Details'),
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
