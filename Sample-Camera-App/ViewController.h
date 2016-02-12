//
//  ViewController.h
//  Sample-Camera-App
//
//  Created by Appmonkeyz on 2/12/16.
//  Copyright © 2016 Appmonkeyz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@property (weak,nonatomic) IBOutlet UIImageView *image;

@end

