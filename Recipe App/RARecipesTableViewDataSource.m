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

- (void)registerTableView:(UITableView *)tableView {
    
    //link the type of cell I want to use with an Identifier???
    
    [tableView registerClass:[UITableViewCell class]  //note: you are passing in the class by calling the object's 'class' method
      forCellReuseIdentifier:cellID];
}

#pragma mark - UITableViewDataSource Protocol Required Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    int i = (int)[RARecipeDetails count];
    return i;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    
    cell.textLabel.text = [RARecipeDetails titleAtIndex:indexPath.row];
    cell.backgroundColor = [UIColor lightGrayColor];
    
    return cell;
}


@end
