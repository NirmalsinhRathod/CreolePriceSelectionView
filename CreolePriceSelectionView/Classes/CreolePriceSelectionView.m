//
//  CreolePriceSelectionView.h
//
//
//  Created by Nirmalsinh Rathod on 09/05/17.
//  Copyright © 2017 CreoleStudios. All rights reserved.
//

#import "CreolePriceSelectionView.h"

@implementation CreolePriceSelectionView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super initWithCoder:aDecoder])) {
    }
    return self;
}

-(void)setDefaultColor{
    _selectItemColor = [UIColor colorWithRed:238/255.0 green:18/255.0 blue:0/255.0 alpha:1.0];
    _normalItemColor = [UIColor colorWithRed:238/255.0 green:18/255.0 blue:0/255.0 alpha:0.5];
    _selectedTextColor = [UIColor whiteColor];
    _normalTextColor = [UIColor grayColor];
}

-(void)setPriceForItem : (NSString *)price
{
    _selectedIndex = [aryPrice indexOfObject:[NSString stringWithFormat:@"%@",price]];
    [_carousel scrollToItemAtIndex:_selectedIndex animated:NO];

}
-(void)setup : (NSMutableArray *)yourItemArray
{
    [_carousel removeFromSuperview];
    _width = (self.frame.size.width-6)/3;
    aryPrice = [NSMutableArray new];
    aryPrice = [yourItemArray mutableCopy];
    _carousel = [[iCarousel alloc] initWithFrame:self.bounds];
    _carousel.pagingEnabled = FALSE;
    _carousel.delegate = self;
    _carousel.dataSource =self;
    _carousel.type = iCarouselTypeLinear;
    [_carousel reloadData];
    [self addSubview:_carousel];
}
#pragma mark  - iCarousel methods
- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    //return the total number of items in the carousel
    return [aryPrice count];
}
- (CGFloat)carouselItemWidth:(iCarousel *)carousel
{
    return _width-10;
}
- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{
    UILabel *label = nil;

    if (view == nil)
    {
        view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, _width, self.frame.size.height)];
        view.contentMode = UIViewContentModeCenter;
        CGRect rectLabel = view.bounds;
        label = [[UILabel alloc] initWithFrame:rectLabel];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [label.font fontWithSize:25];
        label.tag = 1;
        [view addSubview:label];
    }
    else
    {
        label = (UILabel *)[view viewWithTag:1];
    }
    
    if(_selectedIndex == index)
    {
        view.backgroundColor = _selectItemColor;
        label.textColor = _selectedTextColor;
    }
    else
    {
        view.backgroundColor = _normalItemColor;
        label.textColor = _normalTextColor;
    }
    

    label.text = [NSString stringWithFormat:@"$%@",aryPrice[index]];
    
    return view;
}
//- (NSInteger)numberOfPlaceholdersInCarousel:(iCarousel *)carousel
//{
//    return 2.0;
//}
- (UIView *)carousel:(iCarousel *)carousel placeholderViewAtIndex:(NSInteger)index reusingView:(nullable UIView *)view
{
    UILabel *label = nil;
    
    if (view == nil)
    {
        view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, _width+5, self.frame.size.height)];
        view.contentMode = UIViewContentModeCenter;
        view.backgroundColor = _selectItemColor;
        CGRect rectLabel = view.bounds;
        label = [[UILabel alloc] initWithFrame:rectLabel];
        label.backgroundColor = [UIColor clearColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [label.font fontWithSize:25];
        label.tag = 1;
        [view addSubview:label];
    }
    else
    {
        label = (UILabel *)[view viewWithTag:1];
    }
    if(_selectedIndex == index)
    {
        view.backgroundColor = _selectItemColor;
        label.textColor = _selectedTextColor;
    }
    else
    {
        view.backgroundColor = _normalItemColor;
        label.textColor = _normalTextColor;
    }


    label.text = [NSString stringWithFormat:@"$%@",aryPrice[index]];
    
    return view;

}
- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value
{
    if (option == iCarouselOptionSpacing)
    {
        return value * 1.1;
    }
    return value;
}

- (BOOL)carouselShouldWrap:(iCarousel *)carousel
{
    return YES;
}
- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel
{
}
- (void)carouselDidEndDragging:(iCarousel *)carousel willDecelerate:(BOOL)decelerate
{
    if(decelerate == FALSE)
    {
        _selectedIndex = carousel.currentItemIndex;
        [_delegate getPriceForSelectedIndex:aryPrice[_selectedIndex]];
        [_carousel reloadData];
    }
}
- (void)carouselDidEndDecelerating:(iCarousel *)carousel
{
    _selectedIndex = carousel.currentItemIndex;
    [_delegate getPriceForSelectedIndex:aryPrice[_selectedIndex]];
    [_carousel reloadData];

}
- (void)carouselDidEndScrollingAnimation:(iCarousel *)carousel
{
  if(_isClicked)
  {
      _isClicked = FALSE;
      _selectedIndex = carousel.currentItemIndex;
      [_delegate getPriceForSelectedIndex:aryPrice[_selectedIndex]];
      [_carousel reloadData];

  }
}
- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index {
    _isClicked = TRUE;
}


@end
