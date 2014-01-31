//
//  BGDialogueCollectionViewCell.m
//  iOSPsuedoCellDialogue
//
//  Created by Bradley Griffith on 1/30/14.
//  Copyright (c) 2014 Bradley Griffith. All rights reserved.
//

#import "BGDialogueCollectionViewCell.h"
#import <QuartzCore/QuartzCore.h>

@interface BGDialogueCollectionViewCell ()
@end

@implementation BGDialogueCollectionViewCell

- (id)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
	if (self) {
		
		// Load nib and loop through objects so that we are certain we have a BGDialogueCollectionViewCell.
		NSArray* nibViews =  [[NSBundle mainBundle] loadNibNamed:@"BGDialogueCollectionViewCell" owner:self options:nil];
		for (id currentObject in nibViews) {
			if ([currentObject isKindOfClass:[BGDialogueCollectionViewCell class]]) {
				_view = (BGDialogueCollectionViewCell *) currentObject;
				break;
			}
		}
		[self addSubview:_view];
	}
	return self;
}

- (void)awakeFromNib {
	[super awakeFromNib];
	[self addSubview:_view];
}

+ (id)presentInWindow:(UIWindow *)window {
	// Create a prototype of our cell in order to get it's height... (TODO: Refactor).
	CGRect rect = CGRectMake(0, 0, window.frame.size.width, window.frame.size.height);
	BGDialogueCollectionViewCell *dv = [[BGDialogueCollectionViewCell alloc] initWithFrame:rect];
	
	// Adjust frame size and position just off screen.
	rect = CGRectMake(0, window.frame.size.height, window.frame.size.width, dv.view.frame.size.height);
	// TODO: Refactor. Why can't we just update the frame for the current dv here??
	dv = [[BGDialogueCollectionViewCell alloc] initWithFrame:rect];
	
	[window addSubview:dv];
	
	[UIView animateWithDuration:0.3 animations:^{
		CGRect finalRect = dv.frame;
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
