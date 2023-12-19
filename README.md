# Flutter Meals App with Riverpod

 Flutter Meals App, is a feature-rich mobile application built using Flutter and powered by Riverpod, a state management library. This app provides a seamless experience for users to explore and manage their favorite meals, organized in an efficient and visually appealing manner.

## Overview

The Flutter Meals App, enhanced with Riverpod, comprises several screens, each serving a specific purpose:

1. **TabsScreen:** The main screen features a bottom navigation bar for convenient navigation between different sections of the app.
   - **Favourites Screen:** Displays a list of favorite meals.
   - **Categories Screen:** Shows a list of meal categories.
   
2. **Meals Screen:** Lists meals within a selected category.      
3. **MealDetails Screen:** Provides detailed information about a specific meal.

## Distinct Screens and Features

1. **List of Categories:** Explore a variety of meal categories to find your desired cuisine.
2. **Meal List Display:** View a list of meals within a selected category.
3. **Meal Details:** Access detailed information about each meal, including the option to mark a meal as a favorite.
4. **Favourite Meals:** Quickly access a list of your favorite meals.
5. **Tabs with BottomNavigationBar:** Navigate seamlessly between different sections of the app using the bottom navigation bar.
6. **Drawer with Filters and Categories:** Use the drawer to apply filters and navigate through meal categories.

## Implementation Details

- **Riverpod State Management:** Leverages Riverpod for efficient state management, ensuring a scalable and maintainable codebase.
- **Navigator:** Implements various navigation techniques, such as popping with data using `PopupwithScope`, pushing with data, and push replacement.
- **StatefulWidget:** Utilizes the `initState()` method for initializing state.
- **Widgets:**
  - **Scaffold:** Configured with an appBar and a drawer.
  - **GridView:** Utilizes `SliverGridDelegateWithFixedCrossAxisCount` for displaying a grid of items.
  - **Text:** Styled using themes for a consistent look.
  - **InkWell:** Configured with splash color, border radius, and onTap functionality.
  - **Stack and Positioned:** Used for precise positioning of elements.
  - **Card:** Clips content with `Clip.hardEdge` and includes elevation.
  - **FadeInImage:** Implements a loading placeholder and handles image fitting.
  - **BottomNavigationBar:** Enables easy navigation between tabs.
  - **ListTile:** Displays content in a row with leading, title, and onTap functionality.
  - **SwitchListTile:** Provides a toggle button with title, subtitle, and onChanged callback.
  - **WillPopScope:** Handles the back button press and returns a future value.
  - **Navigator.of(context).push<>:** Utilized for asynchronous navigation, enabling the retrieval of values returned from WillPopScope.
    
Here is the demo video of the app:

https://github.com/TeniG/FlutterMealsApp/assets/43024245/fe354557-7729-443c-b571-8f225acd0ecc


