//
//  CreolePriceSelectionView.h
//
//
//  Created by Nirmalsinh Rathod on 09/05/17.
//  Copyright © 2017 CreoleStudios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iCarousel.h"

@protocol CreolePriceSelectionViewDelegate <NSObject>
@optional
-(void)getPriceForSelectedIndex :(NSString *)strPrice;
@end

@interface CreolePriceSelectionView : UIView<iCarouselDataSource, iCarouselDelegate>
{
    NSMutableArray *aryPrice;
}
@property (nonatomic, strong) id<CreolePriceSelectionViewDelegate> delegate;
@property (nonatomic, strong) iCarousel *carousel;
@property (nonatomic, strong) UIColor *selectItemColor, *normalItemColor, *selectedTextColor, *normalTextColor;
@property (nonatomic) NSInteger selectedIndex;
@property (nonatomic) BOOL isClicked;
@property (nonatomic, readwrite) float width;

-(void)setDefaultColor;
-(void)setup : (NSMutableArray *)yourItemArray;
-(void)setPriceForItem : (NSString *)price;

@end
