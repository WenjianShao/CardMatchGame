//
//  Card.m
//  Machismo
//
//  Created by 邵文坚 on 15/3/2.
//  Copyright (c) 2015年 邵文坚. All rights reserved.
//

#import "Card.h"
@interface Card()
@end

@implementation Card
@synthesize contents = _contents;

- (NSString *)contents {
    return _contents;
}

- (void)setContents:(NSString *)contents {
    _contents = contents;
}

//- (int)match:(Card *)card {
//    int score = 0;
//    if ([card.contents isEqualToString:self.contents]) {
//        score = 1;
//    }
//    return score;
//}

- (int)match:(NSArray *)otherCards {
    int score = 0;
    for (Card * card in otherCards) {
        if ([card.contents isEqualToString:self.contents]) {
            score = 1;
        }
    }
    return score;
}

@end
