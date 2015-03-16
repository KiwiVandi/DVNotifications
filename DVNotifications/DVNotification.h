//
//  DVNotification.h
//  Pods
//
//  Created by Dave van Dugteren on 13/03/2015.
//
//

#import <UIKit/UIKit.h>

//Defaults
#define DEFAULT_DISPLAY_TIME		(-1) //-1 means that its visible forever.
#define kAnimationDefault			(0.33)

@interface DVNotification : UIView

@property IBOutlet UILabel *lblNotificationText;

+ (DVNotification *)notification;
+ (void) showNotificationWithText : (NSString *) text;
+ (void) setNotificationBackgroundColour : (UIColor *) backgroundColor;

@end
