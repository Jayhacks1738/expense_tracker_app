import 'package:expense_tracker_app/components/expense_summary.dart';
import 'package:expense_tracker_app/components/expense_tile.dart';
import 'package:expense_tracker_app/controller/nav.dart';
import 'package:expense_tracker_app/data/expense_data.dart';
import 'package:expense_tracker_app/models/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final newExpenseNameController = TextEditingController();
  final newExpenseKwachaController = TextEditingController();
  final newExpenseNgweController = TextEditingController();

  void addNewExpense() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add new expense'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: newExpenseNameController,
              decoration: const InputDecoration(
                hintText: 'Name of Expense',
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: newExpenseKwachaController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: 'Kwacha',
                    ),
                  ),
                ),
                Expanded(
                  child: TextField(
                    controller: newExpenseNgweController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: 'Ngwe',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          MaterialButton(
            onPressed: save,
            child: const Text('Save'),
          ),
          MaterialButton(
            onPressed: cancel,
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }

  void save() {
    String amount =
        '${newExpenseKwachaController.text}.${newExpenseNgweController.text}';
    ExpenseItem newExpense = ExpenseItem(
      name: newExpenseNameController.text,
      amount: amount,
      dateTime: DateTime.now(),
    );
    Provider.of<ExpenseData>(context, listen: false).addNewExpense(newExpense);

    Navigator.pop(context);
    clear();
  }

  void cancel() {
    Navigator.pop(context);
    clear();
  }

  void clear() {
    newExpenseNameController.clear();
    newExpenseKwachaController.clear();
    newExpenseNgweController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseData>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        bottomNavigationBar: NavigationBar(destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(
              icon: Icon(Icons.stacked_bar_chart), label: 'Statistics'),
          NavigationDestination(icon: Icon(Icons.settings), label: 'Settings')
        ]),
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
          onPressed: addNewExpense,
          backgroundColor: Colors.grey,
          child: const Icon(Icons.add),
        ),
        body: ListView(
          children: [
            ExpenseSummary(startOfWeek: value.startOfWeekDate()),
            const SizedBox(height: 15),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: value.getAllExpenseList().length,
              itemBuilder: (context, index) => ExpenseTile(
                name: value.getAllExpenseList()[index].name,
                amount: value.getAllExpenseList()[index].amount,
                dateTime: value.getAllExpenseList()[index].dateTime,
                deleteTapped: (BuildContext) {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
