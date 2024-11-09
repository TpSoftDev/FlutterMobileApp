# FlutterMobileApp

Namer App is a Flutter application that generates random English word pairs, allowing users to view, like, and save their favorite pairs. This app demonstrates the use of state management, custom widgets, and navigation in Flutter.

User Flow

The following images and video demonstrate the flow of the Namer App from word generation to managing favorites.

1. Home Screen - Generating Random Word Pairs

The Home screen displays a randomly generated word pair with the option to like it. Tapping the button generates a new word pair.
![Simulator Screenshot - iPhone 16 - 2024-11-09 at 14 00 35](https://github.com/user-attachments/assets/3ab28c0a-6abf-4f19-b784-d26b3fd31afb)


2. Adding a Word Pair to Favorites

To add a word pair to your favorites, tap the “Like” button. The heart icon fills to indicate that the word pair has been added to your list of favorites.
![Simulator Screenshot - iPhone 16 - 2024-11-09 at 14 00 52](https://github.com/user-attachments/assets/9009bb0d-45a4-4fef-9d58-3ed35761c675)

3. Viewing Favorites

Navigate to the Favorites tab to see all the word pairs you’ve saved. Here, you can view your saved pairs and remove any that you no longer want in your favorites.
![Simulator Screenshot - iPhone 16 - 2024-11-09 at 14 01 40](https://github.com/user-attachments/assets/ca88fc95-a611-41fd-842f-f75bb2dd5f1e)


4. Tracking History

The app also tracks a history of word pairs generated. The History view shows a list of previously generated word pairs, with an animated list for a smooth user experience.

![Simulator Screenshot - iPhone 16 - 2024-11-09 at 14 01 19](https://github.com/user-attachments/assets/a298c53c-4246-4c3d-bc6b-00bf18ea731a)

Video Tutorial

For a full walkthrough, check out this video tutorial that guides you through the app’s features and shows how to use each part of the interface effectively.



You’ll need to replace the example links (example-image-favorite.png, example-image-favorites-page.png, example-image-history.png) with your actual image URLs hosted on GitHub or any other image-hosting platform. Also, add the correct YouTube or video link for the tutorial if it’s hosted online.

This structure will guide users through the app’s functionality and provide a clearer understanding of how to interact with each feature. Let me know if you need further customization for the README!
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
