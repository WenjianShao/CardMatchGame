//
//  CardMatchGame.m
//  Machismo
//
//  Created by 邵文坚 on 15/3/3.
//  Copyright (c) 2015年 邵文坚. All rights reserved.
//

#import "CardMatchGame.h"
#import "Deck.h"

@interface CardMatchGame()
@property(nonatomic, readwrite) NSUInteger score;
@property(nonatomic, strong) NSMutableArray *cards;
@end
@implementation CardMatchGame

- (NSMutableArray *)cards {
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}
- (instancetype) initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck {
    self = [super init];
    if (self) {
        for (int i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
                //self.cards[i] = card;
            } else {
                self = nil;
                break;
            }
        }
    }
    return self;
}
static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;

- (void) chooseCardAtIndex:(NSUInteger)index {
    Card *card = [self cardAtIndex:index];
    if (!card.isMatched) {
        if (card.isChosen) {
            card.choosen = NO;
        } else {
            for (Card *otherCard in self.cards) {
                if (otherCard.isChosen && !otherCard.isMatched) {
                    int matchScore = [card match:@[otherCard]];
                    if (matchScore) {
                        self.score += matchScore+MATCH_BONUS;
                        card.matched = YES;
                        otherCard.matched = YES;
                    } else {
                        self.score -= MISMATCH_PENALTY;
                        otherCard.choosen = NO;
                    }
                    break;
                }
            }
            self.score -= COST_TO_CHOOSE;
            card.choosen = YES;
        }
        
    }
}
- (Card *)cardAtIndex:(NSUInteger)index {
    return (index < self.cards.count) ? self.cards[index] : nil;
}


@end
