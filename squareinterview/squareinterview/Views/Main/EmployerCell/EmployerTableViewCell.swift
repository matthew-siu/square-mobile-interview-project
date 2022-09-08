//
//  EmployerTableViewCell.swift
//  squareinterview
//
//  Created by Matthew Siu on 6/9/2022.
//

import UIKit
import Kingfisher

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
        
        if let photoPath = item.photoPath, let url = URL(string: photoPath){
            // image loader - without cache
//            self.imgView.loadImage(at: url)
            
//            // kingfisher -
            self.imgView.kf.setImage(
                with: url,
                placeholder: UIImage(named: "user"),
                options: [.cacheMemoryOnly]
            ) { result in
                switch result{
                case .success(let value):
                    print("Load img for: \(value.cacheType)")
                case .failure(let error):
                    print("Load img failed: \(error.localizedDescription)")
                }
            }
        }
    }
    
    override func prepareForReuse() {
//        imgView.image = nil
//        imgView.cancelImageLoad()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
