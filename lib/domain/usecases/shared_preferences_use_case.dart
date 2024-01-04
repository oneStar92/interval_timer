import 'package:tabata_timer/domain/model/tabata.dart';

abstract interface class SharedPreferencesUseCase {
  Future<bool> save(Tabata tabata);
  Future<Tabata> load();
}