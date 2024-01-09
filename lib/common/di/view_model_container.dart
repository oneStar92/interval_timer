import 'package:tabata_timer/data/repository/shared_preferences_repository_impl.dart';
import 'package:tabata_timer/domain/usecases/shared_preferences_use_case_impl.dart';
import 'package:tabata_timer/presentation/home/home_view_model.dart';
import 'package:tabata_timer/domain/model/tabata.dart';
import 'package:tabata_timer/presentation/tabata/tabata_view_model.dart';
import 'package:tabata_timer/util/audio_manager_impl.dart';

final class ViewModelContainer {
  static HomeViewModel createHomeViewModel() {
    final repository = SharedPreferencesRepositoryImpl();
    final useCase = SharedPreferencesUseCaseImpl(repository: repository);
    return HomeViewModel(useCase: useCase);
  }

  static TabataViewModel createTabataViewModel({Tabata tabata = const Tabata()}) {
    final audioManager = AudioManagerImpl();
    return TabataViewModel(tabata: tabata, audioManager: audioManager);
  }
}
