import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
class DatabaseHandler {
  //database
  late Database database;
  final databaseName = 'myDatabase';
  final databaseVersion = 1;

  //Table: about_user
 static const tblname='Contact';
 static const colusername='username';
 static const colpassword='password';
 static const colid='id';

 static const tblpname='Products';
 static const colname='name';
 static const colbrand='brand';
 static const colimage='image';
 static const colgender='gender';
 static const colprice='price';
 static const colcountry='country';
 static const colpid='id';

 static const tblrname='Recommended';
 static const colname2='name';
 static const colbrand2='brand';
 static const colimage2='image';
 static const colgender2='gender';
 static const colprice2='price';
 static const colcountry2='country';
 static const colid2='id';






  Future<void> initializeDB() async {
    String path = await getDatabasesPath();
    database = await openDatabase(
      join(path, '$databaseName.db'),
      onCreate: (database, version) async {
        await database.execute(
          '''
            CREATE TABLE $tblname(
            $colid INTEGER PRIMARY KEY AUTOINCREMENT,
            $colusername TEXT NOT NULL UNIQUE,
            $colpassword TEXT NOT NULL
            );
          '''
        );
        await database.execute(
          '''CREATE TABLE $tblpname(
            $colpid INTEGER PRIMARY KEY AUTOINCREMENT,
            $colname TEXT NOT NULL,
            $colbrand TEXT NOT NULL,
            $colimage TEXT NOT NULL,
            $colgender TEXT NOT NULL,
            $colprice INTEGER NOT NULL ,
            $colcountry TEXT NOT NULL
            );'''
        );
        await database.execute(
            '''CREATE TABLE $tblrname(
            $colid2 INTEGER PRIMARY KEY AUTOINCREMENT,
            $colname2 TEXT NOT NULL,
            $colbrand2 TEXT NOT NULL,
            $colimage2 TEXT NOT NULL,
            $colgender2 TEXT NOT NULL,
            $colprice2 INTEGER NOT NULL ,
            $colcountry2 TEXT NOT NULL
            );'''
        );

      },
      version: databaseVersion,
    );
  }

  Future<int> insertInto(String tableName, var data) async {
    return await database.insert(tableName, data.toMap());
  }
  Future<int> insertProducts(String tableName, List data) async {
      for(int i=0;i<data.length;i++) {
        await database.insert(tableName, data[i]);
      }
      return 1;
  }

  Future<List> retrieveData(String tableName) async {
    final List<Map<String, Object?>> queryResult =
        await database.query(tableName);
    return queryResult;
  }
  // Future<void> retrieveData1() async {
  //   await database.delete(tblpname);
  // }
  Future<void> deleteData(
      String tableName, String where, List<Object> whereArgs) async {
    await database.delete(
      tableName,
      where: where,
      whereArgs: whereArgs,
    );
  }

  Future<void> updateData(String tableName, Map<String, Object> values,
      String where, List<Object> whereArgs) async {
    await database.update(tableName, values,
        where: where, whereArgs: whereArgs);
  }
  Future<void> deletet()async{
    await database.delete(tblrname);
  }
}




