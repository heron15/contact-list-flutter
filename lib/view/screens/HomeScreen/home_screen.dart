import 'package:contact_list/utils/app_color.dart';
import 'package:contact_list/view/screens/HomeScreen/validate_checking_fun.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'list_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _nameTextEditingController = TextEditingController();
  final TextEditingController _passwordTextEditingController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final List<Map<String, String>> _contacts = [];

  @override
  void initState() {
    super.initState();
    _loadContacts();
  }

  void _addContact() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _contacts.add({
          'name': _nameTextEditingController.text,
          'number': _passwordTextEditingController.text,
        });
      });
      _nameTextEditingController.clear();
      _passwordTextEditingController.clear();
      _formKey.currentState?.reset();
      await _saveContacts();
    }
  }

  Future<void> _saveContacts() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> contactList =
        _contacts.map((contact) => '${contact['name']}:${contact['number']}').toList();
    await prefs.setStringList('contacts', contactList);
  }

  Future<void> _loadContacts() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? contactList = prefs.getStringList('contacts');
    if (contactList != null) {
      setState(() {
        _contacts.clear();
        for (var contact in contactList) {
          var splitContact = contact.split(':');
          if (splitContact.length == 2) {
            _contacts.add({'name': splitContact[0], 'number': splitContact[1]});
          }
        }
      });
    }
  }

  void _deleteContact(int index) async {
    setState(() {
      _contacts.removeAt(index);
    });
    await _saveContacts();
  }

  void _deleteContactDialog(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Conformation',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
          content: const Text(
            'Are you sure for delete?',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.cancel_outlined,
                color: AppColor.themeColor,
                size: 28,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.delete,
                color: AppColor.themeColor,
                size: 28,
              ),
              onPressed: () {
                _deleteContact(index);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact List"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.grid_view_outlined),
          )
        ],
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.all(15),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _nameTextEditingController,
                            keyboardType: TextInputType.name,
                            autovalidateMode: AutovalidateMode.disabled,
                            decoration: const InputDecoration(
                              hintText: "Name",
                            ),
                            validator: (String? value) {
                              return ValidateCheckingFun.validName(value);
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: _passwordTextEditingController,
                            keyboardType: TextInputType.number,
                            autovalidateMode: AutovalidateMode.disabled,
                            decoration: const InputDecoration(
                              hintText: "Number",
                            ),
                            validator: (String? value) {
                              return ValidateCheckingFun.validateNumber(value);
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                      onPressed: _addContact,
                      child: const Text("Add"),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ListView.builder(
                      primary: false,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: _contacts.length,
                      itemBuilder: (context, index) {
                        return ListItem(
                          name: _contacts[index]['name'],
                          number: _contacts[index]['number'],
                          onLongPressed: () => _deleteContactDialog(index),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
