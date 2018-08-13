//
//  CassiniViewController.swift
//  Cassini
//
//  Created by Svitlana Dzyuban on 13/8/18.
//  Copyright © 2018 Lana Dzyuban. All rights reserved.
//

import UIKit

class CassiniViewController: UIViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if let url = DemoURLs.NASA[identifier] {
                var destination = segue.destination
                if let navcontroller = destination as? UINavigationController {
                    destination = navcontroller.visibleViewController ?? navcontroller
                }
                if let imageViewController = destination as? ImagegViewController {
                    imageViewController.imageURL = url
                    imageViewController.title = (sender as? UIButton)?.currentTitle
                }
            }
        }
    }
}
