//
//  KENAnimal.h
//  BL_testForOC
//
//  Created by ken on 15/8/12.
//  Copyright (c) 2015年 ken. All rights reserved.
//
#import <Foundation/Foundation.h>

typedef enum{
    male,
    female
}GenderType;


@interface KENAnimal : NSObject
{
    
}

@property(nonatomic, copy)NSString * species;
@property(nonatomic, assign)GenderType gender;
@property(nonatomic, assign)NSInteger weight;

-(instancetype)initWithSpecies:(NSString*)species Gender:
(GenderType)gender Weight:(NSInteger)weight;

+(KENAnimal*)CreateAnimal;
-(void)makeNoise;
 
@end
