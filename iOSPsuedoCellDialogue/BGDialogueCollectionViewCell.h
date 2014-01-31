//
//  BGDialogueCollectionViewCell.h
//  iOSPsuedoCellDialogue
//
//  Created by Bradley Griffith on 1/30/14.
//  Copyright (c) 2014 Bradley Griffith. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BGDialogueCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *dialogueLabel;

@property (nonatomic, retain) IBOutlet BGDialogueCollectionViewCell *view;

+ (id)presentInWindow:(UIWindow *)window;

- (void)dismiss;

@end
