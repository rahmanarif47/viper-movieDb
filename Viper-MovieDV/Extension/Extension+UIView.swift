//
//  Extension+UIView.swift
//  Viper-MovieDV
//
//  Created by Arif Rahman Sidik on 25/03/23.
//

import Foundation
import UIKit.UIView

extension UIView {
    
    enum LoadingPosition {
        case top
        case center
    }
    
    //MARK: - Magic number to show the widht and height of view
    static let loadingViewTag = 283982932
    static let loadingOverlayViewTag = 827162616
    
    func hideLoading() {
        let loadingIndicator = self.viewWithTag(UIView.loadingViewTag)
        let overlayView = self.viewWithTag(UIView.loadingOverlayViewTag)
        loadingIndicator?.removeFromSuperview()
        overlayView?.removeFromSuperview()
    }
    
    func showLoading(withOverlay: Bool = false, position : LoadingPosition = .center) {
        let overlay = UIView()
        overlay.backgroundColor = UIColor.black
        overlay.tag = UIView.loadingOverlayViewTag
        if withOverlay {
            self.addSubview(overlay)
            overlay.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                overlay.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
                overlay.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
                overlay.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
                overlay.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
            ])
        }
        
        let loadingContainer = UIView()
        loadingContainer.tag = UIView.loadingViewTag
        self.addSubview(loadingContainer)
        loadingContainer.translatesAutoresizingMaskIntoConstraints = false
        switch position {
        case .top:
            NSLayoutConstraint.activate([
                overlay.centerXAnchor.constraint(equalTo: centerXAnchor),
                overlay.centerYAnchor.constraint(equalTo: centerYAnchor),
                overlay.heightAnchor.constraint(equalToConstant: 40),
                overlay.widthAnchor.constraint(equalToConstant: 40)
            ])
        case .center:
            NSLayoutConstraint.activate([
                overlay.centerXAnchor.constraint(equalTo: centerXAnchor),
                overlay.centerYAnchor.constraint(equalTo: centerYAnchor),
                overlay.heightAnchor.constraint(equalToConstant: 40),
                overlay.widthAnchor.constraint(equalToConstant: 40)
            ])
        }
        
        #warning("style indicator can be include into parameter when show loading actived")
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.startAnimating()
        loadingContainer.addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            activityIndicator.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            activityIndicator.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            activityIndicator.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            activityIndicator.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
        ])
        
    }
}
