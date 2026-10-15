# Basic Flutter Widgets

A practical reference for Flutter widgets commonly used when building a simple app and defining a widget tree.

## 1. App and Root Widgets

| Widget | Purpose |
|---|---|
| `MaterialApp` | Root of a Material Design application |
| `CupertinoApp` | Root of an iOS-style application |
| `Scaffold` | Basic Material page structure |
| `SafeArea` | Keeps content away from system UI/notches |
| `Theme` | Applies a theme to part of the widget tree |
| `MediaQuery` | Accesses screen and display information |

### Example

```dart
MaterialApp(
  home: Scaffold(
    appBar: AppBar(
      title: const Text('My App'),
    ),
    body: const SafeArea(
      child: Text('Hello Flutter'),
    ),
  ),
)
```

---

## 2. Text and Display Widgets

| Widget | Purpose |
|---|---|
| `Text` | Display text |
| `RichText` | Display text with multiple styles |
| `SelectableText` | Text that users can select/copy |
| `Icon` | Display an icon |
| `Image` | Display an image |
| `FlutterLogo` | Flutter logo |
| `Placeholder` | Temporary visual placeholder |
| `Divider` | Horizontal divider |
| `VerticalDivider` | Vertical divider |
| `CircleAvatar` | Circular avatar/image |

### Example

```dart
Column(
  children: [
    const Text(
      'Welcome',
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    ),
    const Icon(Icons.home),
    Image.asset('assets/logo.png'),
  ],
)
```

---

## 3. Basic Layout Widgets

| Widget | Purpose |
|---|---|
| `Container` | General-purpose box with size, padding, margin, decoration |
| `SizedBox` | Fixed spacing or size |
| `Padding` | Adds padding around a child |
| `Center` | Centers a child |
| `Align` | Positions a child |
| `ConstrainedBox` | Applies size constraints |
| `LimitedBox` | Limits maximum size |
| `FractionallySizedBox` | Sizes child as a fraction of available space |
| `FittedBox` | Scales child to fit |
| `AspectRatio` | Forces an aspect ratio |
| `Expanded` | Makes a child fill available Row/Column space |
| `Flexible` | Allows flexible sizing in Row/Column |
| `Spacer` | Adds flexible empty space |
| `Wrap` | Places children on multiple lines |
| `Stack` | Places widgets on top of each other |
| `Positioned` | Positions a child inside a `Stack` |
| `IndexedStack` | Shows one child from a stack |

### Example

```dart
Padding(
  padding: const EdgeInsets.all(16),
  child: Column(
    children: [
      const Text('Profile'),

      const SizedBox(height: 20),

      Row(
        children: [
          const Icon(Icons.person),
          const SizedBox(width: 8),
          const Expanded(
            child: Text('John Doe'),
          ),
          const Icon(Icons.chevron_right),
        ],
      ),
    ],
  ),
)
```

---

## 4. Row, Column, and Stack

### Row

Places children horizontally.

```dart
Row(
  children: [
    const Icon(Icons.home),
    const SizedBox(width: 8),
    const Text('Home'),
  ],
)
```

### Column

Places children vertically.

```dart
Column(
  children: [
    const Text('Name'),
    const Text('Email'),
    const Text('Phone'),
  ],
)
```

### Stack

Places children on top of each other.

```dart
Stack(
  children: [
    Image.asset('assets/photo.png'),

    const Positioned(
      bottom: 10,
      left: 10,
      child: Text(
        'Photo',
        style: TextStyle(color: Colors.white),
      ),
    ),
  ],
)
```

---

## 5. Scrolling Widgets

| Widget | Purpose |
|---|---|
| `SingleChildScrollView` | Scroll a single child |
| `ListView` | Scrollable list |
| `ListView.builder` | Efficient dynamic list |
| `ListView.separated` | List with separators |
| `GridView` | Scrollable grid |
| `GridView.builder` | Efficient dynamic grid |
| `PageView` | Swipe between pages |
| `CustomScrollView` | Advanced scrolling with slivers |
| `NestedScrollView` | Nested scrolling layouts |

