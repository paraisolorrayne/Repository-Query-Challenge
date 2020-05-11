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
├── Coordinator
│   └── <MODULE_NAME>Coordinator.swift
├── ViewControllers
│   └── <MODULE_NAME>ViewController.swift
└── ViewModels
│   └── <MODULE_NAME>ViewModel.swift
└── Model
    └── <MODULE_NAME>Model.swift

```

### UI development
- XIB

### API Documentation

[GitHub REST API v3](https://developer.github.com/v3) 
Usage in this project
##### BaseURL:
- [URL](https://api.github.com)

- Find repo from language by most popular
 `{baseURL}/search/repositories?q=repositories&language:{languageName}&sort=stars&order=desc&page={}&per_page={page_size}`

- Find readme
 `{baseURL}/repos/{login}}/{name}/contents/README.md?ref=master`

### Network Layer Pattern
- APIManager with [Alamofire](https://github.com/Alamofire/Alamofire)
- Service and Protocol
