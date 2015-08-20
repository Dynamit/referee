@import UIKit;

/** ATTENTION: Use this macro to access resources. */
#define {{ prefix }}Resources ([__{{ prefix }}Resources sharedInstance])

@interface __{{ prefix }}Storyboards : NSObject

{{{ storyboard_declarations }}}
@end

@interface __{{ prefix }}TableViewCells : NSObject

{{{ tv_cell_methods }}}
@end

@interface __{{ prefix }}CollectionViewCells : NSObject

{{{ cv_cell_methods }}}
@end

@interface __{{ prefix }}ViewControllers : NSObject

{{{ view_controller_methods }}}
@end

@interface __{{ prefix }}Segues : NSObject

{{{ segue_methods }}}
@end

/** Global resource reference accessor class. */
@interface __{{ prefix }}Resources : NSObject

/** Singleton accessor. */
+ (instancetype)sharedInstance;

/** Resource accessors. */
@property (nonatomic, strong) __{{ prefix }}Storyboards *storyboards;
@property (nonatomic, strong) __{{ prefix }}TableViewCells *tableCells;
@property (nonatomic, strong) __{{ prefix }}CollectionViewCells *collectionCells;
@property (nonatomic, strong) __{{ prefix }}ViewControllers *viewControllers;
@property (nonatomic, strong) __{{ prefix }}Segues *segues;

@end
