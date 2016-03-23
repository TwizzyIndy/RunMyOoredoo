#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, NSURLConnectionDelegate, UIAlertViewDelegate>

- (_Bool)isJailbroken;
- (_Bool)application:(id)arg1 didFinishLaunchingWithOptions:(id)arg2;

@end

@interface RunMyOoredoo : NSObject

+(instancetype) sharedInstance;

@end