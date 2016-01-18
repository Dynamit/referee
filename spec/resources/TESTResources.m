/** THIS FILE IS AUTOGENERATED. DO NOT EDIT. CHANGES WILL BE DESTROYED. */

#import "TESTResources.h"

/** UIStoryboard accessors. */
@implementation __TESTStoryboards

- (UIStoryboard *)Main
{
	return [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
}
- (UIStoryboard *)LaunchScreen
{
	return [UIStoryboard storyboardWithName:@"LaunchScreen" bundle:[NSBundle mainBundle]];
}

@end

/** UITableViewCell identifier accessors. */
@implementation __TESTTableViewCells

- (NSString *)Cell
{
	return @"Cell";
}

@end

/** UICollectionViewCell identifier accessors. */
@implementation __TESTCollectionViewCells


@end

/** UIViewController accessors. */
@implementation __TESTViewControllers

- (UINavigationController *)NavigationController1
{
	return (UINavigationController *)[[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"NavigationController1"];
}
- (DetailViewController *)DetailViewController
{
	return (DetailViewController *)[[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"DetailViewController"];
}
- (UISplitViewController *)SplitViewController
{
	return (UISplitViewController *)[[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"SplitViewController"];
}
- (UIViewController *)GenericController
{
	return (UIViewController *)[[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"GenericController"];
}
- (MasterViewController *)MasterViewController
{
	return (MasterViewController *)[[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"MasterViewController"];
}
- (UINavigationController *)NavigationController2
{
	return (UINavigationController *)[[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"NavigationController2"];
}

@end

/** Segue identifier accessors. */
@implementation __TESTSegues

- (NSString *)showDetail
{
	return @"showDetail";
}

@end

/** Main resource reference class. */
@implementation __TESTResources

- (instancetype)init
{
    self = [super init];

    if (self) {
        self.storyboards = [[__TESTStoryboards alloc] init];
        self.tableCells = [[__TESTTableViewCells alloc] init];
        self.collectionCells = [[__TESTCollectionViewCells alloc] init];
        self.viewControllers = [[__TESTViewControllers alloc] init];
        self.segues = [[__TESTSegues alloc] init];
    }

    return self;
}

+ (instancetype)sharedInstance
{
    static id _self = nil;
    static dispatch_once_t once_Token;
    dispatch_once(&once_Token, ^{
      _self = [[super alloc] init];
    });
    return _self;
}

@end