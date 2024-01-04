import 'package:tabata_timer/data/repository/shared_preferences_repository_impl.dart';
import 'package:tabata_timer/domain/usecases/shared_preferences_use_case_impl.dart';
import 'package:tabata_timer/presentation/home/home_screen.dart';
import 'package:tabata_timer/presentation/home/home_view_model.dart';
import 'package:provider/provider.dart';
import 'package:tabata_timer/domain/model/tabata.dart';
import 'package:tabata_timer/presentation/tabata/tabata_view.dart';
import 'package:tabata_timer/presentation/tabata/tabata_view_model.dart';

final class ChangeNotifierProviderContainer {
  static ChangeNotifierProvider createHomeViewModelProvider() {
    return ChangeNotifierProvider(
      create: (_) {
        final repository = SharedPreferencesRepositoryImpl();
        final useCase = SharedPreferencesUseCaseImpl(repository: repository);
        return HomeViewModel(useCase: useCase);
      },
      child: const HomeScreen(),
    );
  }

  static ChangeNotifierProvider createTabataViewModelProvider({Tabata tabata = const Tabata()}) {
    return ChangeNotifierProvider(
      create: (_) => TabataViewModel(tabata: tabata),
      child: const TabataView(),
    );
  }
}

final class ViewModelContainer {
  static HomeViewModel createHomeViewModel() {
    final repository = SharedPreferencesRepositoryImpl();
    final useCase = SharedPreferencesUseCaseImpl(repository: repository);
    return HomeViewModel(useCase: useCase);
  }

  static TabataViewModel createTabataViewModel({Tabata tabata = const Tabata()}) {
    return TabataViewModel(tabata: tabata);
  }
}