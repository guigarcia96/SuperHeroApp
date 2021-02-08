//
//  UIImageView+URL.swift
//  SuperHero
//
//  Created by Guilherme Moraes on 29/01/21.
//

import UIKit

public extension UIImageView {
    func from(url: String, placeholder: UIImage? = nil) {
        image = placeholder
        guard let url = URL(string: url) else { return }
        let urlSession = URLSession.shared.dataTask(
            with: url,
            completionHandler: { (data, _, error) -> Void in
                guard error == nil, let data = data, let myImage = UIImage(data: data) else {
                    return
                }
                DispatchQueue.main.async { [weak self] in
                    guard let self = self else { return }
                    UIView.transition(
                        with: self,
                        duration: 2,
                        options: .transitionCrossDissolve,
                        animations: { [weak self] in
                            self?.image = myImage
                        },
                        completion: nil
                    )
                }
            }
        )
        urlSession.resume()
    }
}
