//
//  ViewController.swift
//  ManualParsingApp
//
//  Created by Вячеслав Кремнев on 08.03.2022.
//

import UIKit

class InfoViewController: UIViewController {
    
    @IBOutlet weak var postCodeLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var countryAbbreviationLabel: UILabel!
    @IBOutlet weak var placeNameLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var stateAbbreviationLabel: UILabel!
    @IBOutlet weak var latitudeLabel: UILabel!
    
    @IBOutlet weak var labelsStackView: UIStackView!
    @IBOutlet weak var getInfoButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelsStackView.layer.cornerRadius = 10
        getInfoButton.layer.cornerRadius = 10
    }
    
    
    @IBAction func getZipCodeInfoButton() {
        
        NetworkManager.shared.fetchZipInfo { zip in
            self.postCodeLabel.text = zip.first?.postCode
            self.countryLabel.text = zip.first?.country
            self.countryAbbreviationLabel.text = zip.first?.countryAbbreviation
            self.placeNameLabel.text = zip.first?.places?.placeName
            self.longitudeLabel.text = zip.first?.places?.longitude
            self.stateLabel.text = zip.first?.places?.state
            self.stateAbbreviationLabel.text = zip.first?.places?.stateAbbreviation
            self.latitudeLabel.text = zip.first?.places?.latitude
        }
    }
}





