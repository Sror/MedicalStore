//
//  MSProductDetailVC.m
//  MedicalStore
//
//  Created by Dong Yiming on 7/14/13.
//  Copyright (c) 2013 Dong Yiming. All rights reserved.
//

#import "MSProductDetailVC.h"


@interface MSProductDetailVC ()
@property (weak, nonatomic) IBOutlet UIScrollView *svContent;
@property (weak, nonatomic) IBOutlet UIImageView *ivLogo;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblSubTitle;
@property (weak, nonatomic) IBOutlet UIView *viewBrief;
@property (weak, nonatomic) IBOutlet UILabel *lblBrief;
@property (weak, nonatomic) IBOutlet UIView *viewHead;
@end

@implementation MSProductDetailVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"联系人";
    
    self.lblTitle.text = _lblTString;
    self.lblSubTitle.text = _lblSTString;
    
    [_viewHead applyEffectShadowAndBorder];
    [_viewBrief applyEffectShadowAndBorder];
    [_ivLogo applyEffectRoundRectSilverBorder];
}


@end
