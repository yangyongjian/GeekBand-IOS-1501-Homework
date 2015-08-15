//
//  KENAnimal.m
//  BL_testForOC
//
//  Created by ken on 15/8/12.
//  Copyright (c) 2015年 ken. All rights reserved.
//

#import "KENAnimal.h"

@implementation KENAnimal

-(instancetype)initWithSpecies:(NSString*)species Gender:
(GenderType)gender Weight:(NSInteger)weight
{
    self = [super init];
    if(self != nil){
        self.species = species;
        self.gender = gender;
        self.weight = weight;
    }
    return self;
}

+(KENAnimal*)CreateAnimal
{
    KENAnimal * animal = [[KENAnimal alloc] initWithSpecies:@"unknownspecies" Gender:male Weight:0];
    return animal;
}

-(void)makeNoise
{
    NSString * genderStr;
    if(self.gender == male)
        genderStr = @"male";
    else
        genderStr = @"female";
    NSLog(@"我是一只%@ %@, 体重%li千克", genderStr, self.species, self.weight);
}

@end
