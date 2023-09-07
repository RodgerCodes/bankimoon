import 'package:bankimoon/data/Models/accounts.dart';
import 'package:bankimoon/data/database.dart';

class Repository {
  final DbManager connection;

  Repository({required this.connection});

  Future getAccounts() async {
    final data = await connection.getAccountList();
    return data
        .map(Account.fromJson)
        .toList();
  }
  
  Future getFavourites() async {
    final data = await connection.getFavourites();
    return data
        .map(Account.fromJson)
        .toList();
  }

  Future addAccount(
      String institutionName, String accountName, String accountNumber) async {
    final data = await connection.addAccount(
        accountName, accountNumber, institutionName);
    return data;
  }

  Future<void> deleteAccount(int id) async {
    await connection.deleteAccount(id);
  }

  Future deleteAccounts() async {
    final data = await connection.deleteAccounts();
    return data;
  }

  Future searchAccount(String query) async {
    final data = await connection.searchAccount(query);

    return data
        .map(Account.fromJson)
        .toList();
  }

  Future searchFavouriteAccounts(String query) async {
    final data = await connection.searchFavouriteAccounts(query);

    return data
        .map(Account.fromJson)
        .toList();
  }

  Future markAsFavourite(int accountId) async {
    return await connection.markAsFavourite(accountId);
  }
}
