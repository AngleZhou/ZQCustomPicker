//
//  ViewController.m
//  ZQCustomPicker
//
//  Created by Qian Zhou on 15/8/13.
//  Copyright (c) 2015年 Qian Zhou. All rights reserved.
//

#import "ViewController.h"
#import "ZQCustomDataPicker.h"

@interface ViewController () <ZQCustomDataPickerDelegate, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UILabel *normalPicker;
@property (weak, nonatomic) IBOutlet UILabel *normalDatePicker;
@property (weak, nonatomic) IBOutlet UILabel *nullableDatePicker;
@property (weak, nonatomic) IBOutlet UILabel *normalPickerHasNoToolbar;
@property (weak, nonatomic) IBOutlet UILabel *addressPicker;

@property (weak, nonatomic) IBOutlet UITextField *textField;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.normalPicker.userInteractionEnabled = YES;
    self.normalDatePicker.userInteractionEnabled = YES;
    self.nullableDatePicker.userInteractionEnabled = YES;
    self.normalPickerHasNoToolbar.userInteractionEnabled = YES;
    self.addressPicker.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(normalPicker:)];
    [self.normalPicker addGestureRecognizer:tap1];
    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(normalDatePicker:)];
    [self.normalDatePicker addGestureRecognizer:tap2];
    UITapGestureRecognizer *tap3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(nullableDatePicker:)];
    [self.nullableDatePicker addGestureRecognizer:tap3];
    UITapGestureRecognizer *tap4 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(normalPickerHasNoToolbar:)];
    [self.normalPickerHasNoToolbar addGestureRecognizer:tap4];
    UITapGestureRecognizer *tap5 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(addressPicker:)];
    [self.addressPicker addGestureRecognizer:tap5];
    
    self.textField.delegate = self;
    NSArray *dataSource = @[@[@"A型", @"B型", @"AB型", @"O型"], @[@"Rh阳性", @"Rh阴性"]];
    ZQCustomDataPicker *picker = [[ZQCustomDataPicker alloc] initPickerViewWithArray:dataSource andInitSelection:nil isDecorationView:YES];
    picker.delegate = self;
    picker.tag = 999;
    picker.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:1.0];
    self.textField.inputView = picker;
    
    UITapGestureRecognizer *backgroundTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapBackground)];
    [self.view addGestureRecognizer:backgroundTap];
}

- (void)normalPicker:(id)sender {
    NSArray *dataSource = @[@[@"A型", @"B型", @"AB型", @"O型"], @[@"Rh阳性", @"Rh阴性"]];
    ZQCustomDataPicker *picker = [[ZQCustomDataPicker alloc] initPickerViewWithArray:dataSource];
    picker.delegate = self;
    picker.tag = 998;
    [picker showInView:self.view];
}

- (void)normalDatePicker:(id)sender {
    ZQCustomDataPicker *picker = [[ZQCustomDataPicker alloc] initDatePickerWithDate:[NSDate date]];
    picker.delegate = self;
    [picker showInView:self.view];
}
- (void)nullableDatePicker:(id)sender {
    ZQCustomDataPicker *picker = [[ZQCustomDataPicker alloc] initNullableDatePicker];
    picker.delegate = self;
    [picker showInView:self.view];
}


- (void)normalPickerHasNoToolbar:(id)sender {
    NSArray *dataSource = @[@[@"A型", @"B型", @"AB型", @"O型"], @[@"Rh阳性", @"Rh阴性"]];
    ZQCustomDataPicker *picker = [[ZQCustomDataPicker alloc] initPickerViewWithArray:dataSource andInitSelection:nil isDecorationView:NO hasToolbar:NO];
    picker.delegate = self;
    [picker showInView:self.view];
}

- (void)addressPicker:(id)sender {
    NSArray *selection = nil;
    NSArray *initArray = nil;
    if (![self.addressPicker.text isEqualToString:@"address picker"]) {
        selection = [self.addressPicker.text componentsSeparatedByString:@" "];
    }
    
    if (selection.count == 2) {
        initArray = @[selection[0], selection[1], selection[1]];
    } else if (selection.count == 1) {
        initArray = @[selection[0], selection[0], selection[0]];
    } else {
        initArray = selection;
    }
    ZQCustomDataPicker *picker = [[ZQCustomDataPicker alloc] initAddressPickerWithInitSelection:initArray];
    picker.delegate = self;
    [picker showInView:self.view];
}

#pragma mark - Custom Data Picker delegate

- (void)customPickerViewDoneBtnClicked:(ZQCustomDataPicker *)pickerView resultArray:(NSArray *)resultArray resultString:(NSString *)resultString {
    if (pickerView.type == ZQCustomDataPickerTypeDate) {
        NSDate *date = resultArray[0];
        NSString *dateString = [date description];
        self.normalDatePicker.text = dateString;
    }
    if (pickerView.type == ZQCustomDataPickerTypeNormal) {
        if (pickerView.tag == 999) {
            self.textField.text = resultString;
        } else {
            self.normalPicker.text = resultString;
        }
        
    }
    if (pickerView.type == ZQCustomDataPickerTypeNullable) {
        NSInteger year = [resultArray[0] integerValue];
        NSInteger month = [resultArray[1] integerValue];
        NSInteger day = [resultArray[2] integerValue];
        NSString *date = [NSString stringWithFormat:@"%ld-%02ld-%02ld", year, month, day];
        self.nullableDatePicker.text = date;
    }
    if (pickerView.type == ZQCustomDataPickerTypeAddress) {
        if ([resultArray[0] isEqualToString:resultArray[1]] && [resultArray[1] isEqualToString:resultArray[2]]) {
            self.addressPicker.text = [NSString stringWithFormat:@"%@", resultArray[0]];
        } else if ([resultArray[1] isEqualToString:resultArray[2]]) {
            self.addressPicker.text = [NSString stringWithFormat:@"%@ %@", resultArray[0], resultArray[1]];
        } else {
            self.addressPicker.text = [NSString stringWithFormat:@"%@ %@ %@", resultArray[0], resultArray[1], resultArray[2]];
        }
        
    }
    
}

- (void)customPickerView:(UIPickerView *)pickerView didSelectWithResultArray:(NSArray *)resultArray ResultString:(NSString *)resultString {
    self.normalPickerHasNoToolbar.text = resultString;
}

- (void)customPicerShouldDisappear {
    [self.textField resignFirstResponder];
}

#pragma mark - Text Field Delegate
- (void)tapBackground {
    if ([self.textField isFirstResponder]) {
        [self.textField resignFirstResponder];
    }
}

@end
