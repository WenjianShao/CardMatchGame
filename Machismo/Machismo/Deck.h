//
//  Deck.h
//  Machismo
//
//  Created by 邵文坚 on 15/3/2.
//  Copyright (c) 2015年 邵文坚. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)atTop;
- (void)addCard:(Card *)card;

- (Card *)drawRandomCard;

@end
