import 'package:exhibition_task/export.dart';

void main() async {
  setupLocator();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<ExhibitionModel>(create: (_) => ExhibitionModel())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Exhibition List Task',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      onGenerateRoute: Router.generateRoute,
    );
  }
}
