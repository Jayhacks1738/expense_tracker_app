import 'package:expense_tracker_app/models/expense_item.dart';
import 'package:hive/hive.dart';

class HiveDataBase {
  final _mybox = Hive.box('expense_database');

  void saveData(List<ExpenseItem> allExpense) {
    List<dynamic> allExpensesFormatted = [];
    for (var expense in allExpense) {
      List<dynamic> expenseFormatted = [
        expense.name,
        expense.amount,
        expense.dateTime,
      ];
      allExpensesFormatted.add(expenseFormatted);

      _mybox.put('All_EXPENSES', allExpensesFormatted);
    }
  }

  List<ExpenseItem> readData() {
    List savedExpenses = _mybox.get('ALL_EXPENSES') ?? [];
    List<ExpenseItem> allExpense = [];

    for (int i = 0; i < savedExpenses.length; i++) {
      String name = savedExpenses[i][0];
      String amount = savedExpenses[i][1];
      String dateTime = savedExpenses[i][2];

      ExpenseItem expense = ExpenseItem(
        name: name,
        amount: amount,
        dateTime: dateTime,
      );
      allExpense.add(expense);
    }
    return allExpense;
  }
}
