//
//  BGDialogueView.m
//  iOSPsuedoCellDialogue
//
//  Created by Bradley Griffith on 1/28/14.
//  Copyright (c) 2014 Bradley Griffith. All rights reserved.
//

#import "BGDialogueView.h"
#import <QuartzCore/QuartzCore.h>

@interface BGDialogueView ()
@end

@implementation BGDialogueView

- (id)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
	if (self) {
		self.backgroundColor = [UIColor colorWithWhite:1.0f alpha:1.0f];
		self.layer.shadowColor  = [[UIColor blackColor] CGColor];
		self.layer.shadowOffset = CGSizeMake(0, -1);
		UILabel *responseLabel = [[UILabel alloc] initWithFrame:CGRectInset(self.bounds, 30.0f, 10.0f)];
		responseLabel.text = @"I have a boyfriend.";
		
		[self addSubview:responseLabel];
	}
	return self;
}

+ (id)presentInWindow:(UIWindow *)window {
	CGRect rect = CGRectMake(0, 0, window.frame.size.width, 40.0f);
	
	// position just off screen
	rect.origin.y = window.frame.size.height;
	BGDialogueView *dv = [[BGDialogueView alloc] initWithFrame:rect];
	[window addSubview:dv];
	
	[UIView animateWithDuration:0.3 animations:^{
		CGRect finalRect = rect;
		finalRect.origin.y -= dv.frame.size.height;
		dv.frame = finalRect;
	}];
	
	return dv;
}

- (void)dismiss {
	[UIView animateWithDuration:0.3 animations:^{
		CGRect rect = self.frame;
		
		// position just off screen & account for shadow
		rect.origin.y += self.frame.size.height + 10;
		
		self.frame = rect;
	} completion:^(BOOL finished) {
		[self removeFromSuperview];
	}];
}

@end
