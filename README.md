# WWDC
**A command-line interface for accessing WWDC session content**

[ASCIIwwdc](http://asciiwwdc.com) provides searchable full-text transcripts of WWDC content. `wwdc` builds on its API, [which is documented in the project's README](https://github.com/mattt/asciiwwdc.com#README).

## Installation

```bash
$ gem install wwdc
```

## Usage

### Info

Displays title and description for the specified session.

```bash
$ wwdc info 228

    WWDC 2014
    Session 228: "A Look Inside Presentation Controllers"

    iOS 8 brings you powerful new means of presenting content within your apps. Hear
    how presentation controllers were leveraged by UIKit to give you fine grain
    control using new alert and searching APIs. Dive deep into how presentation
    controllers work and how you can use them to present content within your app in
    exciting new ways.

$ wwdc info 228 --year 2013

    WWDC 2013
    Session 228: "Hidden Gems in Cocoa and Cocoa Touch"

    Learn from the experts about the Cocoa and Cocoa Touch classes you may not even
    know exist, as well as some very obscure but extremely valuable classes that are
    favorites of the presenters.
```

### Open

Opens browser to Apple Developer page with links to slides and video for specified session.

```bash
$ wwdc open 101 --year 2014
```

### Search

Finds most relevant sessions based on the specified search query

```bash
$ wwdc search Swift

    WWDC 2014
    Session 407: "Swift Interoperability In Depth"

    Swift and Objective-C work together at multiple levels to ensure that you can
    create great apps for iOS and OS X. Dive deep with us to see how to use
    fundamental Core Foundation and C types in your Swift code. Learn how bridging
    values work and gain a practical understanding of how Swift and Objective-C can
    accelerate your app development.

    ...
```

## Contact

Mattt Thompson

- http://github.com/mattt
- http://twitter.com/mattt
- m@mattt.me

## License

WWDC is available under the MIT license. See the LICENSE file for more info.

All content copyright © 2013 Apple Inc. All rights reserved.
