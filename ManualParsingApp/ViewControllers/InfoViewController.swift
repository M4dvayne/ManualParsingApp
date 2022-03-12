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
            self.postCodeLabel.text = zip.postCode
            self.countryLabel.text = zip.country
            self.countryAbbreviationLabel.text = zip.countryAbbreviation
            self.placeNameLabel.text = zip.places?.first?.placeName
            self.longitudeLabel.text = zip.places?.first?.longitude
            self.stateLabel.text = zip.places?.first?.state
            self.stateAbbreviationLabel.text = zip.places?.first?.stateAbbreviation
            self.latitudeLabel.text = zip.places?.first?.latitude
        }
    }
}





