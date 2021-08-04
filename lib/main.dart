import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_tutorials/ui/get_it/get_it_setup.dart';
import 'package:flutter_tutorials/ui/route/route_generator.dart';
import 'package:flutter_tutorials/ui/views/home_view/home-screen.dart';
import 'package:flutter_tutorials/view_models/home_view_model.dart';
import 'package:flutter_tutorials/theme/theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await DotEnv.load(fileName: '.env');
  setUpGetIt();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: HomeViewModel(),
        ),
      ],
      child: MaterialApp(
        theme: MyTheme.lightTheme(context),
        navigatorKey: GeneratedRoute.navigatorKey,
        initialRoute: HomeScreen.routeName,
        onGenerateRoute: GeneratedRoute.onGenerate,
      ),
    );
  }
}
