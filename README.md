# square-mobile-interview-project
This is the project for Square mobile interview

## Build tools & versions used

Xcode version 13.3.1

## Steps to run the app

1. Download the zip folder or clone the main branch from Git.
2. All libraries from Cocoapods have already imported to the project. (Optional) You may run `pod update` to ensure all dependencies are up-to-date.
3. Open *squareinterview.xcworkspace*
3. For build and run, click `CMD + R`
4. For testing, click `CMD + U`

## What areas of the app did you focus on?

I broke the project into three sections: Basic functions, image caching and caching test. The first area I focused is architecture. I chose the VIP or VIPER approach, powered by Clean Swift. I focus on image caching and testing the most.

## What was the reason for your focus? What problems were you trying to solve?

1. I would like to propose my current architecture, VIPER, powered by Clean Swift. It is a test-driven architecture that you can write unit tests effectively. The only drawback is its time complexity. Since I have 4-5 hours for the project, I have it is worth to write a better architecture.
2. Image caching is the most difficult feature in this project. I found a no-3rd-party solution from Stackoverflow, but it's not I expect. So at the end I move back to a library I familiar with, Kingfisher, a service for downloading and caching images. 
3. I spent most of the time on prooving the library did cache the image properly. I used the memory monitor on Debug Navigator and Network from Instrument. With some clear cache actions and comparison, the project finally passed the cache test.


## How long did you spend on this project?
- 3hrs: 6 Sep 10:30PM - 7 Sept 1:30AM : UI building, API integration, Unit test over API.
- 30mins: 7 Sept 4:30PM - 7 Sept 5:00PM : Image cache issues.
- 1hrs: 7 Sept 11:30PM - 8 Sept 12:30AM : Memory test for image on real device, Unit test for UI, Readme preparation.

## Did you make any trade-offs for this project? What would you have done differently with more time?

The time is totally enough for building this app, even I'm using a complicated architecture(Clean Swift). If there are more details about deploying, I want to apply CI/CD into the project too. I like to use Xcode Cloud for App Store and Testflight, and Fastlane for Enterprise.

## What do you think is the weakest part of your project?

Caching issue is something that I'm not familiar with. In my past experience, I did get a chance to handle image caching with 3rd party library (Kingfisher). They claim the library already handle cache issue, but I don't really test out the truth. So after this project, I think I got more understandings on the image cachiing monitor.

## Did you copy any code or dependencies? Please make sure to attribute them here!

### Cocoapods dependencies: 
- PromiseKit
- Kingfisher

### Code from my personal projects:
- /APIs/HTTP
- /Utils

### VIP Architecture Template:
- Clean Swift

## Is there any other information you’d like us to know?

References:
- Download and caching images by Kingfisher:
https://github.com/onevcat/Kingfisher

- Load image URL on TableView:
https://www.donnywals.com/efficiently-loading-images-in-table-views-and-collection-views/