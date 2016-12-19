//
//  CookCell.swift
//  SwiftProject
//
//  Created by 赵英奎 on 10/5/6.
//  Copyright © 2010年 赵英奎. All rights reserved.
//

import UIKit

class CookCell: UITableViewCell {
    
    var cm: CookModel? {
        //监听cm属性被设置的值
        didSet {
            self.nameLb.text = cm?.name
            self.headImage.sd_setImage(with: URL(string: (cm?.imageFilename)!), placeholderImage: UIImage(named: "Home-More.png"))
            
            let array = cm?.vegetableList
    
            //左侧数据
            let dict = array?.object(at: 0)
            self.leftLb.text = dict!["name"] as? String
            let url = dict!["imagePathThumbnails"] as? String
            self.leftImage.sd_setImage(with: URL(string: url!), placeholderImage: UIImage(named: "Home-More.png"))
            
           
            //中间数据
            let dict2 = array?.object(at: 1)
            self.middleLb.text = dict2!["name"] as? String
            let url2 = dict2!["imagePathThumbnails"] as? String
            self.middleImage.sd_setImage(with: URL(string: url2!), placeholderImage: UIImage(named: "Home-More.png"))
            
            
            //右侧数据
            
            let dict3 = array?.object(at: 2)as? NSDictionary
//            self.rightLb.text = dict3!["name"] as? String
            self.rightLb.text=dict3!["name"]as?String
            let url3 = dict3!["imagePathThumbnails"]as? String
            self.rightImage.sd_setImage(with: URL(string: url3!), placeholderImage: UIImage(named: "Home-More.png"))
        
        }
        
    }
    
    
    @IBOutlet weak var nameLb: UILabel!

    @IBOutlet weak var headImage: UIImageView!
    
    
    @IBOutlet weak var leftImage: UIImageView!
    
    @IBOutlet weak var middleImage: UIImageView!
    
    
    @IBOutlet weak var rightImage: UIImageView!
    
    
    @IBOutlet weak var leftLb: UILabel!
    
    
    @IBOutlet weak var rightLb: UILabel!
    @IBOutlet weak var middleLb: UILabel!
    
    
    
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