### List Example

```dart
ListView.builder(
  itemCount: 20,
  itemBuilder: (context, index) {
    return ListTile(
      leading: const Icon(Icons.person),
      title: Text('User $index'),
      subtitle: const Text('Flutter user'),
    );
  },
)
```

### Grid Example

```dart
GridView.builder(
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
  ),
  itemCount: 10,
  itemBuilder: (context, index) {
    return Card(
      child: Center(
        child: Text('Item $index'),
      ),
    );
  },
)
```

---

## 6. Buttons

| Widget | Purpose |
|---|---|
| `ElevatedButton` | Prominent button |
| `FilledButton` | Filled Material button |
| `OutlinedButton` | Outlined button |
| `TextButton` | Text-only button |
| `IconButton` | Button containing an icon |
| `FloatingActionButton` | Floating action button |
| `DropdownButton` | Dropdown selection |
| `SegmentedButton` | Selection between segments |

### Example

```dart
Column(
  children: [
    ElevatedButton(
      onPressed: () {},
      child: const Text('Save'),
    ),

    OutlinedButton(
      onPressed: () {},
      child: const Text('Cancel'),
    ),

    TextButton(
      onPressed: () {},
      child: const Text('Learn More'),
    ),

    IconButton(
      onPressed: () {},
      icon: const Icon(Icons.settings),
    ),
  ],
)
```

---

## 7. Input and Form Widgets

| Widget | Purpose |
|---|---|
| `TextField` | Text input |
| `TextFormField` | Text input with form validation |
| `Form` | Groups form fields |
| `Checkbox` | Boolean selection |
| `CheckboxListTile` | Checkbox with list tile layout |
| `Radio` | Single selection |
| `RadioListTile` | Radio with list tile layout |
| `Switch` | On/off selection |
| `SwitchListTile` | Switch with list tile layout |
| `Slider` | Select a numeric value |
| `RangeSlider` | Select a range |
| `DropdownButton` | Select from a dropdown |
| `DropdownButtonFormField` | Dropdown inside a form |
| `Autocomplete` | Text autocomplete |
| `SearchBar` | Search input |

### TextField Example

```dart
TextField(
  decoration: InputDecoration(
    labelText: 'Email',
    hintText: 'Enter your email',
    prefixIcon: Icon(Icons.email),
    border: OutlineInputBorder(),
  ),
)
```

### Form Example

```dart
Form(
  child: Column(
    children: [
      TextFormField(
        decoration: const InputDecoration(
          labelText: 'Name',
        ),
      ),

      const SizedBox(height: 16),

      TextFormField(
        decoration: const InputDecoration(
          labelText: 'Email',
        ),
      ),

      const SizedBox(height: 16),

      ElevatedButton(
        onPressed: () {},
        child: const Text('Submit'),
      ),
    ],
  ),
)
```

---

## 8. Cards and List Components

| Widget | Purpose |
|---|---|
| `Card` | Material card |
| `ListTile` | Standard list row |
| `ExpansionTile` | Expandable list row |
| `Chip` | Compact information/action element |
| `ChoiceChip` | Single-choice chip |
| `FilterChip` | Filter selection |
| `ActionChip` | Action chip |
| `InputChip` | Input/tag chip |
| `Badge` | Small notification/count indicator |

### Card Example

```dart
Card(
  child: ListTile(
    leading: const CircleAvatar(
      child: Icon(Icons.person),
    ),
    title: const Text('John Doe'),
    subtitle: const Text('john@example.com'),
    trailing: const Icon(Icons.arrow_forward_ios),
    onTap: () {},
  ),
)
```

---

## 9. App Bars and Page Structure

| Widget | Purpose |
|---|---|
| `AppBar` | Standard Material app bar |
| `SliverAppBar` | App bar inside a scrollable layout |
| `BottomAppBar` | Bottom app bar |
| `PreferredSize` | Gives a widget a preferred size |

### Example

```dart
Scaffold(
  appBar: AppBar(
    title: const Text('Home'),
    actions: [
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.search),
      ),
    ],
  ),
  body: const Center(
    child: Text('Home Page'),
  ),
)
```

