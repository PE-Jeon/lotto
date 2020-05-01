import 'package:lotto/model/winning.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbController {
  var database;

  Future<void> dbControl() async {
    print('dbControl exected');
    database = openDatabase(
      // 데이터베이스 경로를 지정합니다. 참고: `path` 패키지의 `join` 함수를 사용하는 것이
      // 각 플랫폼 별로 경로가 제대로 생성됐는지 보장할 수 있는 가장 좋은 방법입니다.
      join(await getDatabasesPath(), 'winning.db'),
      // 데이터베이스가 처음 생성될 때, winning를 저장하기 위한 테이블을 생성합니다.
      onCreate: (db, version) {
        print('create senetence');
        print(db);
        return db.execute(
          "CREATE TABLE winning(drwNo INTEGER PRIMARY KEY, totSellamnt INTEGER, drwNoDate TEXT, firstWinamnt INTEGER,firstPrzwnerCo INTEGER, firstAccumamnt INTEGER, drwtNo1 INTEGER, drwtNo2 INTEGER, drwtNo3 INTEGER, drwtNo4 INTEGER, drwtNo5 INTEGER, drwtNo6 INTEGER, bnusNo INTEGER)",
          //"CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)",
        );
      },
      // 버전을 설정하세요. onCreate 함수에서 수행되며 데이터베이스 업그레이드와 다운그레이드를
      // 수행하기 위한 경로를 제공합니다.
      version: 1,
    );
  }

  Future<void> insertWinning(Winning winning) async {
    dbControl();
    // 데이터베이스 reference를 얻습니다.
    final Database db = await database;
    print("print db");
    print(db);

    // Winning를 올바른 테이블에 추가하
    // 세요. 또한
    // `conflictAlgorithm`을 명시할 것입니다. 본 예제에서는
    // 만약 동일한 winning가 여러번 추가되면, 이전 데이터를 덮어쓸 것입니다.
    await db.insert(
      'winning',
      test.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Winning>> winnings() async {
    // 데이터베이스 reference를 얻습니다.
    final Database db = await database;

    // 모든 Dog를 얻기 위해 테이블에 질의합니다.
    final List<Map<String, dynamic>> maps = await db.query('winning');

    // List<Map<String, dynamic>를 List<Winning>으로 변환합니다.
    return List.generate(maps.length, (i) {
      return Winning(
        totSellamnt: maps[i]['totSellamnt'],
        drwNo: maps[i]['drwNo'],
        drwNoDate: maps[i]['drwNoDate'],
        firstWinamnt: maps[i]['firstWinamnt'],
        firstPrzwnerCo: maps[i]['firstPrzwnerCo'],
        firstAccumamnt: maps[i]['firstAccumamnt'],
        drwtNo1: maps[i]['drwtNo1'],
        drwtNo2: maps[i]['drwtNo2'],
        drwtNo3: maps[i]['drwtNo3'],
        drwtNo4: maps[i]['drwtNo4'],
        drwtNo5: maps[i]['drwtNo5'],
        drwtNo6: maps[i]['drwtNo6'],
        bnusNo: maps[i]['bnusNo'],
      );
    });
  }

  Future<void> updateDog(Winning winning) async {
    // 데이터베이스 reference를 얻습니다.
    final db = await database;

    // 주어진 Winning를 수정합니다.
    await db.update(
      'winning',
      winning.toMap(),
      // Winning의 id가 일치하는 지 확인합니다.
      where: "id = ?",
      // Winning의 id를 whereArg로 넘겨 SQL injection을 방지합니다.
      whereArgs: [winning.drwNo],
    );
  }

  var test = Winning(
    totSellamnt: 1000,
    drwNo: 1000,
    drwNoDate: "2019-11-30",
    firstWinamnt: 100,
    firstPrzwnerCo: 1,
    firstAccumamnt: 100,
    drwtNo1: 1,
    drwtNo2: 2,
    drwtNo3: 3,
    drwtNo4: 4,
    drwtNo5: 5,
    drwtNo6: 6,
    bnusNo: 7,
  );
}