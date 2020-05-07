# Repository-Query-Challenge
This project contemplates the creation of an application to consult the GitHub API.

## Functional Project

- Insert words and have them counted as a hit as soon as the player types the last letter of each word.
- There will be a 5 min timer to finish the game.
- There will be a button to start the timer.

## Requirements
- Swift 5
- Target: iOS 12.0
- Xcode 11.2.1

### Run project
To execute the project you have to:

1. Clone [the repo](https://github.com/paraisolorrayne/Repository-Query-Challenge) or download the ZIP file on a Mac
1. If you choose to download the ZIP file, unzip it
1. Run the command `pod install`
1. Open the file `Repository-Query.xcworkspace` with Xcode 11
1. Pick a simulator (choose an iPhone with iOS 12 or later)
1. Run the project (CMD+R)

### Run tests
To run some unit tests you have to:

1. Open the file `Repository-Query.xcworkspace` with Xcode 11
1. Run tests (CMD+U)

---

## Project Patterns

### Architecture 
- MVVM with closures

```
<MODULE_NAME>
├── Coordinators
│   └── <MODULE_NAME>Coordinator.swift
├── ViewControllers
│   └── <MODULE_NAME>ViewController.swift
└── ViewModels
    └── <MODULE_NAME>ViewModel.swift
```

### UI development
- XIB

### Good Practices
- SwiftLint

### Network Layer Pattern
- APIManager with [Alamofire](https://github.com/Alamofire/Alamofire)
- Service and Protocol