import 'package:crud_exam/models/child.dart';
import 'package:crud_exam/utils/constants.dart';
import 'package:crud_exam/utils/helpers.dart';
import 'package:flutter/material.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final _formKey = GlobalKey<FormState>();

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
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: h16),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        DaycareChild daycareChild = DaycareChild(
                          firstName: firstNameController.text,
                          lastName: lastNameController.text,
                          parentPhoneNumber: parentPhoneNumberController.text,
                        );

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
