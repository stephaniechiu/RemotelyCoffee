//
//  CoffeeTableViewCell.swift
//  RemotelyCoffee
//
//  Created by Stephanie on 2/15/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

import UIKit
import AlamofireImage

class CoffeeTableViewCell: UITableViewCell {
    @IBOutlet weak var coffeeShopImageView: UIImageView!
    @IBOutlet weak var makerImageView: UIImageView!
    @IBOutlet weak var coffeeShopNameLabelMain: UILabel!
    @IBOutlet weak var locationLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(with viewModel: CoffeeShopListViewModel) {
        coffeeShopImageView.af_setImage(withURL: viewModel.imageUrl)
        coffeeShopNameLabelMain.text = viewModel.name
        locationLabel.text = viewModel.distance
    }
}
