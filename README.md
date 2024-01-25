# Viper-Architecture-Example

This repository contains an iOS application developed using the Viper (View-Interactor-Presenter-Entity-Router) architecture. Additionally, it includes unit tests for the application and utilizes the Coordinator and Builder components.

## Project Structure

The project is organized as follows:

- **UnitTest_VIPER_Example**: Main project folder
  - **UnitTest_VIPER_Example**: Main application source code
  - **UnitTest_VIPER_ExampleTests**: Folder containing unit tests
  - ...

## Running Unit Tests

1. Open a terminal and navigate to the project folder.
2. Go to the UnitTest_VIPER_ExampleTests folder.
3. Run the command `xcodebuild test -scheme Viper_Architecture_ExampleTests -destination 'platform=iOS Simulator,name=iPhone 13'` to start the unit tests.

## Coordinator

The project utilizes the Coordinator design pattern to manage the application flow and enhance modularity. For more information about the Coordinator, you can check the [Wiki](wiki) page.

## Builder

The Builder pattern is used in the project to create objects step by step and manage the construction of complex objects. More details about the Builder pattern can be found [here](wiki).

## Versions

- **Xcode Version:** 14.3
- **iOS Version:** 15.0+
- **Swift Version:** 4.0+

---

This project serves as a starting point for developers interested in learning and implementing the Viper architecture. For more information about the project and how to get started, please refer to the [Wiki](wiki) page.
