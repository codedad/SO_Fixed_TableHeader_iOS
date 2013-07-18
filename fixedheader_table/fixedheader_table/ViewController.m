//
//  ViewController.m
//  fixedheader_table
//
//  Created by Zsolt Normann on 7/18/13.
//  Copyright (c) 2013 Zsolt Normann. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize mytable;
@synthesize lbl_ycoord;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	tbllist = [[NSArray alloc] initWithObjects:@"Alma",@"Korte",@"Barack",@"Dinnye",@"Szilva",@"Alma",@"Korte",@"Barack",@"Dinnye",@"Szilva",@"Alma",@"Korte",@"Barack",@"Dinnye",@"Szilva", nil];
	
	
	fixed_header = [[[NSBundle mainBundle] loadNibNamed:@"TableHeaderView" owner:self options:nil] lastObject];
	fixed_header_placeholder = [[UIView alloc] init];
	fixed_header_placeholder.frame = fixed_header.frame;
	mytable.tableHeaderView = fixed_header_placeholder;
	fixed_header_top = mytable.tableHeaderView.frame;
	[self.view addSubview:fixed_header];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [tbllist count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
	cell.textLabel.text = [tbllist objectAtIndex:indexPath.row];

	return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView_ {
    CGFloat actualPosition = scrollView_.contentOffset.y;
	
	CGRect rect = [mytable convertRect:[mytable rectForHeaderInSection:0] toView:[mytable superview]];
	
	NSLog(@"%f, %f", actualPosition, rect.origin.y);
	
	if (rect.origin.y>=fixed_header.frame.size.height) {
		fixed_header.frame = CGRectMake(fixed_header.frame.origin.x, rect.origin.y-fixed_header.frame.size.height, fixed_header.frame.size.width , fixed_header.frame.size.height);
	} else {
		fixed_header.frame = fixed_header_top;
	}
	lbl_ycoord.text = [NSString stringWithFormat:@"%f", actualPosition];
	
}

@end
