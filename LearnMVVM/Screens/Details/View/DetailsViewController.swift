//
//  DetailsViewController.swift
//  LearnMVVM
//
//  Created by SERGEY VOROBEV on 19.07.2021.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var secondNameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    var viewModel: DetailsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let viewModel = viewModel else { return }
        
        viewModel.contact.bind { [unowned self] contact in
            guard let contact = contact else { return }
            
            self.firstNameLabel.text = contact.firstName
            self.secondNameLabel.text = contact.lastName
            self.ageLabel.text = String(describing: contact.age)
        }
    }
}
