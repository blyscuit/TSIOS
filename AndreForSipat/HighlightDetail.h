//
//  HighlightDetail.h
//  OpenHouseOneFive
//
//  Created by Thanat Jatuphattharachat on 10/30/2558 BE.
//  Copyright © 2558 Thinc. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol HighlightViewDelegate;


@interface HighlightDetail : UIViewController<UIScrollViewDelegate>

@property (weak,nonatomic) id<HighlightViewDelegate> delegate;

@property (strong, nonatomic) UIImageView *image;
@property (strong, nonatomic) UIImageView *inimage;

@end

@protocol HighlightViewDelegate <NSObject>
-(void)highlightViewClose:(HighlightDetail*)controller;

@end
