//
//  HighlightDetail.m
//  OpenHouseOneFive
//
//  Created by Thanat Jatuphattharachat on 10/30/2558 BE.
//  Copyright © 2558 Thinc. All rights reserved.
//

#import "HighlightDetail.h"

@interface HighlightDetail () {
    float screenWidth;
    float screenHeight;
}
@property (strong, nonatomic) IBOutlet UIImageView *topicImage;
@property (strong, nonatomic) IBOutlet UILabel *topicLabel;
@property (strong, nonatomic) IBOutlet UIView *blurView;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation HighlightDetail
@synthesize inimage;

- (void)viewDidLoad {
    
    // Blur Effect
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *bluredEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    [bluredEffectView setFrame:self.blurView.bounds];
    [self.view insertSubview:bluredEffectView belowSubview:self.blurView];
    //  [self.blurView addSubview:bluredEffectView];
        self.topicLabel.text = @"";
    
    self.topicImage.image = [UIImage imageNamed:@"I11"];
    
    screenHeight = self.view.frame.size.height;
    screenWidth = self.view.frame.size.width;
    
    [super viewDidLoad];
    
    float yPostion = 0.0;
    yPostion += 0;
    
    CGRect fullScreenRect = [[UIScreen mainScreen] applicationFrame];
//    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:fullScreenRect];
    self.scrollView.contentSize = CGSizeMake(screenWidth, 1400);
    self.scrollView.delegate = self;
    self.scrollView.showsVerticalScrollIndicator = YES;
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    self.image = [[UIImageView alloc] initWithFrame:CGRectMake(0, yPostion-44, screenWidth, screenWidth)];
    [self.image setImage:[UIImage imageNamed:@"I11"]];
    [self.image setContentMode:UIViewContentModeScaleAspectFit];
    [self.image setClipsToBounds:YES];
    [self.scrollView addSubview:self.image];
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(25, yPostion, screenWidth-50, 0.5)];
    lineView.backgroundColor = [UIColor colorWithRed:163/255 green:163/255 blue:163/255 alpha:1];
    [self.scrollView addSubview:lineView];
    
    yPostion += 10;
    
    self.inimage = [[UIImageView alloc] initWithFrame:CGRectMake(0, yPostion+70, screenWidth, 1300)];
    self.inimage.contentMode = UIViewContentModeScaleAspectFit;
    self.inimage.image = [UIImage imageNamed:@"Cells"];
    [self.scrollView addSubview:self.inimage];
    
    yPostion += 10;
    
    yPostion += (screenWidth-50)*2/3;
    
    //add background
    UIView *backGround = [[UIView alloc] initWithFrame:CGRectMake(0, screenWidth+44, screenWidth, self.scrollView.contentSize.height - screenWidth)];
    backGround.backgroundColor = [UIColor whiteColor];
    [self.scrollView insertSubview:backGround aboveSubview:self.image];
    
    [self.view insertSubview:self.scrollView belowSubview:bluredEffectView];// = scrollView;
    
    
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    self.tabBarController.navigationItem.title = @"News";
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat yOffset = scrollView.contentOffset.y;
    //NSLog(@"yOffset = %f",yOffset);
    if(yOffset<0) {
        self.image.frame = CGRectMake(0,yOffset-44,screenWidth-yOffset,(screenWidth)-yOffset);
        self.image.center = CGPointMake(screenWidth/2,self.image.center.y);
    } else if(yOffset>0) {
        self.image.frame = CGRectMake(0, 0.5*yOffset-44, screenWidth, screenWidth);
        self.image.center = CGPointMake(screenWidth/2, self.image.center.y);
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)closePress:(id)sender {
    [self.delegate highlightViewClose:self];
}
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
