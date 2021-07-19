//
//  ContactsViewController.swift
//  LearnMVVM
//
//  Created by SERGEY VOROBEV on 19.07.2021.
//

import UIKit

class ContactsViewController: UITableViewController {
    
    lazy var viewModel = ContactsViewModel(contactsService: ContactsService())

    override func viewDidLoad() {
        super.viewDidLoad()
  
        initViewModel()
    }
    
    private func initViewModel() {
        viewModel.fetchContacts()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.contactTableCellViewModels.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ContactTableViewCell else {
            fatalError("Cell not exists")
        }

        let cellViewModel = viewModel.getCellViewModel(at: indexPath)
        
        cell.cellViewModel = cellViewModel

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(identifier: "detailsVC") as? DetailsViewController else { return }
        
        vc.viewModel = viewModel.viewModelForSelectedContact(for: indexPath)

        navigationController?.pushViewController(vc, animated: true)
    }
}
