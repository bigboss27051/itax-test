import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:itax_test/screens/screens.dart';
import 'package:itax_test/theme.dart';
import 'package:redux/redux.dart';
import 'package:redux_persist/redux_persist.dart';
import 'package:redux_thunk/redux_thunk.dart';
import './redux/redux.dart';

Future<void> main() async {
  var initialState;
  WidgetsFlutterBinding.ensureInitialized(); // ensure flutter initialized.
  var storage = new FlutterSecureStorage();
  final persistor = Persistor<AppState>(
    storage: SecureStorage(storage = storage),
    serializer: JsonSerializer<AppState>(AppState.fromJson),
  );
  try {
    initialState = await persistor.load();
  } catch (e) {
    print(e);
    initialState = null;
  }
  final store = Store<AppState>(appReducer,
      initialState: initialState ?? new AppState.initial(),
      middleware: [thunkMiddleware, persistor.createMiddleware()]);
  runApp(new MyApp(
    store: store,
  ));
}

class MyApp extends StatefulWidget {
  MyApp({
    Key key,
    this.store,
  }) : super(key: key);
  final Store<AppState> store;

  @override
  _MyAppState createState() => _MyAppState(store);
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  Store<AppState> store;
  _MyAppState(this.store);

  @override
  Widget build(BuildContext context) {
    return new StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
          title: 'Todos Mobile',
          theme: getTheme(context),
          home: SplashScreen(),
          routes: <String, WidgetBuilder>{
            '/login': (BuildContext context) => new LoginScreen(),
          }),
    );
  }
}
