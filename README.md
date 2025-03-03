# The One Book Designer

The One Book Designer is a Flutter package that provides a customizable widget for displaying book page animations. This widget allows you to create an engaging reading experience by animating the transition between pages using a list of image URLs.

## Features

- **Page Animation**: Smooth animations for flipping through pages.
- **Support for Remote Images**: Easily display images from the web.
- **Customizable**: Integrate with your existing Flutter applications with minimal setup.

## Installation

To use The One Book Designer in your Flutter project, add the following dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  theone_book_designer: ^1.0.0 # Replace with the actual version

```

## Example
```
import 'package:flutter/material.dart';
import 'package:theone_book_designer/theone_book_designer.dart';

void main() {
runApp(const MyApp());
}

class MyApp extends StatelessWidget {
const MyApp({super.key});

@override
    Widget build(BuildContext context) {
        return MaterialApp(
        title: 'The One Book Designer Example',
        home: Scaffold(
        appBar: AppBar(
        title: const Text('Book Page Animation Example'),
        ),
    body: const TheOneBookDesigner(
        imageUrls: [
                'https://picsum.photos/160/180?random=1',
                'https://picsum.photos/160/180?random=2',
                'https://picsum.photos/160/180?random=3',
                ],
            ),
        ),
    );
    
}
```
![book_page_animation](https://github.com/user-attachments/assets/c39228b0-3edf-4c1a-9fd9-1181f739c681)


- Powered by The One Technologies
