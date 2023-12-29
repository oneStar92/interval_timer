import 'package:tabata_timer/common/constants.dart';
import 'package:tabata_timer/presentation/home/home_view_model.dart';
import 'package:provider/provider.dart';
import 'package:tabata_timer/presentation/home/list_item_view_model.dart';

final homeViewModelProvider = ChangeNotifierProvider(create: (_) => HomeViewModel());
final listItemViewModels = homeScreenRowsGroupedBySection
    .map((section) => section.map((row) => ListItemViewModel(element: row)).toList())
    .toList();
