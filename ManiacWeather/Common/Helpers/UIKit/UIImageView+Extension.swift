//
//  UIImageView+Extension.swift
//  ManiacWeather
//
//  Created by Peter Lizak on 18/01/2020.
//  Copyright © 2020 Peter Lizak. All rights reserved.
//

import UIKit

let imageCache = NSCache<NSString, UIImage>()

extension UIImageView {

    func loadImageUsingCache(withUrl urlString: String, completion: ( () -> Void)? ) {
        let url = URL(string: urlString)
        if url == nil {return}
        self.image = nil

        // check cached image
        if let cachedImage = imageCache.object(forKey: urlString as NSString) {
            self.image = cachedImage
            completion?()
            return
        }

        // if not, download image from url
        URLSession.shared.dataTask(with: url!, completionHandler: { (data, _, error) in
            if error != nil {
                print(error!)
                return
            }
            DispatchQueue.main.async {
                if let image = UIImage(data: data!) {
                    imageCache.setObject(image, forKey: urlString as NSString)
                    self.image = image
                    completion?()
                }
            }

        }).resume()
    }

}
