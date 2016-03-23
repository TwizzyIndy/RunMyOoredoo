#import "RunMyOoredoo.h"

#define kPrefPath @"/private/var/mobile/Library/Preferences/com.twizzyindy.runmyoore.pref.plist"

@implementation RunMyOoredoo

+(instancetype) sharedInstance {

	static RunMyOoredoo* __sharedInstance;
	static dispatch_once_t onceToken;

	dispatch_once(&onceToken, ^{

		__sharedInstance = [[self alloc] init];

	});

	return __sharedInstance;
}

@end

static BOOL bIsTweakOn; // tweak switch status check

// init pref setting

static void initPref() {

	NSMutableDictionary* dict = [[NSMutableDictionary alloc] initWithContentsOfFile:kPrefPath];
	bIsTweakOn = [[dict objectForKey:@"isTweakOn"] boolValue];
	

}

%hook AppDelegate

- (_Bool) isJailbroken {

	if( bIsTweakOn )
	{
		return NO;

	} else {

		return %orig;

	}
}

- (_Bool)application:(id)arg1 didFinishLaunchingWithOptions:(id)arg2 {

	if( [[NSUserDefaults standardUserDefaults] valueForKey:@"isFirstLaunch"] == nil && bIsTweakOn )
	{ 
		[[[UIAlertView alloc] initWithTitle:@"RunMyOoredoo" message:@"Be Happy :D"
		 		delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil] show];

		[[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"isFirstLaunch"];
		[[NSUserDefaults standardUserDefaults] synchronize];


	}

	return %orig;


}

%end

%ctor {


	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(),
									NULL, (CFNotificationCallback) initPref, CFSTR("com.twizzyindy.runmyoore.pref.changed"),
									NULL, CFNotificationSuspensionBehaviorCoalesce );

	initPref();

	if ( bIsTweakOn )
	{
		%init();
	}

}