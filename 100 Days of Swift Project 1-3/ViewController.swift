//
//  ViewController.swift
//  100 Days of Swift Project 1-3
//
//  Created by Seb Vidal on 15/11/2021.
//

import UIKit

class ViewController: UITableViewController {

    var countries: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries = ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FlagCell", for: indexPath)
        
        let image = cell.viewWithTag(1) as! UIImageView
        image.image = UIImage(named: countries[indexPath.row])
        image.layer.cornerCurve = .continuous
        image.layer.cornerRadius = 5
        image.layer.borderWidth = 1
        image.layer.borderColor = UIColor.lightGray.cgColor
        
        let label = cell.viewWithTag(2) as! UILabel
        label.text = countries[indexPath.row].countryCase()
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let detailViewController = storyboard?.instantiateViewController(withIdentifier: "DetailView") as? DetailViewController {
            detailViewController.selectedImage = countries[indexPath.row]
            detailViewController.selectedCountry = countries[indexPath.row]
            
            navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
    
}

extension String {
    func countryCase() -> String {
        if self.count <= 2 {
            return self.uppercased(with: .current)
        } else{
            return self.capitalized
        }
    }
}
