static BOOL show = NO;

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
	if(show)
		[[[UIApplication sharedApplication] keyWindow] endEditing:NO];
}

-(void)show:(NSNotification *)notification{
	CGSize keyboardSize = [[[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
	int height = MIN(keyboardSize.height,keyboardSize.width);
	if(height > 50)
		show = YES;
	else
		show = NO;
}

@end

%ctor {
	%init;
	[[NSNotificationCenter defaultCenter] addObserver:[PonyDebuggerInjected sharedInstance] selector:@selector(inject) name:UIApplicationWillResignActiveNotification object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:[PonyDebuggerInjected sharedInstance] selector:@selector(show:) name:UIKeyboardDidShowNotification object:nil];
}