Namer App

Namer App is a Flutter application that generates random English word pairs and lets users “like” or “favorite” them. The app uses the english_words package to create random word pairs, and it features a clean, interactive UI with Material Design 3 (Material You). It also includes a favorites section to store and view liked word pairs.

Features

    •	Random Word Pair Generation: Generates new random word pairs with each click of the “Next” button.
    •	Like and Unlike: Users can like a word pair, which adds it to the favorites list, or unlike it to remove it.
    •	Favorites Page: View all liked word pairs in a separate Favorites section.
    •	Navigation: The app uses a NavigationRail for switching between the Home and Favorites views.

Tech Stack

    •	Flutter: The main framework for building the app.
    •	Provider: Used for state management to handle likes, favorites, and word pair generation.
    •	english_words: A package providing the random word pair functionality.

Getting Started

Prerequisites

    •	Flutter SDK installed.
    •	Basic understanding of Flutter development.

Installation

    1.	Clone this repository:

git clone https://github.com/your-username/namer-app.git
cd namer-app

    2.	Install dependencies:

flutter pub get

    3.	Run the app on an emulator or connected device:

flutter run

File Overview

    •	main.dart: Main entry point of the app.
    •	MyApp: The root widget that sets up the app theme and ChangeNotifierProvider.
    •	MyAppState: Manages the state, including the current word pair, favorites list, and button functions.
    •	MyHomePage: Main navigation and layout widget.
    •	GeneratorPage: Generates and displays the random word pairs with like functionality.
    •	FavoritesPage: Displays the list of favorited word pairs.
    •	BigCard: A styled card widget for displaying word pairs in a larger format.

How to Use

    1.	Home Page:
    •	Click the “Next” button to generate a new random word pair.
    •	Click the “Like” button to add the current word pair to your favorites or remove it if it’s already liked.
    2.	Favorites Page:
    •	Access by selecting the “Favorites” icon in the navigation rail.
    •	View all your favorited word pairs in a scrollable list.

Customization

    •	Color Scheme: The app uses a deep orange theme with Material Design 3. You can customize colors in ThemeData within the MyApp widget.
    •	NavigationRail: Easily switch between Home and Favorites pages by selecting the respective icons.

Dependencies

    •	flutter
    •	english_words
    •	provider

License

This project is licensed under the MIT License. See the LICENSE file for details.

Enjoy using Namer App!
