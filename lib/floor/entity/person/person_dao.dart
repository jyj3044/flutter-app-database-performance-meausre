import 'package:database_performance_measure/floor/entity/person/floor_person.dart';
import 'package:floor/floor.dart';

@dao
abstract class PersonDao {
  @insert
  Future<void> insertData(FloorPerson person);

  @delete
  Future<void> deleteData(FloorPerson person);

  @update
  Future<void> updateData(FloorPerson person);

  @update
  Future<void> updateDataList(List<FloorPerson> person);

  @Query('DELETE FROM FloorPerson')
  Future<void> deleteAllData();

  @Query('SELECT * FROM FloorPerson')
  Future<List<FloorPerson>> findAll();

  @Query('SELECT * FROM FloorPerson WHERE id = :id')
  Future<FloorPerson?> findByPrimaryKey(int id);
}
