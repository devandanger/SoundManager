//
//  SoundManagerExampleViewController.m
//  SoundManagerExample
//
//  Created by Nick Lockwood on 31/03/2011.
//  Copyright 2011 Charcoal Design. All rights reserved.
//

#import "SoundManagerExampleViewController.h"

@implementation SoundManagerExampleViewController

@synthesize switchTrackButton;
@synthesize trackIndex;

- (void)viewDidLoad
{
    [SoundManager sharedManager].allowsBackgroundMusic = YES;
    [[SoundManager sharedManager] prepareToPlay];
}

- (void)playMusic
{
    if (trackIndex == 0)
    {
        [[SoundManager sharedManager] playMusic:@"track1" looping:YES];
    }
    else
    {
        [[SoundManager sharedManager] playMusic:@"track2" looping:YES];
    }
}

- (IBAction)playPauseMusic:(UIButton *)sender
{
    if ([SoundManager sharedManager].playingMusic)
    {
        [[SoundManager sharedManager] stopMusic];
        [sender setTitle:@"Play Music" forState:UIControlStateNormal];
        switchTrackButton.enabled = NO;
        switchTrackButton.alpha = 0.5;
    }
    else
    {
        [self playMusic];
        [sender setTitle:@"Pause Music" forState:UIControlStateNormal];
        switchTrackButton.enabled = YES;
        switchTrackButton.alpha = 1.0;
    }
}

- (IBAction)switchTrack:(UIButton *)sender
{
    trackIndex ++;
    trackIndex = trackIndex % 2;
    [self playMusic];
}

- (IBAction)queueBothSounds:(id)sender
{
    [[SoundManager sharedManager] playSounds:@[@"sound1", @"sound2"] delays:@[@2]];
}

- (IBAction)playSound1:(UIButton *)sender
{
    [[SoundManager sharedManager] playSound:@"sound1" looping:NO];
}

- (IBAction)playSound2:(UIButton *)sender
{
    [[SoundManager sharedManager] playSound:@"sound2" looping:NO];
}

- (IBAction)setSoundVolume:(UISlider *)sender
{
    [SoundManager sharedManager].soundVolume = sender.value;
}

- (IBAction)setMusicVolume:(UISlider *)sender
{
    [SoundManager sharedManager].musicVolume = sender.value;
}

- (void)dealloc
{
    [switchTrackButton release];
    [super dealloc];
}

@end
