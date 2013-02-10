//
//  TTGoogleMapsActivity.h
//
//  Created by Tobias Tiemerding on 12/25/12.
//  Copyright (c) 2012-2013 Tobias Tiemerding
// 
//  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//  The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#import "TTGoogleMapsActivity.h"

@implementation TTGoogleMapsActivity

- (NSString *)activityType
{
	return NSStringFromClass([self class]);
}

- (NSString *)activityTitle
{
	return NSLocalizedString(@"Show in Google Maps", @"Show in Google Maps");
}

- (UIImage *)activityImage
{
	return [UIImage imageNamed:@"TTGoogleMapsActivity"];
}

- (BOOL)canPerformWithActivityItems:(NSArray *)activityItems
{
	if(self.latitude && self.longitude && [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"comgooglemaps://?"]])
        return YES;
	
	return NO;
}

- (void)performActivity
{
   // Construct url string
    NSMutableString *googleMapsURLString = [NSMutableString stringWithString:@"comgooglemaps://?"];
	NSMutableArray *components = [NSMutableArray array];
    
	if (self.latitude && self.longitude)
		[components addObject:[NSString stringWithFormat:@"%@=%@,%@", @"center", [self.latitude stringValue], [self.longitude stringValue]]];
    
	if (self.zoomLevel > 0)
		[components addObject:[NSString stringWithFormat:@"%@=%@", @"zoom", [NSString stringWithFormat:@"%i", self.zoomLevel]]];
	
	if (self.mapMode)
		[components addObject:[NSString stringWithFormat:@"%@=%@", @"mapmode", self.mapMode]];
	
	NSString *componentsString = [components componentsJoinedByString:@"&"];
    if (componentsString.length > 0)
        [googleMapsURLString appendFormat:@"%@", componentsString];
	
	NSURL *googleMapsURL = [NSURL URLWithString:[googleMapsURLString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    if ([[UIApplication sharedApplication] canOpenURL:googleMapsURL]) {
        [[UIApplication sharedApplication] openURL:googleMapsURL];
        [self activityDidFinish:YES];
    }
    
    [self activityDidFinish:NO];
}

@end

