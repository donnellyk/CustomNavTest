//
//  CustonNavBar.m
//  CustomNavText
//
//  Created by Kevin Donnelly on 7/8/11.
//  Copyright 2011 -. All rights reserved.
//

#import "CustonNavBar.h"

#define MAX_BACK_BUTTON_WIDTH 160.0

@implementation CustonNavBar
@synthesize barBackgroundImage, navController;

-(void)drawRect:(CGRect)rect {
    if (barBackgroundImage != nil) {
        [barBackgroundImage.image drawInRect:rect];
    } else {
        [super drawRect:rect];
    }
}

-(void) setBackgroundWith:(UIImage*)backgroundImage {
    self.barBackgroundImage = [[UIImageView alloc] initWithFrame:self.frame];
    barBackgroundImage.image = backgroundImage;
    [self setNeedsDisplay]; //Redraws rect!
}

-(void) clearBackground {
    self.barBackgroundImage = nil;
    [self setNeedsDisplay];
}

-(IBAction)back:(id)sender {
    [self.navController popViewControllerAnimated:YES];
}

//Custom button goodness
-(UIButton*)backButtonWith:(UIImage *)backButtonImage highlight:(UIImage *)backButtonHighlightImage leftCapWidth:(CGFloat)capWidth {
    buttonCapWidth = capWidth;
    
    UIImage* buttonImage = [backButtonImage stretchableImageWithLeftCapWidth:buttonCapWidth topCapHeight:0.0];
    UIImage* buttonImagePressed = [backButtonImage stretchableImageWithLeftCapWidth:buttonCapWidth topCapHeight:0.0];
    
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    button.titleLabel.font = [UIFont boldSystemFontOfSize:[UIFont smallSystemFontSize]];
    button.titleLabel.textColor = [UIColor whiteColor];
    button.titleLabel.shadowOffset = CGSizeMake(0, -1);
    button.titleLabel.shadowColor = [UIColor darkGrayColor];
    
    button.titleLabel.lineBreakMode = UILineBreakModeTailTruncation;
    button.titleEdgeInsets = UIEdgeInsetsMake(0, 6.0, 0, 3.0);
    button.frame = CGRectMake(0, 0, 0, buttonImage.size.height);
    
    [self setText:@"Something" onBackButton:button];
    
    [button setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [button setBackgroundImage:buttonImagePressed forState:UIControlStateHighlighted];
    [button setBackgroundImage:buttonImagePressed forState:UIControlStateSelected];
    
    [button addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];

    return button;
}

-(void) setText:(NSString*)text onBackButton:(UIButton*)backButton
{
    // Measure the width of the text
    CGSize textSize = [text sizeWithFont:backButton.titleLabel.font];
    // Change the button's frame. The width is either the width of the new text or the max width
    backButton.frame = CGRectMake(backButton.frame.origin.x, backButton.frame.origin.y, (textSize.width + (buttonCapWidth * 1.5)) > MAX_BACK_BUTTON_WIDTH ? MAX_BACK_BUTTON_WIDTH : (textSize.width + (buttonCapWidth * 1.5)), backButton.frame.size.height);
    
    // Set the text on the button
    [backButton setTitle:text forState:UIControlStateNormal];
}

@end
