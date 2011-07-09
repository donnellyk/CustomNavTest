//
//  CustonNavBar.h
//  CustomNavText
//
//  Created by Kevin Donnelly on 7/8/11.
//

#import <Foundation/Foundation.h>


@interface CustomNavBar : UINavigationBar {
    UIImageView *barBackgroundImage;
    CGFloat buttonCapWidth;
    IBOutlet UINavigationController* navigationController;
}

@property (nonatomic, retain) UIImageView *barBackgroundImage;
@property (nonatomic, retain) IBOutlet UINavigationController* navigationController;

-(void) setBackgroundWith:(UIImage*)backgroundImage;
-(void) clearBackground;
-(UIButton*) backButtonWith:(UIImage*)backButtonImage highlight:(UIImage*)backButtonHighlightImage leftCapWidth:(CGFloat)capWidth;
-(void) setText:(NSString*)text onBackButton:(UIButton*)backButton;

@end
