//
//  RARecipeListViewController.m
//  Recipe App
//
//  Created by Rutan on 7/8/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "RARecipeNamesViewController.h"
#import "RARecipesTableViewDataSource.h"

@interface RARecipeNamesViewController ()

@property (strong, nonatomic)UITableView *recipeNamesTableView;
@property (strong, nonatomic)RARecipesTableViewDataSource *recipeDataSource;

@end

@implementation RARecipeNamesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.recipeNamesTableView = [[UITableView alloc] initWithFrame:self.view.bounds
                                                             style:UITableViewStylePlain];

    NSShadow *titleShadow = [[NSShadow alloc] init];
    titleShadow.shadowColor = [UIColor blackColor];
    titleShadow.shadowOffset = CGSizeMake(2, 0);

    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor],
                                                                    NSShadowAttributeName:titleShadow,
                                                                    NSFontAttributeName: [UIFont fontWithName:@"Noteworthy" size:20]};
    
    self.title = @"Pretty OK, Old-Timey Recipes";
    self.navigationController.navigationBar.barTintColor = [UIColor grayColor];
    self.recipeNamesTableView.backgroundColor = [UIColor darkGrayColor];
    
    self.recipeDataSource = [RARecipesTableViewDataSource new];
    
    //Use this code if you are not initializing cells with style (which automatically links up new cells with ID's) so that the new cells can get registered with ID's:
    //
//    [self.recipeDataSource registerTableView:self.recipeNamesTableView];
    self.recipeNamesTableView.dataSource = self.recipeDataSource;
    
    [self.view addSubview:self.recipeNamesTableView];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
