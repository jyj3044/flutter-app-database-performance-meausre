// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'floor_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  PersonDao? _personDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `FloorPerson` (`id` INTEGER NOT NULL, `age` INTEGER NOT NULL, `salary` INTEGER NOT NULL, `isFemale` INTEGER NOT NULL, `maritalStatus` INTEGER NOT NULL, `name` TEXT NOT NULL, `nickName` TEXT NOT NULL, `job` TEXT NOT NULL, `nationality` TEXT NOT NULL, `testField1` TEXT NOT NULL, `testField2` TEXT NOT NULL, `testField3` TEXT NOT NULL, `testField4` TEXT NOT NULL, `testField5` TEXT NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  PersonDao get personDao {
    return _personDaoInstance ??= _$PersonDao(database, changeListener);
  }
}

class _$PersonDao extends PersonDao {
  _$PersonDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _floorPersonInsertionAdapter = InsertionAdapter(
            database,
            'FloorPerson',
            (FloorPerson item) => <String, Object?>{
                  'id': item.id,
                  'age': item.age,
                  'salary': item.salary,
                  'isFemale': item.isFemale ? 1 : 0,
                  'maritalStatus': item.maritalStatus ? 1 : 0,
                  'name': item.name,
                  'nickName': item.nickName,
                  'job': item.job,
                  'nationality': item.nationality,
                  'testField1': item.testField1,
                  'testField2': item.testField2,
                  'testField3': item.testField3,
                  'testField4': item.testField4,
                  'testField5': item.testField5
                }),
        _floorPersonUpdateAdapter = UpdateAdapter(
            database,
            'FloorPerson',
            ['id'],
            (FloorPerson item) => <String, Object?>{
                  'id': item.id,
                  'age': item.age,
                  'salary': item.salary,
                  'isFemale': item.isFemale ? 1 : 0,
                  'maritalStatus': item.maritalStatus ? 1 : 0,
                  'name': item.name,
                  'nickName': item.nickName,
                  'job': item.job,
                  'nationality': item.nationality,
                  'testField1': item.testField1,
                  'testField2': item.testField2,
                  'testField3': item.testField3,
                  'testField4': item.testField4,
                  'testField5': item.testField5
                }),
        _floorPersonDeletionAdapter = DeletionAdapter(
            database,
            'FloorPerson',
            ['id'],
            (FloorPerson item) => <String, Object?>{
                  'id': item.id,
                  'age': item.age,
                  'salary': item.salary,
                  'isFemale': item.isFemale ? 1 : 0,
                  'maritalStatus': item.maritalStatus ? 1 : 0,
                  'name': item.name,
                  'nickName': item.nickName,
                  'job': item.job,
                  'nationality': item.nationality,
                  'testField1': item.testField1,
                  'testField2': item.testField2,
                  'testField3': item.testField3,
                  'testField4': item.testField4,
                  'testField5': item.testField5
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<FloorPerson> _floorPersonInsertionAdapter;

  final UpdateAdapter<FloorPerson> _floorPersonUpdateAdapter;

  final DeletionAdapter<FloorPerson> _floorPersonDeletionAdapter;

  @override
  Future<void> deleteAllData() async {
    await _queryAdapter.queryNoReturn('DELETE FROM FloorPerson');
  }

  @override
  Future<List<FloorPerson>> findAll() async {
    return _queryAdapter.queryList('SELECT * FROM FloorPerson',
        mapper: (Map<String, Object?> row) => FloorPerson(row['id'] as int,
            age: row['age'] as int,
            salary: row['salary'] as int,
            isFemale: (row['isFemale'] as int) != 0,
            maritalStatus: (row['maritalStatus'] as int) != 0,
            name: row['name'] as String,
            nickName: row['nickName'] as String,
            job: row['job'] as String,
            nationality: row['nationality'] as String,
            testField1: row['testField1'] as String,
            testField2: row['testField2'] as String,
            testField3: row['testField3'] as String,
            testField4: row['testField4'] as String,
            testField5: row['testField5'] as String));
  }

  @override
  Future<FloorPerson?> findByPrimaryKey(int id) async {
    return _queryAdapter.query('SELECT * FROM FloorPerson WHERE id = ?1',
        mapper: (Map<String, Object?> row) => FloorPerson(row['id'] as int,
            age: row['age'] as int,
            salary: row['salary'] as int,
            isFemale: (row['isFemale'] as int) != 0,
            maritalStatus: (row['maritalStatus'] as int) != 0,
            name: row['name'] as String,
            nickName: row['nickName'] as String,
            job: row['job'] as String,
            nationality: row['nationality'] as String,
            testField1: row['testField1'] as String,
            testField2: row['testField2'] as String,
            testField3: row['testField3'] as String,
            testField4: row['testField4'] as String,
            testField5: row['testField5'] as String),
        arguments: [id]);
  }

  @override
  Future<void> insertData(FloorPerson person) async {
    await _floorPersonInsertionAdapter.insert(person, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateData(FloorPerson person) async {
    await _floorPersonUpdateAdapter.update(person, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateDataList(List<FloorPerson> person) async {
    await _floorPersonUpdateAdapter.updateList(
        person, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteData(FloorPerson person) async {
    await _floorPersonDeletionAdapter.delete(person);
  }
}
