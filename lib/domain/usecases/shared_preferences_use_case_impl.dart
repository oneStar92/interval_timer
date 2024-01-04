import 'dart:convert';
import 'package:tabata_timer/domain/model/tabata.dart';
import 'package:tabata_timer/domain/repository/shared_preferences_repository.dart';
import 'package:tabata_timer/domain/usecases/shared_preferences_use_case.dart';

final class SharedPreferencesUseCaseImpl implements SharedPreferencesUseCase {
  final SharedPreferencesRepository _repository;

  const SharedPreferencesUseCaseImpl({
    required SharedPreferencesRepository repository,
  }) : _repository = repository;

  @override
  Future<Tabata> load() {
    return _repository.loadAll().then(
      (value) {
        if (value != null) {
          return Tabata.fromJson(jsonDecode(value));
        } else {
          return const Tabata();
        }
      },
    );
  }

  @override
  Future<bool> save(Tabata tabata) {
    return _repository.save(jsonEncode(tabata));
  }
}
