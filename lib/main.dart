import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.purple,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<MyHomePage> {
  bool _isMale = false;
  bool _isFemale = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form"),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScopeNode focusScopeNode = FocusScope.of(context);
          if (!focusScopeNode.hasPrimaryFocus) {
            focusScopeNode.unfocus();
          }
        },
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                      labelText: "First Name",
                                      hintText: 'Enter First name',
                                      border: OutlineInputBorder(),
                                      icon: Icon(Icons.person)),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your first name';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                      labelText: "Last Name",
                                      hintText: 'Enter Last name',
                                      border: OutlineInputBorder(),
                                      icon: Icon(Icons.person)),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your last name';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          decoration: const InputDecoration(
                              labelText: "Email",
                              hintText: "Enter your email",
                              border: OutlineInputBorder(),
                              icon: Icon(Icons.mail)),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter email id';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          decoration: const InputDecoration(
                              labelText: "Contact",
                              hintText: 'contact number',
                              border: OutlineInputBorder(),
                              icon: Icon(Icons.phone_android)),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your contact number';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          decoration: const InputDecoration(
                              labelText: "DOB",
                              hintText: 'Enter DOB',
                              border: OutlineInputBorder(),
                              icon: Icon(Icons.calendar_month)),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your DOB';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 50.0),
                              child: Checkbox(
                                value: _isMale,
                                onChanged: (value) {
                                  setState(() {
                                    _isMale = value ?? false;
                                    _isFemale = false;
                                  });
                                },
                              ),
                            ),
                            const Text('Male'),
                            Padding(
                              padding: const EdgeInsets.only(left: 50.0),
                              child: Checkbox(
                                value: _isFemale,
                                onChanged: (value) {
                                  setState(() {
                                    _isFemale = value ?? false;
                                    _isMale = false;
                                  });
                                },
                              ),
                            ),
                            const Text('Female'),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(left: 40.0),
                          child: DropdownButtonFormField<String>(
                            decoration: const InputDecoration(
                              labelText: "Select",
                              hintText: 'Select a state',
                              border: OutlineInputBorder(),
                            ),
                            items: const [
                              DropdownMenuItem(
                                value: 'puducherry',
                                child: Text('Puducherry'),
                              ),
                              DropdownMenuItem(
                                value: 'karnataka',
                                child: Text('Karnataka'),
                              ),
                              DropdownMenuItem(
                                value: 'kerala',
                                child: Text('Kerala'),
                              ),
                              DropdownMenuItem(
                                value: 'Andra pradesh',
                                child: Text('Andra Pradesh'),
                              ),
                            ],
                            onChanged: (String? value) {},
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please select a state';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              print("Form submitted");
                            }
                          },
                          child: const Text("Register"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
