//
//  FoursquareObject.m
//  FoursquareAPI
//
//  Created by Reza Fatahi on 5/23/13.
//  Copyright (c) 2013 Brian Lewis. All rights reserved.
//

#import "FoursquareObject.h"

@implementation FoursquareObject

@synthesize name, address, city, zip, phone, checkins, herenow;   //, category, checkins, herenow;  //zip, phone,

- (id)initWithName:(NSString *)aName
       withAddress:(NSString *)anAddress
          withCity:(NSString *)aCity
           withZip:(NSString *)aZip
         withPhone:(NSString *)aPhone
      //withCategory:(NSString *)aCategory
      withCheckins:(NSInteger)theCheckins
       withHerenow:(NSInteger)theHerenow
{
    self = [super init];
    if (self) {
        name = aName;
        address = anAddress;
        city = aCity;
        zip = aZip;
        phone = aPhone;
        //category = aCategory;
        checkins = theCheckins;
        herenow = theHerenow;
    }
    return self;
}

@end
