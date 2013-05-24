//
//  FoursquareObject.h
//  FoursquareAPI
//
//  Created by Reza Fatahi on 5/23/13.
//  Copyright (c) 2013 Brian Lewis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FoursquareObject : NSObject

@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSString* address;
@property (strong, nonatomic) NSString* city;
@property (strong, nonatomic) NSString* zip;
@property (strong, nonatomic) NSString* phone;
//@property (strong, nonatomic) NSString* category;  /*COULD NOT FIGURE OUT HOW TO EXTRACT CATEGORY FROM DICTIONARY WITHOUT ERROR- Rex 052413*/
@property (assign, nonatomic) NSInteger checkins;
@property (assign, nonatomic) NSInteger herenow;

- (id)initWithName:(NSString *)aName
       withAddress:(NSString *)anAddress
          withCity:(NSString *)aCity
           withZip:(NSString *)aZip
         withPhone:(NSString *)aPhone
      //withCategory:(NSString *)aCategory
      withCheckins:(NSInteger)theCheckins
       withHerenow:(NSInteger)theHerenow;

@end
