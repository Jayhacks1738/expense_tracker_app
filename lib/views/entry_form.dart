import 'package:expense_tracker_app/data/expense_data.dart';
import 'package:expense_tracker_app/models/expense_item.dart';
import 'package:expense_tracker_app/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget build(BuildContext context) {
  return MaterialApp(
    routes: {"HomeScreen": (context) => const HomeScreen()},
  );
}

class ExpenseEntryForm extends StatefulWidget {
  const ExpenseEntryForm({
    super.key,
  });

  @override
  State<ExpenseEntryForm> createState() => _ExpenseEntryFormState();
}

class _ExpenseEntryFormState extends State<ExpenseEntryForm> {
  final items = [
    'Electricity',
    'Fuel',
    'Clothing',
    'Food',
    'Education',
    'Entertainment',
    'Health',
    'Travel'
  ];
  String? value;
  String dropdownValue = 'Item 1';

  final _formKey = GlobalKey<FormState>();

  //text editing controllers
  final nameController = TextEditingController();
  final kwachaController = TextEditingController();
  final ngweController = TextEditingController();
  final categoryController = TextEditingController();
  final dateTimeController = TextEditingController();

  //save info
  void save() {
    Navigator.pop(context);
    clear();
  }

  void cancel() {
    Navigator.pop(context);
    clear();
  }

  void clear() {
    nameController.clear();
    kwachaController.clear();
    ngweController.clear();
    categoryController.clear();
    dateTimeController.clear();
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: const TextStyle(fontSize: 20),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Expense Form',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      bottomNavigationBar: NavigationBar(destinations: const [
        NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
        NavigationDestination(
            icon: Icon(Icons.stacked_bar_chart), label: 'Statistics'),
        NavigationDestination(icon: Icon(Icons.settings), label: 'Settings')
      ]),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: ListView(
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter Item into Text field.';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: kwachaController,
                  decoration: const InputDecoration(
                    labelText: 'Amount',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter Item into Text-field.';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: dateTimeController,
                  decoration: const InputDecoration(
                    hintText: 'Date',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.datetime,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter Item into Text-field.';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                //dropdown button
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.blue)),
                  child: DropdownButton<String>(
                    icon: const Icon(Icons.arrow_drop_down),
                    iconSize: 38,
                    isExpanded: true,
                    value: value,
                    items: items.map(buildMenuItem).toList(),
                    onChanged: (value) {
                      setState(() => this.value = value);
                    },
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return const HomeScreen();
                        },
                      ),
                    );
                  },
                  child: const Text("Save"),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Cancel"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
