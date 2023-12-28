import 'package:tabata_timer/presentation/home/home_view_model.dart';
import 'package:provider/provider.dart';

final homeViewModelProvider = ChangeNotifierProvider(create: (_) => HomeViewModel());