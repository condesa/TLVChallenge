//
//  TLVDetailCell.swift
//  TLVChallenge
//
//  Created by Aurora Rodríguez on 9/3/18.
//  Copyright © 2018 Aurora Rodríguez. All rights reserved.
//

import UIKit

class TLVDetailCell: UITableViewCell {
  @IBOutlet weak var tagLabel: UILabel!
  @IBOutlet weak var tagMeaningLabel: UILabel!
  @IBOutlet weak var tagValueLabel: UILabel!
  
  var model: TLVModel? {
    didSet {
      if let model = model {
        tagLabel.text = model.displayTag.uppercased()
        tagMeaningLabel.text = model.displayMeaning
        tagValueLabel.text = model.displayValue
      }
    }
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    selectionStyle = .none
    backgroundColor = .clear
  }
}
