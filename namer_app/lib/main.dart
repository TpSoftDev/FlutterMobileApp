// Ignore certain lint warnings for preferred code styles
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// Import necessary packages
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Main function to run the app
void main() {
  runApp(MyApp());
}

// Root widget of the app
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      // Provides MyAppState to the widget tree
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: MyHomePage(), // Sets the homepage of the app
      ),
    );
  }
}

// Holds the application's state, including current word pair, favorites, and history
class MyAppState extends ChangeNotifier {
  var current = WordPair.random(); // Random word pair
  var history = <WordPair>[]; // List to track history of generated word pairs

  GlobalKey? historyListKey; // Key to handle the animated list in history

  // Generates a new random word pair and adds the current one to history
  void getNext() {
    history.insert(0, current); // Adds current word pair to history at index 0
    var animatedList = historyListKey?.currentState as AnimatedListState?;
    animatedList?.insertItem(0); // Animates adding the new item
    current = WordPair.random(); // Updates current word pair
    notifyListeners(); // Notifies listeners to update the UI
  }

  var favorites = <WordPair>[]; // List to hold favorite word pairs

  // Toggles favorite status of a word pair
  void toggleFavorite([WordPair? pair]) {
    pair = pair ?? current; // Uses current word pair if none is provided
    if (favorites.contains(pair)) {
      favorites.remove(pair); // Removes from favorites if already in list
    } else {
      favorites.add(pair); // Adds to favorites if not already present
    }
    notifyListeners(); // Notifies listeners to update the UI
  }

  // Removes a word pair from the favorites list
  void removeFavorite(WordPair pair) {
    favorites.remove(pair);
    notifyListeners(); // Notifies listeners to update the UI
  }
}

// Home page of the app with navigation and conditional layout
class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0; // Tracks the selected navigation index

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme; // Current color scheme

    // Displays the selected page based on the index
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = GeneratorPage();
      case 1:
        page = FavoritesPage();
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    // Main area container with background color and animation
    var mainArea = ColoredBox(
      color: colorScheme.surfaceContainerHighest,
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 200),
        child: page,
      ),
    );

    // Conditionally renders navigation based on screen width
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 450) {
            // Mobile-friendly layout with BottomNavigationBar for narrow screens
            return Column(
              children: [
                Expanded(child: mainArea),
                SafeArea(
                  child: BottomNavigationBar(
                    items: [
                      BottomNavigationBarItem(
                        icon: Icon(Icons.home),
                        label: 'Home',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.favorite),
                        label: 'Favorites',
                      ),
                    ],
                    currentIndex: selectedIndex,
                    onTap: (value) {
                      setState(() {
                        selectedIndex = value;
                      });
                    },
                  ),
                )
              ],
            );
          } else {
            // Layout for larger screens using NavigationRail
            return Row(
              children: [
                SafeArea(
                  child: NavigationRail(
                    extended: constraints.maxWidth >= 600,
                    destinations: [
                      NavigationRailDestination(
                        icon: Icon(Icons.home),
                        label: Text('Home'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.favorite),
                        label: Text('Favorites'),
                      ),
                    ],
                    selectedIndex: selectedIndex,
                    onDestinationSelected: (value) {
                      setState(() {
                        selectedIndex = value;
                      });
                    },
                  ),
                ),
                Expanded(child: mainArea),
              ],
            );
          }
        },
      ),
    );
  }
}

// Page that generates and displays random word pairs
class GeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>(); // Accesses app state
    var pair = appState.current; // Current word pair

    // Checks if current word pair is a favorite
    IconData icon = appState.favorites.contains(pair)
        ? Icons.favorite
        : Icons.favorite_border;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: HistoryListView(), // Displays word pair history
          ),
          SizedBox(height: 10),
          BigCard(pair: pair), // Displays the current word pair
          SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  appState.toggleFavorite(); // Toggles favorite status
                },
                icon: Icon(icon),
                label: Text('Like'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  appState.getNext(); // Generates a new word pair
                },
                child: Text('Next'),
              ),
            ],
          ),
          Spacer(flex: 2),
        ],
      ),
    );
  }
}

// Widget to display the current word pair in a styled card
class BigCard extends StatelessWidget {
  const BigCard({
    Key? key,
    required this.pair,
  }) : super(key: key);

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context); // Accesses theme data
    var style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: AnimatedSize(
          duration: Duration(milliseconds: 200),
          child: MergeSemantics(
            child: Wrap(
              children: [
                Text(
                  pair.first,
                  style: style.copyWith(fontWeight: FontWeight.w200),
                ),
                Text(
                  pair.second,
                  style: style.copyWith(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Page that displays a list of favorite word pairs
class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context); // Accesses theme data
    var appState = context.watch<MyAppState>(); // Accesses app state

    if (appState.favorites.isEmpty) {
      return Center(
        child: Text('No favorites yet.'), // Message when there are no favorites
      );
    }

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 80), // Increased height to move content lower
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Text(
              'You have ${appState.favorites.length} favorites:',
              style:
                  theme.textTheme.titleLarge, // Changed headline6 to titleLarge
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 400,
                childAspectRatio: 400 / 80,
              ),
              itemCount: appState.favorites.length,
              itemBuilder: (context, index) {
                var pair = appState.favorites[index];
                return ListTile(
                  leading: IconButton(
                    icon: Icon(Icons.delete_outline, semanticLabel: 'Delete'),
                    color: theme.colorScheme.primary,
                    onPressed: () {
                      appState.removeFavorite(pair); // Removes from favorites
                    },
                  ),
                  title: Text(
                    pair.asLowerCase,
                    semanticsLabel: pair.asPascalCase,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Widget that displays a history of previously generated word pairs
class HistoryListView extends StatefulWidget {
  const HistoryListView({Key? key}) : super(key: key);

  @override
  State<HistoryListView> createState() => _HistoryListViewState();
}

class _HistoryListViewState extends State<HistoryListView> {
  final _key = GlobalKey(); // Key for managing animated list

  // Gradient mask to fade out top of the list, suggesting continuation
  static const Gradient _maskingGradient = LinearGradient(
    colors: [Colors.transparent, Colors.black],
    stops: [0.0, 0.5],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>(); // Accesses app state

    appState.historyListKey = _key; // Sets key for animated list

    return ShaderMask(
      shaderCallback: (bounds) => _maskingGradient.createShader(bounds),
      blendMode: BlendMode.dstIn,
      child: AnimatedList(
        key: _key,
        reverse: true, // Most recent items appear at the top
        itemBuilder: (context, index, animation) {
          var pair = appState.history[index];
          return SizeTransition(
            sizeFactor: animation,
            child: Center(
              child: TextButton.icon(
                onPressed: () {
                  appState.toggleFavorite(pair); // Toggles favorite status
                },
                icon: appState.favorites.contains(pair)
                    ? Icon(Icons.favorite, size: 12)
                    : SizedBox(),
                label: Text(
                  pair.asLowerCase,
                  semanticsLabel: pair.asPascalCase,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
