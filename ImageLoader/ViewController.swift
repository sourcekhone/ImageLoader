//
//  ViewController.swift
//  ImageLoader
//
//  Created by Mahdi Mahjoobe on 1/2/19.
//  Copyright © 2019 Mahdi Mahjoobe. All rights reserved.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {

    @IBOutlet weak var imageKF: UIImageView!
    @IBOutlet weak var linkTxtfield: UITextField!
    @IBOutlet weak var downloadBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageKF.layer.cornerRadius = 5
        imageKF.layer.borderWidth = 1
        imageKF.layer.borderColor = UIColor.black.cgColor
        
        linkTxtfield.layer.cornerRadius = 5
        linkTxtfield.layer.borderWidth = 1
        linkTxtfield.layer.borderColor = UIColor.black.cgColor
        
        downloadBtn.layer.cornerRadius = 5
        
        loadImage()
    }
    
    
    @IBAction func downloadImage(_ sender: UIButton) {
        if let text = linkTxtfield.text {
            loadImage(url: text)
        }
    }
    
    
    func loadImage(url: String = "https://www.sourcekhone.com/wp-content/uploads/2018/05/Untitled-1.png") {
        if url.count > 0 {
            if let link = URL(string: url.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)!) {
                let resource = ImageResource(downloadURL: link)
                
                imageKF.kf.indicatorType = .activity
                imageKF.kf.setImage(with: resource)
            }
        }
    }


    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        if let text = linkTxtfield.text {
            loadImage(url: text)
        }
        return true
    }
    
}

