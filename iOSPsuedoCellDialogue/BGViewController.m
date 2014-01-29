//
//  BGViewController.m
//  iOSPsuedoCellDialogue
//
//  Created by Bradley Griffith on 1/28/14.
//  Copyright (c) 2014 Bradley Griffith. All rights reserved.
//

#import "BGViewController.h"
#import "BGDialogueView.h"

@implementation BGViewController

- (IBAction)sayHello:(id)sender {
	_sayHelloButton.enabled = NO;
	BGDialogueView *dialogueView = [BGDialogueView presentInWindow:self.view.window];
	
	[self performSelector:@selector(dismissDialogue:) withObject:dialogueView afterDelay:2];
}

- (void)dismissDialogue:(BGDialogueView *)dialogue {
	_sayHelloButton.enabled = YES;
	[dialogue dismiss];
}

@end
