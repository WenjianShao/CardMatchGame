//
//  CardMatchGame.h
//  Machismo
//
//  Created by 邵文坚 on 15/3/3.
//  Copyright (c) 2015年 邵文坚. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
@interface CardMatchGame : NSObject

@property (nonatomic, readonly) NSUInteger score;

- (instancetype) initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck;
- (void) chooseCardAtIndex:(NSUInteger)index;
- (Card *)cardAtIndex:(NSUInteger)index;


@end
