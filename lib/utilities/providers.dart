
import 'package:emaxapp/providers/storedata.dart';
import 'package:emaxapp/providers/getdata_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (_) => GetDataProvider()),
  ChangeNotifierProvider(create: (_) => FireStoreDataBase()),


];
