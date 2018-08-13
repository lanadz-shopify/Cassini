//
//  ImagegViewController.swift
//  Cassini
//
//  Created by Svitlana Dzyuban on 11/8/18.
//  Copyright © 2018 Lana Dzyuban. All rights reserved.
//

import UIKit

class ImagegViewController: UIViewController, UIScrollViewDelegate {
    var imageView = UIImageView()

    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.minimumZoomScale = 1/25
            scrollView.maximumZoomScale = 1.0
            scrollView.delegate = self
            scrollView.addSubview(imageView)
        }
    }
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    var imageURL: URL? {
        didSet {
            image = nil
            if view.window != nil { // check if view is on screen
                print("imageURL didSet")
                fetchImage()
            }
        }
    }

    private var image: UIImage? {
        get {
            return imageView.image
        }
        set {
            imageView.image = newValue
            imageView.sizeToFit()
            scrollView?.contentSize = imageView.frame.size
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
                image = UIImage(data: imageData)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
//        if imageURL == nil {
//            imageURL = DemoURLs.stanford
//        }
    }
}
