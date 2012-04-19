//
//  LittleView0.m
//  April19
//
//  Created by admin on 4/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LittleView0.h"

@implementation LittleView0

- (id) initWithFrame: (CGRect) frame
{
	self = [super initWithFrame: frame];
	if (self) {
		// Initialization code
		//textView = [[UITextView alloc] initWithFrame: self.bounds];
		self.backgroundColor = [UIColor whiteColor];
		self.textColor = [UIColor blackColor];
		self.font = [UIFont fontWithName: @"Times New Roman" size: 15.75];
		self.editable = NO;	//Don't pop up a keyboard.
        
        UIPinchGestureRecognizer *recognizer = [[UIPinchGestureRecognizer alloc]
                                                initWithTarget: self action: @selector(pinch:)
                                                ];
        
		oldScale = recognizer.scale;
		[self pinch: recognizer];
		[self addGestureRecognizer: recognizer];
		//[self addSubview: textView];
	}
	return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

- (void) drawRect: (CGRect) rect
{
	/* Drawing code
    //Print the name of the class.  See the main function in main.m.
    Class class = [self class];
    NSString *string = NSStringFromClass(class);
	UIFont *font = [UIFont systemFontOfSize: 32];
	[string drawAtPoint: CGPointZero withFont: font];
    */
    self.text =
    @"Two households, both alike in dignity,\n"
    @"In fair Verona, where we lay our scene,\n"
    @"From ancient grudge break to new mutiny,\n"
    @"Where civil blood makes civil hands unclean.\n\n"
    
    @"From forth the fatal loins of these two foes\n"
    @"A pair of star-cross’d lovers take their life;\n"
    @"Whose misadventur'd piteous overthrows\n"
    @"Doth with their death bury their parents’ strife.\n\n"
    
    @"The fearful passage of their death-mark’d love,\n"
    @"And the continuance of their parents’ rage,\n"
    @"Which, but their children’s end, naught could remove,\n"
    @"Is now the two hours’ traffic of our stage;\n\n"
    
    @"The which if you with patient ears attend,\n"
    @"What here shall miss, our toil shall strive to mend.\n\n";
    
    self.text = [self.text stringByAppendingFormat:
                 @"\t\tRomeo and Juliet, Prologue %dâ€“%d", 1, 14
                 ];
}

- (void) pinch: (UIPinchGestureRecognizer *) recognizer
{
	/*
     self.bounds = CGRectMake(
                              (self.bounds.size.width - width * recognizer.scale) / 2,
                              (self.bounds.size.height - height * recognizer.scale) / 2,
                              width * recognizer.scale,
                              height * recognizer.scale
                              );
	*/
	self.font = [UIFont systemFontOfSize: 20 * recognizer.scale];
	NSString *verdict;
	
	if (recognizer.scale > oldScale) {
		verdict = @"spread";
	} else if (recognizer.scale < oldScale) {
		verdict = @"pinch";
	} else {
		verdict = @"neither";
	}
	oldScale = recognizer.scale;
    
	/*
     label.text = [NSString stringWithFormat: @"%@ %g",
                  verdict, recognizer.scale
                  ];
     */
}

@end
