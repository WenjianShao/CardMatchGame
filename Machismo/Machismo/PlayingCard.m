//
//  PlayingCard.m
//  Machismo
//
//  Created by 邵文坚 on 15/3/3.
//  Copyright (c) 2015年 邵文坚. All rights reserved.
//

#import "PlayingCard.h"
@implementation PlayingCard
@synthesize suit = _suit; //beacause we provide setter and getter

- (int)match:(NSArray *)otherCards
{
    int score = 0;
    if (otherCards.count == 1) {
        PlayingCard *otherCard = [otherCards firstObject];
        
        if ([self.suit isEqualToString:otherCard.suit]) {
            score = 1;
        } else if (self.rank == otherCard.rank) {
            score = 4;
        }
    }
    return score;
}

- (NSString *)contents {
    NSArray *rankString = [PlayingCard rankStrings];
    return [rankString[self.rank] stringByAppendingString:self.suit];
}

+ (NSArray *)validSuits {
    return @[@"♠️", @"♥️", @"♣️", @"♦️"];
}
+ (NSArray *)rankStrings {
    return @[@"?", @"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
}
+ (NSInteger)maxRank {
    return [[self rankStrings] count] - 1;//
}
- (void) setSuit:(NSString *)suit
{
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}
- (NSString *)suit {
    return _suit ? _suit : @"?";
}

- (void) setRank:(NSInteger)rank
{
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}


@end
