//
//  BucketItemCellTableViewCell.swift
//  BucketListApp
//
//  Created by Jarman, Caroline on 11/30/18.
//  Copyright © 2018 ctec. All rights reserved.
//

import UIKit

class BucketItemCellTableViewCell: UITableViewCell
{

    @IBOutlet weak var bucketItemSymbol: UILabel!
    @IBOutlet weak var bucketItemText: UILabel!
    @IBOutlet weak var bucketItemSignature: UILabel!
    

    
    var currentBucketItem : BucketItem!
    {
      didSet
      {
            updateCellView()
      }
    }
    
    private func randomEmoji() -> String
    {
        let emojiStart = 0x1f601
        let emojiEnd = 0x1f64F
        let symbolStart = 0x1f680
        let symbolEnd = 0x1f6C5
        
        let emojiRange = 79
        let symbolRange = 70
        
        let ascii = emojiStart + Int(arc4random_uniform(UInt32(emojiRange)))
        let emoji = UnicodeScalar(ascii)?.description
        return emoji!
    }
    
    private func updateCellView() -> Void
    {
        if (currentBucketItem != nil)
        {
            bucketItemSignature.text = currentBucketItem.itemAuthor
            bucketItemText.text = currentBucketItem.itemContents
        }
        else
        {
            bucketItemSignature.text = "Author goes here"
            bucketItemText.text = "Bucket item contents here"
        }
        bucketItemSymbol.text = randomEmoji()
    }
    
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
