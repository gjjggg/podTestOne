//
//  JiHuoNiaoActionCellView.m
//  JIHuoNIaoDemo
//
//  Created by ooo on 2024/10/14.
//

#import "JiHuoNiaoActionCellView.h"


@interface JiHuoNiaoActionCellView ()
@property (nonatomic, strong) UIView *backView;
@property (nonatomic, strong) UIImageView *img;

@end

@implementation JiHuoNiaoActionCellView

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {

        self.backgroundColor = UIColor.clearColor;
        self.contentView.backgroundColor = UIColor.clearColor;
        
        self.backView = [[UIView alloc]init];
        self.backView.clipsToBounds = YES;
        self.backView.contentMode = UIViewContentModeScaleAspectFill;
        self.backView.layer.cornerRadius = 12;
        self.backView.backgroundColor = UIColor.whiteColor;
        [self.contentView addSubview:self.backView];
        self.backView.frame = CGRectMake(35, 0, SCREEN_WIDTH-35*2, 118);
       
        
        self.img = [UIImageView new];
        self.img.image = [UIImage imageNamed:@"img_dsk_cp"];
        self.img.frame = CGRectMake(jihuoniaoMYDistance(56), (118-jihuoniaoMYDistance(160))/2, jihuoniaoMYDistance(104) , jihuoniaoMYDistance(160));
        [self.backView addSubview:self.img];
       
        
        self.titleLable = [[UILabel alloc] initWithFrame:CGRectMake(jihuoniaoMYDistance(192), (118-50)/2, self.backView.frame.size.width-86-10, 50)];
        self.titleLable.textColor =AdSColor(97, 74, 66);
        self.titleLable.font =  jihuoniaoFontMakeRegular(22);
        [self.backView addSubview:self.titleLable];
    }
    return self;
}


@end
