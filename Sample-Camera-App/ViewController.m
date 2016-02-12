//
//  ViewController.m
//  Sample-Camera-App
//
//  Created by Appmonkeyz on 2/12/16.
//  Copyright © 2016 Appmonkeyz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imagePicked;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)openCameraButton:(UIButton *)sender {
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        [picker setSourceType:UIImagePickerControllerSourceTypeCamera];
        picker.allowsEditing = false;
        [self presentViewController:picker animated:true completion:nil];
    }
}
- (IBAction)openPhotoLibraryButton:(UIButton *)sender {
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        [picker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
        picker.allowsEditing = true;
        [self presentViewController:picker animated:true completion:nil];
    }
}
- (IBAction)saveImageButton:(UIButton *)sender {
    NSData *imageData = UIImageJPEGRepresentation(_imagePicked.image, 0.6);
    UIImage *compressedJPGImage = [UIImage imageWithData:imageData];
    UIImageWriteToSavedPhotosAlbum(compressedJPGImage, nil, nil, nil);
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Wow" message:@"Your Image has been saved to Photo Library!" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"Okay" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
            
    [alertController addAction:action];
    [self presentViewController:alertController animated:YES completion:nil];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    _imagePicked.image = image;
    [self dismissViewControllerAnimated:true completion:nil];
}

@end
