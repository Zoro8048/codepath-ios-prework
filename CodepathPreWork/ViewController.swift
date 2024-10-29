//
//  ViewController.swift
//  CodepathPreWork
//
//  Created by Keerthan Nandigama on 10/28/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var changeTextColor: UIButton!
    @IBOutlet weak var changeBackgroundColor: UIButton!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var university: UILabel!
    @IBOutlet weak var aspirationalJob: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
    func changeColor(alpha: CGFloat = 0.5) -> UIColor {
        let red = CGFloat.random(in: 0...1)
        let green = CGFloat.random(in: 0...1)
        let blue = CGFloat.random(in: 0...1)
        
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadImageOnUI()
        
    }
    
    func loadImageOnUI() {
        let imageURL = "https://media.licdn.com/dms/image/v2/C4D03AQEVS2GHVJxoJw/profile-displayphoto-shrink_200_200/profile-displayphoto-shrink_200_200/0/1654068035787?e=1735776000&v=beta&t=IvIoMcKgUx4Ijn0W9231vRS5GAt0ZrYelvUHXGRFTFg"
        
        if let url = URL(string: imageURL) {
            loadImage(from: url)
        }
        
    }
    
    func loadImage(from url: URL) {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            // Ensure there is data and no error
            guard let data = data, error == nil else {
                print("Error loading image: \(String(describing: error))")
                return
            }
            // Set the image on the main thread
            DispatchQueue.main.async {
                self.profileImage.image = UIImage(data: data)
                self.profileImage.layer.cornerRadius = 25
                self.profileImage.clipsToBounds = true
            }
        }
        task.resume()
    }
    
    
    @IBAction func changeBackgroundColorTapped(_ sender: UIButton) {
        let randomColor = changeColor()
        view.backgroundColor = randomColor
    }
    
    @IBAction func changeTextColorTapped(_ sender: Any) {
        let randomColor = changeColor(alpha: 1.0)
        name.textColor = randomColor
        university.textColor = randomColor
        aspirationalJob.textColor = randomColor
    }
    
}

