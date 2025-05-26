### Project Name: SwingScope

### Description:

**SwingScope** is a cross-platform Flutter application designed to visualize wrist motion data captured during golf swings. The app parses motion data from JSON files and displays detailed graphs of wrist **flexion/extension** and **ulnar/radial deviation** over time.

Users can browse a list of recorded swings, inspect each swing individually, and analyze key metrics using smooth, interactive line graphs. The application supports intuitive navigation between swings and allows deletion of specific recordings to keep the dataset clean.

---

### Key Features:

* 📋 **Home Page:** Displays a list of available swing recordings.
* 📈 **Inspection Page:** Visualizes wrist motion metrics for selected swings.
* 🔄 **Navigation:** Previous and Next buttons to cycle through swings.
* ❌ **Delete Function:** Remove selected swings dynamically.
* 🎯 **Clear Graphs:** Time-series line graphs for motion data.
* 🚀 **Responsive UI:** Smooth and intuitive for both Android and iOS.

---

### State Management:

SwingScope uses **Cubit** from the [Flutter Bloc](https://pub.dev/packages/flutter_bloc) package for managing app state in a clean and scalable way. The `SwingCubit` handles:

* Loading and storing the list of golf swing captures.
* Tracking the currently selected swing.
* Navigating between swings.
* Deleting a selected swing and updating the state accordingly.

**Why Cubit?**

* Lightweight and easy to understand.
* Suitable for simple UI state transitions.
* Separates UI logic from business logic, making the app easier to maintain and test.

---

### **📦 Libraries Used**

Here’s a list of key Flutter packages used in the project:

| Package                    | Purpose                                                                                    |
| -------------------------- | ------------------------------------------------------------------------------------------ |
| `flutter_bloc`             | For state management using Cubit.                                                          |
| `fl_chart`                 | To render smooth and customizable line graphs for flexion/extension and ulnar/radial data. |
| `path_provider`            | To access device directories if persistent storage is later needed.                        |
| `flutter_svg` *(optional)* | To include vector icons or illustrations (if used for UI polish).                          |
| `intl` *(optional)*        | For date formatting if swing timestamps are displayed.                                     |

---

### 📁 Example Directory Layout

```
lib/
├── main.dart
├── models/              # SwingCapture model
├── cubit/               # Cubit and states for managing swing data
├── pages/               # HomePage and InspectionPage UI
├── widgets/             # Custom widgets like graph viewer
├── utils/               # JSON loader functions
assets/
└── swings/              # JSON swing capture files (1.json, 2.json, ...)
```