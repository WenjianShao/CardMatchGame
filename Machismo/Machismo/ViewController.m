//
//  ViewController.m
//  Machismo
//
//  Created by 邵文坚 on 15/3/2.
//  Copyright (c) 2015年 邵文坚. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"

@interface ViewController ()
//@property (weak, nonatomic) IBOutlet UIButton *cardBtn;
@property (weak, nonatomic) IBOutlet UILabel *filpCountLabel;
@property (nonatomic) NSInteger filpCount;
@property (nonatomic, strong) Deck *deck;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (Deck *)deck
{
    if (!_deck) {
        _deck = [self createDeck];
    }
    return _deck;
}

- (Deck *)createDeck
{
    return [[PlayingCardDeck alloc] init];
}

- (void)setFilpCount:(NSInteger)filpCount {
    _filpCount = filpCount;
    self.filpCountLabel.text = [NSString stringWithFormat:@"flip count:%ld", (long)self.filpCount];
}
- (IBAction)onTouchCardButton:(UIButton *)sender {
    if ([sender.currentTitle length]) {
        [sender setBackgroundImage:[UIImage imageNamed:@"cardback"] forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
        self.filpCount++;

    } else {
        Card *card = [self.deck  drawRandomCard];
        if (card) {
            [sender setBackgroundImage:[UIImage imageNamed:@"cardfront"] forState:UIControlStateNormal];
            [sender setTitle:card.contents forState:UIControlStateNormal];
            self.filpCount++;

        }
    }
    }

@end
