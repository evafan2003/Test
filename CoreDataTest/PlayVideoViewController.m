//
//  PlayVideoViewController.m
//  CoreDataTest
//
//  Created by EMCC on 16/8/17.
//  Copyright © 2016年 com.mosh. All rights reserved.
//

#import "PlayVideoViewController.h"


@interface PlayVideoViewController ()

//@property (nonatomic,strong) MPMoviePlayerViewController *moviePlayer;

@end

@implementation PlayVideoViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];

    
}

//获取视频封面，本地视频，网络视频都可以用

//- (UIImage*) thumbnailImageForVideo:(NSURL *)videoURL {
//    
//    AVURLAsset *asset = [[AVURLAsset alloc] initWithURL:videoURL options:nil];
//    
//    AVAssetImageGenerator *gen = [[AVAssetImageGenerator alloc] initWithAsset:asset];
//    
//    gen.appliesPreferredTrackTransform = YES;
//    
//    CMTime time = CMTimeMakeWithSeconds(2.0, 600);
//    
//    NSError *error = nil;
//    
//    CMTime actualTime;
//    
//    CGImageRef image = [gen copyCGImageAtTime:time actualTime:&actualTime error:&error];
//    
//    UIImage *thumbImg = [[UIImage alloc] initWithCGImage:image];
//    
//    return thumbImg;
//    
//}

//本地视频播放

-(void)buttonEvent:(UIButton*)button

{

}

//网络视频播放

-(void)netEvent:(UIButton*)button

{
    
//    NSURL *moveURl = [NSURL URLWithString:@"http://124.232.154.173/youku/67774226A883683168CDDA659A/03000805005153359910D703BAF2B17CDDDAF7-77C8-0F5A-F0BC-6BD2DA2B0B00.mp4"];
//    
//    if (_moviePlayer==nil) {
//        
//        _moviePlayer = [[MPMoviePlayerViewController alloc]init];
//        
//    }
//    
//    _moviePlayer.moviePlayer.movieSourceType=MPMovieSourceTypeStreaming;
//    
//    [_moviePlayer.moviePlayer setContentURL:moveURl];
//    
//    [self presentMoviePlayerViewControllerAnimated:_moviePlayer];
//    
////    [_moviePlayer.moviePlayerplay];
//    [_moviePlayer.moviePlayer];
    
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    
}


@end
