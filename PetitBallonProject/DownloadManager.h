#import <Foundation/Foundation.h>
#import "DownloadDelegate.h"

@interface DownloadManager : NSObject
{
    NSOperationQueue *_operationQueue;
}
+ (DownloadManager*)shared;

- (void) loadRequest:(NSMutableURLRequest*)request withDelegate:(id<DownloadDelegate>)delegate;
- (void) loadLocalFileName:(NSString*)filename withDelegate:(id<DownloadDelegate>)delegate;

@end
