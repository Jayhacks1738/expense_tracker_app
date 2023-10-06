import 'package:expense_tracker_app/data/hive_database.dart';
import 'package:expense_tracker_app/datetime/date_time_helper.dart';
import 'package:expense_tracker_app/models/expense_item.dart';
import 'package:expense_tracker_app/views/home_screen.dart';
import 'package:flutter/widgets.dart';

class ExpenseData extends ChangeNotifier {
  List<ExpenseItem> overallExpenseList = [];

  List<ExpenseItem> getAllExpenseList() {
    return overallExpenseList;
  }

  final db = HiveDataBase();
  void prepareData() {
    if (db.readData().isNotEmpty) {
      overallExpenseList = db.readData();
    }
  }

  void addNewExpense(ExpenseItem newExpense) {
    overallExpenseList.add(newExpense);
    notifyListeners();
    db.saveData(overallExpenseList);
  }

  void deleteExpense(ExpenseItem deleteExpense) {
    overallExpenseList.remove(deleteExpense);
    notifyListeners();
    db.saveData(overallExpenseList);
  }

  String getDayName(DateTime dateTime) {
    switch (dateTime.weekday) {
      case 1:
        return 'Monday';
      case 2:
        return 'Tuesday';
      case 3:
        return 'Wednesday';
      case 4:
        return 'Thursday';
      case 5:
        return 'Friday';
      case 6:
        return 'Saturday';
      case 7:
        return 'Sunday';
      default:
        return '';
    }
  }

  DateTime startOfWeekDate() {
    DateTime? startOfWeek;

    DateTime today = DateTime.now();

    for (int i = 0; i < 7; i++) {
      if (getDayName(today.subtract(Duration(days: i))) == 'Sunday') {
        startOfWeek = today.subtract(Duration(days: i));
      }
    }

    return startOfWeek!;
  }

  Map<String, double> calculateDailyExpenseSummary() {
    Map<String, double> dailyExpenseSummary = {};

    for (var expense in overallExpenseList) {
      String date = convertDateTimeToString(expense.dateTime as DateTime);
      double amount = double.parse(expense.amount);

      if (dailyExpenseSummary.containsKey(date)) {
        double currentAmount = dailyExpenseSummary[date]!;
      } else {
        dailyExpenseSummary.addAll({date: amount});
      }
    }

    return dailyExpenseSummary;
  }
}
