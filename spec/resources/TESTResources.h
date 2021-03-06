/** THIS FILE IS AUTOGENERATED. DO NOT EDIT. CHANGES WILL BE DESTROYED. */

@import UIKit;

/** ATTENTION: Use this macro to access resources. */
#define TESTResources ([__TESTResources sharedInstance])

@interface __TESTStoryboards : NSObject

- (UIStoryboard *)Main;
- (UIStoryboard *)LaunchScreen;

@end

@interface __TESTTableViewCells : NSObject

- (NSString *)Cell;

@end

@interface __TESTCollectionViewCells : NSObject


@end

@interface __TESTViewControllers : NSObject

- (UINavigationController *)newNavigationController1;
- (DetailViewController *)newDetailViewController;
- (UISplitViewController *)newSplitViewController;
- (UIViewController *)newGenericController;
- (MasterViewController *)newMasterViewController;
- (UINavigationController *)newNavigationController2;

@end

@interface __TESTSegues : NSObject

- (NSString *)showDetail;

@end

/** Global resource reference accessor class. */
@interface __TESTResources : NSObject

/** Singleton accessor. */
+ (instancetype)sharedInstance;

/** Resource accessors. */
@property (nonatomic, strong) __TESTStoryboards *storyboards;
@property (nonatomic, strong) __TESTTableViewCells *tableCells;
@property (nonatomic, strong) __TESTCollectionViewCells *collectionCells;
@property (nonatomic, strong) __TESTViewControllers *viewControllers;
@property (nonatomic, strong) __TESTSegues *segues;

@end
