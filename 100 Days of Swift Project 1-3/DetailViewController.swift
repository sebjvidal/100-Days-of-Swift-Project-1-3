//
//  DetailViewController.swift
//  100 Days of Swift Project 1-3
//
//  Created by Seb Vidal on 15/11/2021.
//

import UIKit

class DetailViewController: UIViewController {

    var selectedImage = ""
    var selectedCountry = ""
    
    @IBOutlet var image: UIImageView!
    @IBOutlet var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.largeTitleDisplayMode = .never
        
        image.image = UIImage(named: selectedImage)
        image.layer.borderWidth = 1
        image.layer.borderColor = UIColor.black.cgColor
        label.text = selectedCountry.countryCase()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
    }

    @objc func shareTapped() {
        guard let flag = UIImage(named: selectedCountry) else {
            return
        }
        
        let message = "This is the flag of \(selectedCountry.countryCase())!"
        
        let viewController = UIActivityViewController(activityItems: [flag, message], applicationActivities: [])
        viewController.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(viewController, animated: true)
    }
    
}
