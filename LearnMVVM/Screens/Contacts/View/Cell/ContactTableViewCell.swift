//
//  ContactTableViewCell.swift
//  LearnMVVM
//
//  Created by SERGEY VOROBEV on 19.07.2021.
//

import UIKit

class ContactTableViewCell: UITableViewCell {
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    var cellViewModel: ContactTableCellViewModel? {
        didSet {
            guard let cellViewModel = cellViewModel else { return }
            
            fullNameLabel.text = cellViewModel.fullName
            ageLabel.text = "\(String(describing: cellViewModel.age))"
        }
    }
}
