import 'package:hang_man/model/score.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


Future<Database> openDB() async {
  final Future<Database> database = openDatabase(

    join(await getDatabasesPath(), 'Score_database.db'),

    onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE scores(id INTEGER PRIMARY KEY AUTOINCREMENT, scoreDate TEXT, livesLeft INTEGER ,secondsLeft INTEGER)",
      );
    },

    version: 2,

  );
  return database;
}


Future<List<Score>> getScores(final database) async{
  final Database db =  await database;
  List<Map<String,dynamic>> maps = await db.query('scores');

  return List.generate(maps.length,(index)=>Score(
    livesLeft: maps[index]["livesLeft"],
    secondsLeft: maps[index]["secondsLeft"],
    scoreDate: maps[index]["scoreDate"],

  ));
}

Future<void> insertScore(Score score, final database) async {
  final Database db = await database;

  await db.insert(
    'scores',
    score.toMap(),
    conflictAlgorithm: ConflictAlgorithm.ignore,
  );

  var maps = await db.query('scores');
  print (maps);
}


void manipulateDatabase(Score score,final database) async{
  await insertScore(score,database);
  print(await(getScores(database)));
}


