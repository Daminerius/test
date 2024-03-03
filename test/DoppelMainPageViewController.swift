//
//  DoppelMainPageViewController.swift
//  test
//
//  Created by Mac mini on 03.03.2024.
//
import Foundation
import UIKit


class DoppelMainPageViewController: UIViewController {
    
    var isLiked: Bool = false
    
    
    
    private let vkPostView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        return view
    }()
    
    private let avatarImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 2.0
        view.layer.masksToBounds = false
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.cornerRadius = 75/2
        view.clipsToBounds = true
        view.image = UIImage(named: "avatarBulka")
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    private let photoImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "photoBulka")
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Булка Вакуленко"
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = DateFormatter.localizedString(from: Date(), dateStyle: .long, timeStyle: .none)
        return label
    }()
    
    private let likeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .lightGray
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.layer.cornerRadius = 10
        button.setTitleColor(.white, for: .normal)
        button.tintColor = .white
        
        return button
    }()
    
    private let shareButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 10
        button.tintColor = .white
        button.setImage(UIImage(systemName:"arrowshape.turn.up.right"), for: .normal)
        
        return button
    }()
    
    private let switchToHomeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemRed
        button.layer.cornerRadius = 10
        button.tintColor = .white
        button.setTitle("To home", for: .normal)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.view.backgroundColor = .lightGray
        
        setupSubviews()
        setupConstraints()
        setupActions()
    }
    
    
    func setupConstraints() {
        self.vkPostView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        self.vkPostView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        self.vkPostView.heightAnchor.constraint(equalToConstant: 400).isActive = true
        self.vkPostView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        self.avatarImageView.topAnchor.constraint(equalTo: vkPostView.topAnchor, constant: 8).isActive = true
        self.avatarImageView.leftAnchor.constraint(equalTo: vkPostView.leftAnchor, constant: 8).isActive = true
        self.avatarImageView.widthAnchor.constraint(equalToConstant: 75).isActive = true
        self.avatarImageView.heightAnchor.constraint(equalToConstant: 75).isActive = true
        
        self.photoImageView.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 8).isActive = true
        self.photoImageView.leftAnchor.constraint(equalTo: vkPostView.leftAnchor).isActive = true
        self.photoImageView.rightAnchor.constraint(equalTo: vkPostView.rightAnchor).isActive = true
        self.photoImageView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        
        self.usernameLabel.topAnchor.constraint(equalTo: vkPostView.topAnchor, constant: 16).isActive = true
        self.usernameLabel.leftAnchor.constraint(equalTo: avatarImageView.rightAnchor, constant: 8).isActive = true
        
        self.dateLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 16).isActive = true
        self.dateLabel.leftAnchor.constraint(equalTo: avatarImageView.rightAnchor, constant: 8).isActive = true
        
        self.likeButton.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: 12).isActive = true
        self.likeButton.leadingAnchor.constraint(equalTo: vkPostView.leadingAnchor, constant: 8).isActive = true
        self.likeButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        self.likeButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        self.shareButton.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: 12).isActive = true
        self.shareButton.leadingAnchor.constraint(equalTo: likeButton.trailingAnchor, constant: 16).isActive = true
        self.shareButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        self.shareButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        self.switchToHomeButton.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: 12).isActive = true
        self.switchToHomeButton.leadingAnchor.constraint(equalTo: shareButton.trailingAnchor, constant: 16).isActive = true
        self.switchToHomeButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 50).isActive = true
        self.switchToHomeButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    
    func setupSubviews() {
        view.addSubview(vkPostView)
        view.addSubview(avatarImageView)
        view.addSubview(photoImageView)
        view.addSubview(usernameLabel)
        view.addSubview(dateLabel)
        view.addSubview(likeButton)
        view.addSubview(shareButton)
        view.addSubview(switchToHomeButton)
    }
    
    
    func setupActions() {
        likeButton.addTarget(self, action: #selector(onLikeButtonTap), for: .touchUpInside)
        shareButton.addTarget(self, action: #selector(onShareButtonTap), for: .touchUpInside)
        
        
    }
    
    @objc func onShareButtonTap() {
        let message = "share something"
        
        if let link = NSURL(string: "http://yoururl.com")
        {
            let objectsToShare = [message,link] as [Any]
            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            activityVC.excludedActivityTypes = [UIActivity.ActivityType.airDrop, UIActivity.ActivityType.addToReadingList]
            self.present(activityVC, animated: true, completion: nil)
        }
    }
    
    @objc func onLikeButtonTap() {
        isLiked = !isLiked
        
        likeButton.backgroundColor = isLiked ? .red : .lightGray
        if !isLiked == true
        {
            likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
            likeButton.setTitle("", for: .normal)
        } else {
            likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            likeButton.setTitle("1", for: .normal)
        }
            
        
        
    }

}
