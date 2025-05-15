# Weather App

A Flutter-based weather application that provides current weather conditions and forecasts.

## Table of Contents

1. [Introduction](#introduction)
2. [Features](#features)
3. [Packages Used](#packages-used)
4. [Getting Started](#getting-started)
5. [Project Structure](#project-structure)
6. [API Documentation](#api-documentation)
7. [Contributing](#contributing)
8. [License](#license)

## Introduction

This weather app is built using Flutter, a popular mobile app development framework. The app provides current weather conditions and forecasts for a given location. It uses the OpenWeatherMap API to fetch weather data.

## Features

- Current weather conditions (temperature, humidity, wind speed, etc.)
- Weather forecasts for the next 5 days
- Location-based weather data
- Customizable theme and layout

## Packages Used

- `flutter`: The Flutter framework
- `flutter_bloc`: A state management library for Flutter
- `get`: A navigation library for Flutter
- `http`: A library for making HTTP requests
- `intl`: A library for internationalization and localization
- `weather_app`: A custom package for weather-related functionality
- `geolocator`: A library for geolocation services
- `permission_handler`: A library for handling permissions
- `fpdart`: A library for functional programming in Dart

## Getting Started

To run the app, follow these steps:

1. Clone the repository: `git clone https://github.com/NasimuddinSk/weather-app.git`
2. Install the dependencies: `flutter pub get`
3. Run the app: `flutter run`

## Project Structure

The project is structured as follows:

- `lib`: The main application code
  - `main.dart`: The entry point of the app
  - `app.dart`: The app widget
  - `home_page.dart`: The home page widget
  - `weather_cubit.dart`: The weather cubit
  - `weather_repository.dart`: The weather repository
- `core`: The core functionality of the app
  - `locators`: The locator package
  - `utils`: Utility functions
- `data`: The data models and repositories
  - `weather_model.dart`: The weather data model
- `features`: The feature-specific code
  - `home`: The home page feature

## API Documentation

The app uses the OpenWeatherMap API to fetch weather data. The API documentation can be found at [https://openweathermap.org/api](https://openweathermap.org/api).

## Contributing

Contributions are welcome! If you'd like to contribute to the project, please fork the repository and submit a pull request.

## License

The project is licensed under the MIT License. See [LICENSE](LICENSE) for more information.

## Packages

### flutter

The Flutter framework.

- Version: `2.10.5`
- Repository: [https://github.com/flutter/flutter](https://github.com/flutter/flutter)

### flutter_bloc

A state management library for Flutter.

- Version: `9.1.1`
- Repository: [https://github.com/felangel/bloc](https://github.com/felangel/bloc)

### get

A navigation library for Flutter.

- Version: `4.6.5`
- Repository: [https://github.com/jonataslaw/getx](https://github.com/jonataslaw/getx)

### http

A library for making HTTP requests.

- Version: `0.13.5`
- Repository: [https://github.com/dart-lang/http](https://github.com/dart-lang/http)

### intl

A library for internationalization and localization.

- Version: `0.17.0`
- Repository: [https://github.com/dart-lang/intl](https://github.com/dart-lang/intl)

### weather_app

A custom package for weather-related functionality.

- Version: `1.0.0`
- Repository: [https://github.com/NasimuddinSk/weather-app](https://github.com/NasimuddinSk/weather-app)

### geolocator

A library for geolocation services.

- Version: `9.0.2`
- Repository: [https://github.com/Baseflow/flutter-geolocator](https://github.com/Baseflow/flutter-geolocator)

### permission_handler

A library for handling permissions.

- Version: `10.2.0`
- Repository: [https://github.com/Baseflow/flutter-permission-handler](https://github.com/Baseflow/flutter-permission-handler)

### fpdart

A library for functional programming in Dart.

- Version: `0.11.0`
- Repository: [https://github.com/dart-lang/fpdart](https://github.com/dart-lang/fpdart)
