//
//  ViewController.m
//  FoursquareAPI
//
//  Created by Brian Lewis on 5/23/13.
//  Copyright (c) 2013 Brian Lewis. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

-(void)getPopularRestaurants;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSLog(@"andrew was here");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)getPopularRestaurants
{
    
    //NSURL *url = [NSURL URLWithString:@"https://api.instagram.com/v1/media/search?lat=42.276490&lng=-83.741188&access_token=390125219.4ef70fd.a6a29cb887584e849bd01cac9fd62465"];
    
    NSURL *url = [NSURL URLWithString:@"https://api.instagram.com/v1/tags/hailtothevictors/media/recent?access_token=390125219.4ef70fd.a6a29cb887584e849bd01cac9fd62465"];
    
    
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        
        NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        imageArray = [responseDictionary objectForKey:@"data"];
        
        [activityIndicator stopAnimating];
        [self displayNextPhoto];
    }];
}

@end
