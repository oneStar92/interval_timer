import 'package:tabata_timer/presentation/home/home_view_model.dart';
import 'package:provider/provider.dart';
import 'package:tabata_timer/presentation/model/tabata.dart';
import 'package:tabata_timer/presentation/tabata/tabata_view_model.dart';

final homeViewModelProvider = ChangeNotifierProvider(create: (_) => HomeViewModel());
final tabataViewModelProvider = ChangeNotifierProvider(create: (_) => TabataViewModel(tabata: Tabata()));