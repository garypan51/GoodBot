# GoodBot

A simple project that utilizes SwiftUI, Swift 5.0, and the Combine Framework to build an iOS Reddit browsing application. 

### Current State of Project

Just getting started. Very little has been set up and the only meaningful logic implemented so far is fetching posts for the `r/popular` and Oauth.
Development has been put on hold until design and comps have been created. Look at RoadMap section below for more information.

#### Crash Alert
Currently the app crashes when visiting the profile screen and returning back to to the home screen. As documented by other using SwiftUI, this is
an issue that is affecting iOS 13.2 and above as the crash does not affect 13.1 and below. Will either need to implement a workaround
or see if the issue is addressed by the time development for the screen is required. 

### Pre-requisites

* Xcode 11+
* iOS 13+ (SwiftUI requirement)

### Clone the repo:

`git clone https://github.com/garypan51/GoodBot.git`

### Xcode
    
* From the Xcode Launcher select `Open another project...` and navigate to the root directory of your project.
* Click 'Open' to open the the project in Xcode.

### Disclaimer
In order to utilize Reddit's OAuth to retrieve user's account information, a Reddit clientid is required, along with a couple of extra parameters.
A constants file will need to be created in order for OAuth to work and for the project to build. For security purposes, the SecretsConstant file is not committed to this repo.

Example of a SecretConstants.swift file required to build application.

`GoodBot -> Constants -> SecretConstants.swift`
```
import Foundation

struct SecretConstants {
    static let redditClientId = "CLIENT ID provided by Reddit"
    static let state = "Variable name of your choosing"
}
```

## Running the App
* Select `Product-> Run` from the menu bar

## Estimated RoadMap

The following are a list of items that should be worked on sorted by the order of priority and/or importance.
1. Test Driven Development (Q3 2020)
    * Start with writing test cases for current logic.
    * Write tests before writing code to ensure that future code is testable and works as intended.
2. UI Design (Q4 2020 - Q1 2021)
    * Design and create comps for Home, Post, Subreddit, and User account screens with Adobe XD.
3. Add More Features (Q2 - Q4 2021)
    * Implement home to fetch posts for user's frontpage, or from `r/popular` if user is not signed in.
    * Implement post screen that will display the post that a user has selected along with comments.
    * Implement subreddit screen that will display the subreddits that the user is subscribed to.
    * Implement account screen that displays basic user info or sign in screen if user is not signed in.

## License

This project is licensed under the MIT License, so feel free to use it as you wish.
