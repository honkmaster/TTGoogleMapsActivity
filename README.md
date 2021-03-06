# TTGoogleMapsActivity

`TTGoogleMapsActivity` is a `UIActivity` subclass that provides the possibility to open an address in Apple Maps. `TTGoogleMapsActivity` uses the URL-Scheme defined by [Google](https://developers.google.com/maps/documentation/ios/urlscheme).

## Used In

- Please tell me if you use `TTGoogleMapsActivity` in your App (just submit it as an [issue](https://github.com/honkmaster/TTGoogleMapsActivity/issues))! 

## Requirements

- As `UIActivity` is iOS 6 only, so is the subclass.
- This project uses ARC. If you want to use it in a non ARC project, you must add the `-fobjc-arc` compiler flag to TTGoogleMapsActivity.m in Target Settings > Build Phases > Compile Sources.

## Installation

Add the `TTGoogleMapsActivity` subfolder to your project. There are no required libraries other than `UIKit`.

## Usage.

```objectivec
TTGoogleMapsActivity *googleMapsActivity = [[TTGoogleMapsActivity alloc] init];
googleMapsActivity.latitude = @(self.userlocation.coordinate.latitude);
googleMapsActivity.longitude = @(self.userlocation.coordinate.longitude);
            
NSArray *applicationActivities = @[googleMapsActivity];
UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:nil applicationActivities:applicationActivities];
        
[self presentViewController:activityViewController animated:YES completion:NULL];
```

## License

Copyright (c) 2013 Tobias Tiemerding

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

