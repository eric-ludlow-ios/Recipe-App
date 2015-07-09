//
//  RARecipesTableViewDataSource.h
//  Recipe App
//
//  Created by Rutan on 7/8/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@interface RARecipesTableViewDataSource : NSObject <UITableViewDataSource>

//Use this code if you are not initializing cells with style (which automatically links up new cells with ID's) so that the new cells can get registered with ID's:
//
//- (void)registerTableView:(UITableView *)tableView;

@end
