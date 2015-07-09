//
//  RARecipesTableViewDataSource.m
//  Recipe App
//
//  Created by Rutan on 7/8/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "RARecipesTableViewDataSource.h"
#import "RARecipeDetails.h"

static NSString *cellID = @"cellID";

@implementation RARecipesTableViewDataSource

#pragma mark - Unique Methods: register class for table view


//Use this code if you are not initializing cells with style (which automatically links up new cells with ID's) so that the new cells can get registered with ID's:
//
//- (void)registerTableView:(UITableView *)tableView {
//    
//    //link the type of cell I want to use with an Identifier???
//    
//    [tableView registerClass:[UITableViewCell class]  //note: you are passing in the class by calling the object's 'class' method
//      forCellReuseIdentifier:cellID];
//}

#pragma mark - UITableViewDataSource Protocol Required Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    int i = (int)[RARecipeDetails count];
    return i;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    //do not use the 'if' statement code if you are not initializing cells with style (and are registering cells instead)
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle  reuseIdentifier:cellID];
    }
    
    cell.textLabel.text = [RARecipeDetails titleAtIndex:indexPath.row];
    cell.detailTextLabel.text = [RARecipeDetails descriptionAtIndex:indexPath.row];
//    cell.detailTextLabel.numberOfLines = 0;
    cell.backgroundColor = [UIColor lightGrayColor];
    
    return cell;

}


@end
