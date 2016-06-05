//
//  testViewController.m
//  PetrolApp
//
//  Created by Rafael Pérez on 6/4/16.
//  Copyright © 2016 Rafael Pérez. All rights reserved.
//

#import "testViewController.h"

@interface testViewController ()

@end

@implementation testViewController
@synthesize txtLocation = _txtLocation;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
 
    //UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    //[button setImage:[UIImage imageNamed:@"NearMe"] forState:UIControlStateNormal];
    UIImageView *imageview = [[UIImageView alloc]initWithFrame:CGRectMake(100.0, 100.0, 25.0, 25.0)];
    [imageview setImage:[UIImage imageNamed:@"NearMe"]];
    [imageview setUserInteractionEnabled:YES];
    
    UITapGestureRecognizer *singleTap =  [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(refresh:)];
    [singleTap setNumberOfTapsRequired:1];
    [imageview addGestureRecognizer:singleTap];
    //[button addTarget:self action:@selector(refresh:) forControlEvents:UIControlEventTouchUpInside];
    
    _txtLocation.rightViewMode = UITextFieldViewModeAlways;
    //_txtLocation.rightView = button;
   // _txtLocation.rightView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"NearMe"]];
    _txtLocation.rightView = imageview;
}

-(IBAction)refresh:(id)sender{
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:@"Código incorrecto"
                                  message:@"Este código no es correcto, favor introducir código válido."
                                  preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:ok];
    [self presentViewController:alert animated:YES completion:nil];

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