---

## 10. Navigation Widgets

| Widget | Purpose |
|---|---|
| `Navigator` | Manages navigation stack |
| `MaterialPageRoute` | Material page route |
| `NavigationBar` | Bottom navigation |
| `NavigationRail` | Side navigation |
| `NavigationDrawer` | Navigation drawer |
| `Drawer` | Traditional Material drawer |
| `TabBar` | Tab navigation |
| `TabBarView` | Content for tabs |
| `DefaultTabController` | Provides tab controller |

### Bottom Navigation Example

```dart
Scaffold(
  body: const Center(
    child: Text('Home'),
  ),

  bottomNavigationBar: NavigationBar(
    destinations: const [
      NavigationDestination(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      NavigationDestination(
        icon: Icon(Icons.person),
        label: 'Profile',
      ),
      NavigationDestination(
        icon: Icon(Icons.settings),
        label: 'Settings',
      ),
    ],
  ),
)
```

---

## 11. Dialogs and Bottom Sheets

| Widget/API | Purpose |
|---|---|
| `AlertDialog` | Alert/confirmation dialog |
| `SimpleDialog` | Simple selection dialog |
| `Dialog` | Custom dialog |
| `showDialog()` | Displays a dialog |
| `showModalBottomSheet()` | Displays modal bottom sheet |
| `showBottomSheet()` | Displays persistent bottom sheet |
| `PopupMenuButton` | Popup menu |
| `MenuAnchor` | Material menu |

### Dialog Example

```dart
showDialog(
  context: context,
  builder: (context) {
    return AlertDialog(
      title: const Text('Delete item?'),
      content: const Text(
        'This action cannot be undone.',
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Delete'),
        ),
      ],
    );
  },
);
```

---

## 12. Progress and Loading

| Widget | Purpose |
|---|---|
| `CircularProgressIndicator` | Circular loading indicator |
| `LinearProgressIndicator` | Linear loading indicator |
| `RefreshProgressIndicator` | Pull-to-refresh progress indicator |

### Example

```dart
const Center(
  child: CircularProgressIndicator(),
)
```

---

## 13. Gestures and Interaction

| Widget | Purpose |
|---|---|
| `GestureDetector` | Detect gestures |
| `InkWell` | Material touch/ripple interaction |
| `InkResponse` | Material interaction |
| `Dismissible` | Swipe-to-dismiss |
| `Draggable` | Drag an item |
| `DragTarget` | Receive dragged items |
| `InteractiveViewer` | Pan/zoom content |
| `MouseRegion` | Detect mouse interaction |

### Gesture Example

```dart
GestureDetector(
  onTap: () {
    print('Tapped');
  },
  child: Container(
    padding: const EdgeInsets.all(20),
    child: const Text('Tap Me'),
  ),
)
```

---

## 14. Visibility and Interaction Control

| Widget | Purpose |
|---|---|
| `Visibility` | Show/hide a widget |
| `Offstage` | Keep widget out of layout/painting |
| `Opacity` | Change transparency |
| `IgnorePointer` | Ignore pointer events |
| `AbsorbPointer` | Absorb pointer events |
| `AnimatedOpacity` | Animate opacity changes |

### Example

```dart
Visibility(
  visible: isLoggedIn,
  child: const Text('Welcome back!'),
)
```

---

## 15. Animation Widgets

| Widget | Purpose |
|---|---|
| `AnimatedContainer` | Animate container properties |
| `AnimatedOpacity` | Animate opacity |
| `AnimatedPadding` | Animate padding |
| `AnimatedAlign` | Animate alignment |
| `AnimatedPositioned` | Animate position in Stack |
| `AnimatedSwitcher` | Animate between widgets |
| `AnimatedCrossFade` | Cross-fade between two widgets |
| `AnimatedSize` | Animate size |
| `TweenAnimationBuilder` | Simple custom animation |
| `FadeTransition` | Fade animation |
| `ScaleTransition` | Scale animation |
| `SlideTransition` | Slide animation |
| `RotationTransition` | Rotation animation |
| `SizeTransition` | Size animation |

