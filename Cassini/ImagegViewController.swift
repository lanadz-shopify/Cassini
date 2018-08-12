//
//  ImagegViewController.swift
//  Cassini
//
//  Created by Svitlana Dzyuban on 11/8/18.
//  Copyright © 2018 Lana Dzyuban. All rights reserved.
//

import UIKit

class ImagegViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!

    var imageURL: URL? {
        didSet {
            imageView.image = nil
            if view.window != nil { // check if view is on screen
                print("imageURL didSet")
                fetchImage()
            }
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if imageView.image == nil {
            fetchImage()
        }
    }

    private func fetchImage()  {
        if let url = imageURL {
            let urlContents = try? Data(contentsOf: url)
            if let imageData = urlContents {
                imageView.image = UIImage(data: imageData)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        if imageURL == nil {
            imageURL = DemoURLs.stanford
        }
    }
}
