#import <Foundation/Foundation.h>

@interface NSTask: NSObject
@property NSString *launchPath;
@property NSArray *arguments;
- (void)launch;
@end
