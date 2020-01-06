@interface PonyDebuggerInjected : NSObject {
@private
}
@end

@implementation PonyDebuggerInjected

+ (instancetype)sharedInstance
{
    static PonyDebuggerInjected *_sharedFactory;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _sharedFactory = [[self alloc] init];
    });

    return _sharedFactory;
}

- (id)init
{
        if ((self = [super init]))
        {
                     
        }
        return self;
}

-(void)inject {
	[[[UIApplication sharedApplication] keyWindow] endEditing:YES];
}
@end

%ctor {
	[[NSNotificationCenter defaultCenter] addObserver:[PonyDebuggerInjected sharedInstance] selector:@selector(inject) name:UIApplicationWillResignActiveNotification object:nil];
}