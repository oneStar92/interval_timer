import 'package:interval_timer/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

final homeViewModelProvider = ChangeNotifierProvider(create: (_) => HomeViewModel());