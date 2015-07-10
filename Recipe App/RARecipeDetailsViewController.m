//
//  RARecipeDetailsViewController.m
//  Recipe App
//
//  Created by Rutan on 7/9/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "RARecipeDetailsViewController.h"
#import "RARecipeDetailsDataModel.h"

static NSInteger margin = 10;

@interface RARecipeDetailsViewController ()

@end

@implementation RARecipeDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = [RARecipeDetailsDataModel titleAtIndex:self.recipeIndex];
    
    UIScrollView *recipeDetailsScrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    recipeDetailsScrollView.backgroundColor = [UIColor cyanColor];
    
    //sets up descriptionLabel with its frame
    
    NSInteger w = self.view.frame.size.width - margin*2;
    NSInteger y = margin;
    NSString *s = [RARecipeDetailsDataModel descriptionAtIndex:self.recipeIndex];
    NSInteger h = [self heightOfString: s
                      inLabelWithWidth:w];
    NSInteger totalHeight = y + h;
    
    UILabel *descriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(margin, y, w, h)];
    descriptionLabel.numberOfLines = 0;
    descriptionLabel.text = s;
    [recipeDetailsScrollView addSubview:descriptionLabel];
    
    //sets up ingredient volumes and types labels with their frames
    
    for (int i = 0; i < [RARecipeDetailsDataModel ingredientCountAtIndex:self.recipeIndex]; i++) {
    
        NSInteger volw = 100;
        NSInteger typew = 200;
        y = totalHeight + margin;
        s = [RARecipeDetailsDataModel ingredientVolumeAtIndex:i
                                              inRecipeAtIndex:self.recipeIndex];
        h = [self heightOfString:s
                inLabelWithWidth:volw];
        
        UILabel *ingredientVolumeLabel = [[UILabel alloc] initWithFrame:CGRectMake(margin, y, volw, h)];
        ingredientVolumeLabel.text = s;
        [recipeDetailsScrollView addSubview:ingredientVolumeLabel];
        
        s = [RARecipeDetailsDataModel ingredientTypeAtIndex:i
                                            inRecipeAtIndex:self.recipeIndex];
        h = [self heightOfString:s
                inLabelWithWidth:typew];
        totalHeight = y + h;
        
        UILabel *ingredientTypeLabel = [[UILabel alloc] initWithFrame:CGRectMake(volw + margin*2, y, typew, h)];
        ingredientTypeLabel.text = s;
        [recipeDetailsScrollView addSubview:ingredientTypeLabel];
    }

    //sets up directions labels with their frames
    //needs a for loop ****
    for (int i = 0; i < [RARecipeDetailsDataModel directionsAtIndex:self.recipeIndex].count; i++) {
        
        w = self.view.frame.size.width - margin*2;
        y = totalHeight + margin;
        s = [RARecipeDetailsDataModel directionsAtIndex:self.recipeIndex][i];
        h = [self heightOfString:s
                inLabelWithWidth:w];
        totalHeight = y + h;
        
        UILabel *directionsLabel = [[UILabel alloc] initWithFrame:CGRectMake(margin, y, w, h)];
        directionsLabel.numberOfLines = 0;
        directionsLabel.text = s;
        [recipeDetailsScrollView addSubview:directionsLabel];
        
        recipeDetailsScrollView.contentSize = CGSizeMake(self.view.frame.size.width, totalHeight);
        [self.view addSubview:recipeDetailsScrollView];
    }
}

- (NSInteger) heightOfString:(NSString *)string inLabelWithWidth:(NSInteger)width {
    
    CGRect template = [string boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX)
                                            options:NSStringDrawingUsesLineFragmentOrigin
                                         attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20]}
                                            context:nil];
    return template.size.height;
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
