//
//  Card.h
//  Machismo
//
//  Created by 邵文坚 on 15/3/2.
//  Copyright (c) 2015年 邵文坚. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject
@property (strong, nonatomic) NSString *contents;
@property (nonatomic, getter=isChosen) BOOL choosen;
@property (nonatomic, getter=isMatched) BOOL matched;

//- (int)match:(Card *)card;
- (int)match:(NSArray *)otherCards;
@end
