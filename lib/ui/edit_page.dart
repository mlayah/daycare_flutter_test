import 'package:crud_exam/models/child.dart';
import 'package:crud_exam/utils/constants.dart';
import 'package:crud_exam/utils/helpers.dart';
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
 
  final _formKey = GlobalKey<FormState>();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController parentPhoneNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();

    //initializing the controllers with the values from the child object passed from the previous page
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
        padding: const EdgeInsets.all(h24),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                

                TextFormField(
                  controller: firstNameController,
                  decoration: Helpers.defaultInputDecoration('First Name'),
                  validator: (value) {
                    return Helpers.validateNotEmpty(value);
                  },
                ),
                const SizedBox(height: h24),
                

                TextFormField(
                  controller: lastNameController,
                  decoration: Helpers.defaultInputDecoration('Last Name'),
                  validator: (value) {
                    return Helpers.validateNotEmpty(value);
                  },
                ),

                const SizedBox(height: h24),
                

                TextFormField(
                  controller: parentPhoneNumberController,
                  decoration:
                      Helpers.defaultInputDecoration('Parent Phone Number'),
                  validator: (value) {
                    return Helpers.validateNotEmpty(value);
                  },
                ),

                const SizedBox(height: h24),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: h16),
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