### AnimatedContainer Example

```dart
AnimatedContainer(
  duration: const Duration(milliseconds: 300),
  width: isLarge ? 200 : 100,
  height: 100,
  decoration: BoxDecoration(
    color: isLarge ? Colors.blue : Colors.red,
    borderRadius: BorderRadius.circular(12),
  ),
)
```

---

## 16. Useful Builder / Utility Widgets

| Widget | Purpose |
|---|---|
| `Builder` | Creates a new build context |
| `StatefulBuilder` | Local state inside a section |
| `FutureBuilder` | Builds UI from a Future |
| `StreamBuilder` | Builds UI from a Stream |
| `ValueListenableBuilder` | Rebuilds from a ValueListenable |
| `LayoutBuilder` | Builds based on available constraints |
| `OrientationBuilder` | Builds based on orientation |
| `SafeArea` | Handles system-safe areas |
| `Semantics` | Adds accessibility information |

### FutureBuilder Example

```dart
FutureBuilder<String>(
  future: loadData(),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const CircularProgressIndicator();
    }

    if (snapshot.hasError) {
      return const Text('Something went wrong');
    }

    return Text(snapshot.data ?? '');
  },
)
```

---

# Common Widget Tree Patterns

## Simple Page

```text
MaterialApp
└── Scaffold
    ├── AppBar
    │   └── Text
    └── body
        └── Center
            └── Text
```

## Form Page

```text
Scaffold
├── AppBar
│   └── Text
└── body
    └── Padding
        └── Form
            └── Column
                ├── TextFormField
                ├── TextFormField
                ├── SizedBox
                └── ElevatedButton
```

## List Page

```text
Scaffold
├── AppBar
│   └── Text
└── body
    └── ListView.builder
        └── Card
            └── ListTile
                ├── leading → Icon
                ├── title → Text
                ├── subtitle → Text
                └── trailing → Icon
```

## Dashboard

```text
Scaffold
├── AppBar
├── body
│   └── SingleChildScrollView
│       └── Column
│           ├── Text
│           ├── Row
│           │   ├── Expanded → Card
│           │   └── Expanded → Card
│           └── GridView
└── FloatingActionButton
```

## Bottom Navigation App

```text
Scaffold
├── AppBar
├── body
│   └── IndexedStack
│       ├── HomePage
│       ├── SearchPage
│       └── ProfilePage
└── NavigationBar
    ├── NavigationDestination
    ├── NavigationDestination
    └── NavigationDestination
```

# Quick Reference: Most-Used Widgets

For a basic Flutter app, these are the widgets worth learning first:

```text
MaterialApp
Scaffold
AppBar
SafeArea

Container
SizedBox
Padding
Center
Align

Row
Column
Stack
Expanded
Flexible
Spacer
Wrap

Text
Icon
Image
Card
ListTile
Divider

ListView
ListView.builder
GridView
GridView.builder
SingleChildScrollView

TextField
TextFormField
Form
Checkbox
Radio
Switch
Slider
DropdownButton

ElevatedButton
FilledButton
OutlinedButton
TextButton
IconButton
FloatingActionButton

NavigationBar
NavigationDrawer
Drawer
TabBar
TabBarView

AlertDialog
showDialog
showModalBottomSheet

CircularProgressIndicator
LinearProgressIndicator

GestureDetector
InkWell
Dismissible

FutureBuilder
StreamBuilder
LayoutBuilder

AnimatedContainer
AnimatedOpacity
AnimatedSwitcher
```

## A General-Purpose Widget Tree Template

```dart
MaterialApp(
  home: Scaffold(
    appBar: AppBar(
      title: const Text('My App'),
    ),

    body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Page Title',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            const TextField(
              decoration: InputDecoration(
                labelText: 'Enter something',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Save'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),

    floatingActionButton: FloatingActionButton(
      onPressed: () {},
      child: const Icon(Icons.add),
    ),
  ),
)
```

This template demonstrates the basic relationship between **root → page structure → layout → content → interaction** that you'll use throughout Flutter development.
