//
//  DVNotification.m
//  Pods
//
//  Created by Dave van Dugteren on 13/03/2015.
//
//

#import "DVNotification.h"

@interface DVNotification(){
	BOOL _isDisplayingNotification;
	NSUInteger _displayTime;
	CGRect _hiddenFrame;
	CGRect _visibleFrame;
}

@property (strong, nonatomic) NSMutableArray *notificationsQueue;
@property (weak, nonatomic) IBOutlet UIView *viewBackground;

@end

@implementation DVNotification

static DVNotification *_instance = nil;

+(DVNotification *)notification {
	if(!_instance){
		@synchronized([DVNotification class]){
			_instance = [[[NSBundle mainBundle] loadNibNamed: @"DVNotification" owner: self options: nil] objectAtIndex:0];
		}
	}
	
	return _instance;
};

- (id) initWithCoder:(NSCoder *)aDecoder{
	self = [super initWithCoder:aDecoder];
	
	if (self){
		_displayTime = DEFAULT_DISPLAY_TIME;
		CGRect windowFrame = [[[UIApplication sharedApplication] delegate] window].frame;
		
		_hiddenFrame = CGRectMake(0, windowFrame.size.height, windowFrame.size.width, windowFrame.size.height);
		_visibleFrame = CGRectMake(0, 0, windowFrame.size.width, windowFrame.size.height);
		self.frame = _hiddenFrame;
	}
	
	return self;
}


+(void)showNotificationWithText : (NSString *) text{
	[[DVNotification notification].notificationsQueue addObject: text];
	[[DVNotification notification] showNotificationAnimated: YES];
}

-(NSMutableArray *)notificationsQueue{
	if (!_notificationsQueue){
		_notificationsQueue = [[NSMutableArray alloc] init];
	}
	
	return _notificationsQueue;
}

- (void) showNotificationAnimated : (BOOL) animated{
	if (!_isDisplayingNotification){
		_isDisplayingNotification = YES;
		[[[[UIApplication sharedApplication] delegate] window] addSubview: self];
		[[UIApplication sharedApplication].keyWindow bringSubviewToFront:self]; //Not sure if this is ever actually needed, SO says it is.
		if (self.notificationsQueue.count > 0){
			self.lblNotificationText.text = [self.notificationsQueue objectAtIndex:0];
		}
		
		if (animated){
			[UIView animateWithDuration: kAnimationDefault
							 animations:^{
								 self.frame = _visibleFrame;
							 } completion:^(BOOL finished) {
								 if (finished){
									 if (self.notificationsQueue.count > 0){
										 [self.notificationsQueue removeObjectAtIndex:0];
									 }
								 }
							 }];
		}
	}
}

- (void) dismissNotificationAnimated : (BOOL) animated{
	if (animated){
		[UIView animateWithDuration: kAnimationDefault
						 animations:^{
							 self.frame = _hiddenFrame;
						 } completion:^(BOOL finished) {
							 _isDisplayingNotification = NO;
							 if (self.notificationsQueue.count > 0){
								 [self showNotificationAnimated: YES];
							 }else{
								 [self removeFromSuperview];
							 }
						 }];
	}
}

- (void) dismissPopUp{
	[self dismissNotificationAnimated: YES];
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
	if (_isDisplayingNotification){
		[self dismissPopUp];
	}
	return [super pointInside:point withEvent:event];
}

+ (void) setNotificationBackgroundColour : (UIColor *) backgroundColor{
	[DVNotification notification].viewBackground.backgroundColor = backgroundColor;
}

@end
