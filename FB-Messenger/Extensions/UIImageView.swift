//
//  UIImageView.swift
//  FB-Messenger
//
//  Created by Anish Manandhar on 27/06/2021.
//

import Foundation
import UIKit

private let cache = NSCache<NSNumber, UIImage>()
private var cacheURLs:[URL] = []
private let utilityQueue = DispatchQueue.global(qos: .utility)

extension UIImageView {
    
    func load(url: URL) {
        if let index = cacheURLs.firstIndex(of: url), let cachedImage = cache.object(forKey: NSNumber(value: index))  {
            self.image = cachedImage
        }
        else {
            utilityQueue.async { [weak self] in
                if let data = try? Data(contentsOf: url) {
                    if let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            self?.image = image
                            
                            cacheURLs.append(url)
                            cache.setObject(image, forKey: cacheURLs.firstIndex(of: url)! as NSNumber)
                        }
                    }
                }
            }
        }
    }
}
