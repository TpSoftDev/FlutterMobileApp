# FlutterMobileApp
#Namer App

Namer App is a Flutter application that generates random English word pairs, allowing users to view, like, and save their favorite pairs. This app demonstrates the use of state management, custom widgets, and navigation in Flutter.

Features

    •	Random Word Pair Generation: Generate random word pairs and display them in an interactive UI.
    •	Favorites Management: Add or remove word pairs from a list of favorites.
    •	History Tracking: Keep a history of previously generated word pairs.
    •	Responsive Layout: Adapts layout based on screen width, using a Bottom Navigation Bar for mobile and a Navigation Rail for larger screens.

App Structure

    •	MyApp: Main entry point. Sets up MaterialApp and ChangeNotifierProvider for state management.
    •	MyAppState: Handles app state, including current word pair, history, and favorites. Contains methods to generate new pairs and manage favorites.
    •	MyHomePage: Main app screen with navigation for switching between the generator and favorites pages.
    •	GeneratorPage: Displays the current word pair, allows users to like it, and fetches the next random word pair.
    •	FavoritesPage: Lists saved favorites with the option to remove them.
    •	BigCard: Stylized card for displaying the current word pair.
    •	HistoryListView: Shows a list of previously generated word pairs with an animated list.

Dependencies

    •	english_words: Provides random English word pairs.
    •	provider: State management solution.
    •	flutter/material.dart: Core Flutter package for building the UI.

Getting Started

    1.	Clone the Repository: Download the app’s code from the repository.
    2.	Install Dependencies: Run flutter pub get to install required packages.
    3.	Run the App: Use flutter run to start the app on your desired platform.

Code Highlights

    •	State Management: MyAppState class, which extends ChangeNotifier, allows for state updates using the Provider package.
    •	Animated List: HistoryListView uses AnimatedList to provide a smooth animation when adding new word pairs to the history.
    •	Responsive UI: Layout changes between BottomNavigationBar and NavigationRail based on screen width for a better user experience.

Customization

    •	Theme: Easily customizable by changing the color scheme and primary color in MyApp.
    •	Favorites Logic: Modify the toggleFavorite and removeFavorite methods in MyAppState to implement additional behavior, such as persistent storage for favorites.

Known Issues

    •	None at the moment. For bug reports, please create an issue in the repository.

License

This project is licensed under the MIT License.
