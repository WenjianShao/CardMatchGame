//
//  PlayingCard.h
//  Machismo
//
//  Created by 邵文坚 on 15/3/3.
//  Copyright (c) 2015年 邵文坚. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSInteger rank;

+ (NSArray *)validSuits;
+ (NSInteger)maxRank;

@end
