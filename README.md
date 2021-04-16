# investing_alerts

Search stocks data.

## What is this project for?
The reason to build this project is to showcase the integration of different things:

- BLoC pattern for State Management

![alt text](https://user-images.githubusercontent.com/5593590/82729031-85dc9300-9cf4-11ea-951b-81b88222799f.png)

- Clean architecture

![alt text](https://user-images.githubusercontent.com/35143405/115072332-becabb00-9ef7-11eb-8b78-0f781fa899f2.png)

This project also use the following libraries:
- [GetIt](https://pub.dev/packages/get_it) -> dependency injection
- [Dart](https://pub.dev/packages/dartz) -> functional programming
- [Data Connection Checker](https://pub.dev/packages/data_connection_checker) -> check data connection
- [Equatable](https://pub.dev/packages/equatable) -> value based equality
- [SharedPreferences](https://pub.dev/packages/shared_preferences) -> reading/writing key-value pairs

The only functionality of the app is to search a company symbol (e.g. IBM) and show its PERatio value downloaded from an API (https://www.alphavantage.co/).

In order to test it you should add a file to the project containing a line with your API Key (you can get one [here](https://www.alphavantage.co/)):

final apiKey = "YOUR-API";
