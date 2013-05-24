//
//  ViewController.m
//  FoursquareAPI
//
//  Created by Brian Lewis on 5/23/13.
//  Copyright (c) 2013 Brian Lewis. All rights reserved.
//

#import "ViewController.h"
#import "FoursquareObject.h"

@interface ViewController ()
{
    NSString* inputString;
}

@property (strong, nonatomic) NSMutableArray *arrayOfFoursquareObjects;

-(void)getPopularRestaurants;
@end

@implementation ViewController



- (void)viewDidLoad
{
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    inputString = @"Chicago";
    
    self.arrayOfFoursquareObjects = [[NSMutableArray alloc]init];
    
    [self getPopularRestaurants];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)getPopularRestaurants
{
    
    //NSURL *url = [NSURL URLWithString:@"https://api.instagram.com/v1/media/search?lat=42.276490&lng=-83.741188&access_token=390125219.4ef70fd.a6a29cb887584e849bd01cac9fd62465"];
    
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://api.foursquare.com/v2/venues/search?near=%@&client_id=2FUZ4RW0W5UL0BM1PBSHE3LOEHCBUZKWUMKFCO0ZEUGAN5FA&client_secret=HP2RZS4O1IOK5UIJZVNYBISXRDYPSHVDM0P3DGJPJASDHNXS&v=20130523",inputString]];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
                               
                               NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:data
                                                                                                  options:0
                                                                                                    error:nil];
                               
                               NSArray *arrayFromResponseDictionary = [[responseDictionary objectForKey:@"response"] objectForKey:@"venues"];
                               
                               
                               
                               for (int i= 0; i < arrayFromResponseDictionary.count; i++) {
                                   NSLog(@"#%i dictionary is...\n\n%@",i,arrayFromResponseDictionary[i]);
                                   
                                   
                                   FoursquareObject *foursquareObject = [[FoursquareObject alloc]initWithName:[arrayFromResponseDictionary[i] objectForKey:@"name"] 
                                                                         
                                                                                                  withAddress:[[arrayFromResponseDictionary[i] objectForKey:@"location"]objectForKey:@"address" ]
                                                                         
                                                                                                     withCity:[[arrayFromResponseDictionary[i] objectForKey:@"location"]objectForKey:@"city"]
                                                                         
                                                                                                      withZip:[[arrayFromResponseDictionary[i] objectForKey:@"location"]objectForKey:@"postalCode"]
                                                                         
                                                                                                    withPhone:[[arrayFromResponseDictionary[i] objectForKey:@"contact"]objectForKey:@"formattedPhone"]
                                                                         
                                                                                             //    withCategory:[[(NSArray *)[arrayFromResponseDictionary[i] objectForKey:@"categories"] objectAtIndex:0] objectForKey:@"name"]
                                                                                                               
                                                                         
                                                                                                 withCheckins:(NSInteger)[[arrayFromResponseDictionary[i] objectForKey:@"stats"]objectForKey:@"checkinsCount"]
                                                                         
                                                                                                  withHerenow:(NSInteger)[[arrayFromResponseDictionary[i] objectForKey:@"hereNow"]objectForKey:@"count"]];
                                   
                                   [self.arrayOfFoursquareObjects addObject:foursquareObject];
                                   NSLog(@"self.arrayOfFoursquareObjects %@", self.arrayOfFoursquareObjects);
                                   NSLog(@"self.arrayOfFoursquareObjects count %i", self.arrayOfFoursquareObjects.count);
                                   
                                   
                               }
                               
                               /*int i = 0;
                               
                               
                               
                               for (NSDictionary* dictionary in arrayFromResponseDictionary) {
                                   
                                   printf("%i\n",i);
                                   
                                   i++;
                                   
                                   FoursquareObject *foursquareObject = [[FoursquareObject alloc]initWithName:[dictionary objectForKey:@"name"]
                                                       
                                                                                withAddress:[[dictionary objectForKey:@"location"]objectForKey:@"address"]
                                                       
                                                                                   withCity:[[dictionary objectForKey:@"location"]objectForKey:@"city"]
                                                       
                                                                                    //withZip:[[dictionary objectForKey:@"location"]objectForKey:@"postalCode"]
                                                       
                                                                                  //withPhone:[[dictionary objectForKey:@"contact"]objectForKey:@"formattedPhone"]
                                                       
                                                                               withCategory:[[dictionary objectForKey:@"categories"][0] objectForKey:@"name"]
                                                       
                                                                               withCheckins:(NSInteger)[[dictionary objectForKey:@"stats"]objectForKey:@"checkinsCount"]
                                                       
                                                                                withHerenow:(NSInteger)[[dictionary objectForKey:@"hereNow"]objectForKey:@"count"]];
                                   
                                   [self.arrayOfFoursquareObjects addObject:foursquareObject];
                                   NSLog(@"self.arrayOfFoursquareObjects %@", self.arrayOfFoursquareObjects);
                                   NSLog(@"self.arrayOfFoursquareObjects count %i", self.arrayOfFoursquareObjects.count);
                               }
                               
                               NSLog(@"%i is count of array", self.arrayOfFoursquareObjects.count);
                                
                                */
                               
                               
    }];
}

- (IBAction)actionButton:(id)sender {
    
    [self.textField resignFirstResponder];
    
    inputString = self.textField.text;
    
    [self getPopularRestaurants];
    
    [self.tableView reloadData];
    
}


#pragma mark-table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arrayOfFoursquareObjects.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id"];

    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
    }
        
    //declare string, assign to value at indexPath from array
    //array may be made from [dictionary allKeys];
    NSString* string = [[self.arrayOfFoursquareObjects objectAtIndex:indexPath.row] name];
    NSString* subtitle = [NSString stringWithFormat:@"Checkins: %i\nHere now:%i",[[self.arrayOfFoursquareObjects objectAtIndex:indexPath.row] checkins], [[self.arrayOfFoursquareObjects objectAtIndex:indexPath.row] herenow]];
    
    //set string to textLabel of cell
    [cell.textLabel setText:string];
    [cell.detailTextLabel setText:subtitle];
    
    
    
    return cell;
}




@end
