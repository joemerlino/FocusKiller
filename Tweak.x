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

-(void)inject{
		NSArray *windows = [[UIApplication sharedApplication] windows];
		for (UIWindow *string in windows)
			if([string isKindOfClass:NSClassFromString(@"UIRemoteKeyboardWindow")])
		    	[[[UIApplication sharedApplication] keyWindow] endEditing:YES];
}

@end

%ctor {
	%init;
	[[NSNotificationCenter defaultCenter] addObserver:[PonyDebuggerInjected sharedInstance] selector:@selector(inject) name:UIApplicationWillResignActiveNotification object:nil];
}