# ImageGallery-SwiftUI
Image gallery app using SwiftUI

##About

Infinite scrolling image gallery pulled from the pic sum API https://picsum.photos.

This app allows the user to select an image to view the image details and to ‘favourite’ the images and display them in another tab.


##Requirements

Ios 16 or later


##Design pattern used

The MVVM design architecture is used for this app.


##Third party libraries used

SDWebImageSwiftUI

It is a popular third-party library for asynchronous image downloading and cashing images in iOS and macOS applications. SDWebImageSwiftUI has added to this app by using swift package manager. It is easy to use and also, a proven library with great support and updates.


##Improvements needed

Should add a network reachability check

It will be better to optimize the code by creating a generic item for WebImage.

Add ‘Favourite’ indication (Mostly a heart symbol) on each grid item if they were added to favourites.

UI improvements needed on image grid item

