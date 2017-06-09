# CreolePriceSelectionView

[![CI Status](http://img.shields.io/travis/NirmalsinhRathod/CreolePriceSelectionView.svg?style=flat)](https://travis-ci.org/NirmalsinhRathod/CreolePriceSelectionView)
[![Version](https://img.shields.io/cocoapods/v/CreolePriceSelectionView.svg?style=flat)](http://cocoapods.org/pods/CreolePriceSelectionView)
[![License](https://img.shields.io/cocoapods/l/CreolePriceSelectionView.svg?style=flat)](http://cocoapods.org/pods/CreolePriceSelectionView)
[![Platform](https://img.shields.io/cocoapods/p/CreolePriceSelectionView.svg?style=flat)](http://cocoapods.org/pods/CreolePriceSelectionView)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Manual Installation

Just drag a file into your project and use below code:

```ruby
    CreolePriceSelectionView *objCreolePriceSelectionView = [[CreolePriceSelectionView alloc] initWithFrame:CGRectMake(YOUR_FRAME)];
    [objCreolePriceSelectionView setDefaultColor]; // It will set defualt color for text and background.
    
    /*
     You can set text color manually also.
     
     objCreolePriceSelectionView.selectItemColor = YOUR_SELECTED_ITEM_COLOR.
     objCreolePriceSelectionView.normalItemColor  = YOUR_NORMAL_ITEM_COLOR.
     objCreolePriceSelectionView.selectedTextColor = YOUR_SELECTED_TEXT_COLOR
     objCreolePriceSelectionView.normalTextColor = YOUR_NORMAL_TEXT_COLOR
     
     */
    
    // You can pass your array for price like this:
    [objCreolePriceSelectionView setup:[[NSMutableArray alloc] initWithObjects:@"10", @"20", @"30", @"40", @"50", @"60", @"70", @"80", @"90", @"100", nil]];
    
    // Its directlly select the
    // This is optional steps to do. If you don't do this one, then it will set first automatically.
    [objCreolePriceSelectionView setPriceForItem:@"30"];
    
    // Set delegate to get access of current index
    objCreolePriceSelectionView.delegate = self;
    [self.view addSubview:objCreolePriceSelectionView];
    
    
    // DELEGATE 
    -(void)getPriceForSelectedIndex :(NSString *)strPrice
    {
     NSLog(@"Current selected price is :%@",strPrice);
    }

```


## Installation

CreolePriceSelectionView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "CreolePriceSelectionView"
```

## Author

NirmalsinhRathod, nirmasinh@creolestudios.com

## License

CreolePriceSelectionView is available under the MIT license. See the LICENSE file for more info.
