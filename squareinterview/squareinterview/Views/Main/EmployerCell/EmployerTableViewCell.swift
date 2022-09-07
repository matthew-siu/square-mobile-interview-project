//
//  EmployerTableViewCell.swift
//  squareinterview
//
//  Created by Matthew Siu on 6/9/2022.
//

import UIKit

class EmployerTableViewCell: UITableViewCell {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var teamLabel: UILabel!
    
    var onReuse: () -> Void = {}
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupUI(item: Main.ViewModel.Cell){
        self.imgView.backgroundColor = .lightGray.withAlphaComponent(0.2)
        self.imgView.layer.cornerRadius = 5
        self.nameLabel.text = item.name
        self.teamLabel.text = item.team
    }
    
    override func prepareForReuse() {
        imgView.image = nil
        imgView.cancelImageLoad()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
