//
//  DetailsCoffeeView.swift
//  RemotelyCoffee
//
//  Created by Stephanie on 2/15/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

import UIKit
import MapKit

@IBDesignable class DetailsCoffeeView: BaseView {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var coffeeShopNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var hoursLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var ratingsLabel: UILabel!
    @IBOutlet weak var mapViewLabel: MKMapView!
    
    @IBAction func handleControl(_ sender: UIPageControl) {
        
    }
}
