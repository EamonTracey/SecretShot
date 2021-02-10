#import "../include/SecretShot.h"

%hook NSNotificationCenter

- (void)addObserver:(id)observer selector:(SEL)aSelector name:(NSNotificationName)aName object:(id)anObject {

    if (aName != UIApplicationUserDidTakeScreenshotNotification) {
        %orig;
    }

}

%end

%hook UIScreen

- (BOOL)isCaptured {

    return NO;

}

%end

static void loadPreferences() {

	NSMutableDictionary *preferences = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.eamontracey.secretshotpreferences.plist"];

	enabled = [preferences objectForKey:@"enabled"] ? [[preferences objectForKey:@"enabled"] boolValue] : YES;

}

%ctor {

    loadPreferences();
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)loadPreferences, CFSTR("com.eamontracey.secretshotpreferences/saved"), NULL, CFNotificationSuspensionBehaviorCoalesce);

    if (enabled) {
        %init;
    }

}