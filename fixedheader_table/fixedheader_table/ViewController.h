//
//  ViewController.h
//  fixedheader_table
//
//  Created by Zsolt Normann on 7/18/13.
//  Copyright (c) 2013 Zsolt Normann. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
	NSArray *tbllist;
	
	UIView *fixed_header;
	UIView *fixed_header_placeholder;
	CGRect fixed_header_top;
}


@property IBOutlet UITableView *mytable;
@property IBOutlet UILabel *lbl_ycoord;

@end
