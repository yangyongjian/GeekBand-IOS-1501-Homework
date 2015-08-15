//
//  ViewController.m
//  BL_testForOC
//
//  Created by ken on 15/8/10.
//  Copyright (c) 2015年 ken. All rights reserved.
//

#import "ViewController.h"
#import "KENAnimal.h"
#import "KenBird.h"
#import "KENFish.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    KENAnimal* tempAnimal = [[KENAnimal alloc]initWithSpecies:@"lion" Gender:male Weight:150];
    
    NSLog(@"create a %@", [tempAnimal species]);
    [tempAnimal makeNoise];
    
    KENAnimal* newAnimal = [KENAnimal alloc];
    [newAnimal makeNoise];
    newAnimal.species = @"tiger";
    newAnimal.gender = female;
    newAnimal.weight = 200;
    [newAnimal makeNoise];
    
    KENAnimal* anotherAniaml = [KENAnimal CreateAnimal];
    [anotherAniaml setSpecies:newAnimal.species];
    [anotherAniaml setGender:male];
    [anotherAniaml setWeight:300];
    NSLog(@"another %@ is created, but a %d one!", anotherAniaml.species, anotherAniaml.gender);
    
    NSArray * birdsNameArray =[[NSArray alloc]initWithObjects: @"parrot", @"eagle", @"swallow", @"dove", @"swan", @"sparrow", @"crow", @"chicken", @"duck", @"woodpecker", nil];
    
    NSArray * fishNameArray = [[NSArray alloc]initWithObjects:@"shark", @"nemo", @"catfish", @"tuna", @"goldfish", @"salmon", @"piranha", @"eel", @"herrling", @"marlin", nil];
    
    NSMutableArray * animalArray = [NSMutableArray array];
    for(int i = 0; i < 10; ++i)
    {
        NSUInteger randNum = arc4random();
        KenBird * tempBird = [[KenBird alloc] initWithSpecies:birdsNameArray[randNum % 9] Gender:(GenderType)(randNum % 2) Weight:(randNum % 5)];
        switch (randNum % 3) {
            case 0:
                tempBird.color = [UIColor whiteColor];
                break;
                
            case 1:
                tempBird.color = [UIColor blackColor];
                break;
                
            case 2:
                tempBird.color = [UIColor grayColor];
                
            default:
                tempBird.color = [UIColor yellowColor];
                break;
        }
        
        KENFish * tempFish = [[KENFish alloc] initWithSpecies:fishNameArray[randNum % 9] Gender:(GenderType)(randNum % 2) Weight:(randNum % 10)];
        switch (randNum % 3) {
            case 0:
                tempFish.color = [UIColor blueColor];
                break;
                
            case 1:
                tempFish.color = [UIColor redColor];
                break;
                
            case 2:
                tempFish.color = [UIColor purpleColor];
                
            default:
                tempFish.color = [UIColor orangeColor];
                break;
        }
        if(randNum % 2 == 0)
        {
            [animalArray addObject:tempBird];
            [animalArray addObject:tempFish];
        }
        else
        {
            [animalArray addObject:tempFish];
            [animalArray addObject:tempBird];
        }
    }
    
    for(id tempObject in animalArray)
    {
        if([[tempObject class]isSubclassOfClass:[KenBird class]])
            [(KenBird *)tempObject Fly];
        else if([[tempObject class]isSubclassOfClass:[KENFish class]])
            [(KENFish *)tempObject Swim];
    }
    
    NSUInteger catchFishNum = 0;
    NSUInteger shootBirdNum = 0;
    NSUInteger aniamlReduceNum = arc4random() % 20 + 1;
    NSUInteger i = 0;
    while(i < aniamlReduceNum)
    {
        NSUInteger tempIndex = arc4random() % (20 - i);
        if([[animalArray[tempIndex] class] isSubclassOfClass:[KENFish class]])
        {
            [animalArray removeObjectAtIndex:tempIndex];
            ++catchFishNum;
            ++i;
        }
        else if([[animalArray[tempIndex] class] isSubclassOfClass:[KenBird class]])
        {
            [animalArray removeObjectAtIndex:tempIndex];
            ++shootBirdNum;
            ++i;
        }
    }
    NSLog(@"congratulations! You get %li fish, %li birds!", catchFishNum, shootBirdNum);
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
