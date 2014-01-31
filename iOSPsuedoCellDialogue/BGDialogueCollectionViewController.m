//
//  BGDialogueCollectionViewController.m
//  iOSPsuedoCellDialogue
//
//  Created by Bradley Griffith on 1/31/14.
//  Copyright (c) 2014 Bradley Griffith. All rights reserved.
//

#import "BGDialogueCollectionViewController.h"
#import "BGDialogueCollectionViewCell.h"

@interface BGDialogueCollectionViewController () <UICollectionViewDataSource>
@property (nonatomic, strong) NSArray *dialogues;
@end

@implementation BGDialogueCollectionViewController


- (void)viewDidLoad
{
	[super viewDidLoad];
	
	// This is only a sample and we dont use the datasource for anything so the values here dont matter.
	_dialogues = [NSArray arrayWithObjects:@"1", @"2", @"3", nil];
}

#pragma mark UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
	return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
	return [_dialogues count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
	
	static NSString *CellIdentifier = @"DialogueCollectionViewCell";
	[collectionView registerNib:[UINib nibWithNibName:@"BGDialogueCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:CellIdentifier];

	BGDialogueCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
	
	return cell;
}

@end
