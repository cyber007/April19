//
//  BigView.m
//  April19
//
//  Created by admin on 4/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BigView.h"
#import "LittleView0.h"
#import "LittleView1.h"

@implementation BigView

- (id) initWithFrame: (CGRect) frame
{
	self = [super initWithFrame: frame];
	if (self) {
		// Initialization code
        
		//Don't bother with a background color--
		//this BigView is entirely occupied by a LittleView.
		
		views = [NSArray arrayWithObjects:
                 [[LittleView0 alloc] initWithFrame: self.bounds],
                 [[LittleView1 alloc] initWithFrame: self.bounds],
                 nil
                 ];
        
		index = 1;	//LittleView0 is the one that's initially visible.
		[self addSubview: [views objectAtIndex: index]];
	}
	return self;
}

- (void) touchesEnded: (NSSet *) touches withEvent: (UIEvent *) event {
	
	/*
     Assume a swipe has just ended.  A more complicated program could
     distinguish between left vs. rights wipes, and perform a
     UIViewAnimationOptionTransitionFlipFromLeft or a
     UIViewAnimationOptionTransitionFlipFromRight.
     
     In UIViewAnimationOptionTransitionFlipFromLeft, the left edge moves
     to the right, and the right edge moves away from the user and to the
     left.
     */
    NSLog(@"View %d touched", index);
	NSUInteger newIndex = 1 - index;	//toggle the index
    
	[UIView transitionFromView: [views objectAtIndex: index]
                        toView: [views objectAtIndex: newIndex]
                      duration: 2.25
                       options: UIViewAnimationOptionTransitionFlipFromLeft
                    completion: NULL
     ];
    
	index = newIndex;
}


/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void) drawRect: (CGRect) rect
 {
 // Drawing code
 }
 */

@end
