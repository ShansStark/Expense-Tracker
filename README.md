# Expense Tracker Application

## Overview
This application delves into the fundamentals of theming, user input handling, standardizing UI responses, chart data visualization, and utilizing MediaQuery for proper styling. It introduces a variety of new keywords, widgets, and essential Flutter tools and techniques.

## Expense Tracker Layout
**Main Screen:** The application starts with a central page featuring recorded expenses along with an accompanying bar chart.
**Add Expense Page:** A pop-up window prompts users to input expense details, including name, amount, category, and date/time.
**Delete Expense:** Implemented with a swipe gesture, users can swiftly remove expense data. An undo option at the bottom allows for quick restoration of deleted expenses if necessary.

## Tools and Data Types Learned and Used:

- **`uuid` Package:** Utilized to generate unique IDs for expenses.
- **`intl` Package:** Employed for generating date and time formatters.

## Widgets Used:
- **`ListView`:** Replaces the `Column` widget for default scrollable functionality.
- **`AppBar`:** Configured as a header with an "Add Expense" button for a polished design.
- **`Card`:** Organizes expenses in a card format.
- **`ShowModalBottomSheet`:** Displayed over the main screen for convenient addition and closure of widgets.
- **`TextField`:** Captures user inputs for strings, doubles, and date-time entries.
- **`Navigator`:** Used to close the `ShowModalBottomSheet` with `Navigator.pop(context)`.
- **`DropDownButton`:** Presents expense category options for user selection.
- **`ScaffoldMessenger`:** Used to display messages, integrating its built-in functions.
- **`showDialog`/`showCupertinoDialog`:** Implements a pop-up dialogue box for alerting users about incomplete or incorrect user data; `Cupertino` is the iOS version of the dialogue box.
- **`Dismissible`:** Removes expenses with left-right or right-left swipes.
- **`LayoutBuilder`:** Dynamically adjusts widget layout when the orientation changes.
- **`spacer`:** used in scenarios where the maximum possible space is required to be used with a row or column.
- **`TextEditingController`:** for allowing users to read and modify text.
- **`showDatePicker`:** With the help of await and async, the calendar style is displayed for user date selection. 
     
## Theme Functionality:
- Defines two sets of color schemes for light and dark modes.
- Styles the `Card`, `ElevatedButton`, and text themes based on the look using the `.copyWith()` function.
- **`.fromSeed()`:** Used for the auto-creation of color shades for light and dark modes.
- using `.` with the colour variable gives various options for shades and containers.

## Keywords, Functions and Other:
- **`enum`:** Sets a variety of expense options as categories.
- **`!`:** Added an exclamation to some fields to assure the compiler that they wouldn't be null at runtime.
- **`.`:** Accesses additional features of some widgets along with context data, like `ScaffoldMessenger.of(context).showSnackBar()`.
- **`mediaQuery`:** Accesses the device's orientation to adjust the screen layout for an enhanced look.
- **`future`:** a datatype used by the date and time where the user selects date and returns as `future` datatype.
- **`trim()`:** removing extra space in user input.
- **`tryParse()`:** conversion of the amount text field to double.   

## Acknowledgments

I would like to express my gratitude to [Maximilian Schwarzmüller](https://www.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps/#instructor-2) for their exceptional Flutter and Dart course. This project wouldn't have been possible without their valuable teaching and guidance.
