//
//  NewViewController.swift
//  MyVK
//
//  Created by itisioslab on 22.09.17.
//  Copyright © 2017 itisioslab. All rights reserved.
//

import UIKit

class NewViewController: UITableViewController, UICollectionViewDelegate, UICollectionViewDataSource, DataTransferProtocol {

    //MARK: - Declaring variables
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameNavigationItem: UINavigationItem!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var numberOfFriendButton: UIButton!
    @IBOutlet weak var numberOfFollowersButton: UIButton!
    @IBOutlet weak var numberOfGroupsButton: UIButton!
    @IBOutlet weak var numberOfPhotoButton: UIButton!
    @IBOutlet weak var numberOfAudioButton: UIButton!
    @IBOutlet weak var numberOfVideoButton: UIButton!
    @IBOutlet weak var addEntryButton: UIButton!
    @IBOutlet weak var addPhotoButton: UIButton!
    @IBOutlet weak var addPlaceButton: UIButton!
    @IBOutlet weak var infoScrollView: UIScrollView!
    
    var user: User!
    var imagesArray = [UIImage(named: "fcrk-1"),UIImage(named: "fcrk-2"),UIImage(named: "fcrk-3"), UIImage(named: "fcrk-1")]
    var news = [News]()
    let newsTestImageArray = [UIImage(named: "fcrk-4")!, UIImage(named: "fcrk-5")!, UIImage(named: "fcrk-6")!]
    
    //MARK: - Constants
    
    let scrollWidth: CGFloat = 1000
    let borderWidth: CGFloat = 1
    let borderColour = UIColor.init(red:222/255.0, green:225/255.0, blue:227/255.0, alpha: 1.0).cgColor
    let navigationBarColor = UIColor.init(red: 89/255.0, green: 125/255.0, blue: 163/255.0, alpha: 1.0)
    let buttonWidth = 35
    let buttonHeight = 35
    let years = " years"
    let followersSegueIdentifier = "followersIdentifier"
    let ownInfoSegueIdentifier = "ownInfoIdentifier"
    let newsTestTextArray = ["Test1", "Test2", "Test3"]
    let newsTestLikesArray = ["10", "20", "30"]
    let newsTestCommentsArray = ["15", "25", "35"]
    let newsTestRepostsArray = ["12", "24", "36"]
    let newsTestDateArray = ["15 авг в 20:08", "15 авг в 20:15", "15 сент в 20:28", "18 дек в 20:11"]
    let newsCellIdentifier = "newsIdentifier"
    let cellNewsIdentifier = "cellNewsIdentifier"
    let newsCellHeight: CGFloat = 290
    let newsSequeIdentifier = "createNewsIdentifier"
    let imageCollectionCellIdentifier = "ImageCollectionViewCell"
    let newsCellClassi = "NewsTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarColorAndFont()
        user = createUser()
        setInfo(for: user)
        roundImage(for: avatarImageView)
        changeBorder(for: addPhotoButton)
        changeBorder(for: addEntryButton)
        changeBorder(for: addPlaceButton)
        infoScrollView.contentSize = CGSize(width: scrollWidth, height: infoScrollView.frame.size.height)
        changeBorder(for: infoScrollView)
        cellRegistration()
        randomTestNews()
    }
    
    //MARK: - Test methods
    func randomTestNews() {
        let testNews1 = News(name: nameLabel.text!, surname: surnameLabel.text!, date: newsTestDateArray[Int(arc4random_uniform(UInt32(newsTestDateArray.count)))], text: newsTestTextArray[0], image: newsTestImageArray[0], numberOfLikes: newsTestLikesArray[0], numberOfComments: newsTestCommentsArray[0], numberOfReposts: newsTestRepostsArray[0], avatar: user.avatar )
        let testNews2 = News(name: nameLabel.text!, surname: surnameLabel.text!, date: newsTestDateArray[Int(arc4random_uniform(UInt32(newsTestDateArray.count)))], text: newsTestTextArray[1], image: newsTestImageArray[1], numberOfLikes: newsTestLikesArray[1], numberOfComments: newsTestCommentsArray[1], numberOfReposts: newsTestRepostsArray[1], avatar: user.avatar )
        let testNews3 = News(name: nameLabel.text!, surname: surnameLabel.text!, date: newsTestDateArray[Int(arc4random_uniform(UInt32(newsTestDateArray.count)))], text: newsTestTextArray[2], image: newsTestImageArray[2], numberOfLikes: newsTestLikesArray[2], numberOfComments: newsTestCommentsArray[2], numberOfReposts: newsTestRepostsArray[2], avatar: user.avatar )
        
        news.append(testNews1)
        news.append(testNews2)
        news.append(testNews3)
    }
    
    //MARK: - My methods
    func roundImage(for image: UIImageView) {
        image.layer.cornerRadius = image.frame.size.width/2
        image.clipsToBounds = true
    }
    
    func changeBorder(for view: UIView) {
        view.layer.borderWidth = borderWidth
        view.layer.borderColor = borderColour
    }
    
    //MARK: - Create User
    
    func createUser() -> User {
        var user = UserInfo.createInfo()
        for _ in 0 ..< 10 {
            user.followers.append(UserInfo.createInfo())
        }
        return user 
    }
    
    func setInfo(for user: User) {
        avatarImageView.image = user.avatar
        nameNavigationItem.title = user.name
        nameLabel.text = user.name
        surnameLabel.text = user.surname
        ageLabel.text = String(user.age) + years
        cityLabel.text = user.city
    }
    
    //MARK: - Cells Registration
    
    func cellRegistration() {
        let newsCellNib = UINib(nibName: newsCellClassi, bundle: nil)
        tableView.register(newsCellNib, forCellReuseIdentifier: cellNewsIdentifier)
    }
    
    //MARK: - Table View Methods
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellNewsIdentifier) as! NewsTableViewCell
        let newsModel = news.reversed()[indexPath.row]
        cell.prepare(with: newsModel)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return newsCellHeight
    }
    
    //MARK: - Methods associated with Navigation Bar
    
    @IBAction func threeDotButton(_ sender: Any) {
        present(alertForShowStandartFunc(), animated: true, completion: nil)
    }
    
    func setNavigationBarColorAndFont(){
        navigationController?.navigationBar.barTintColor = navigationBarColor
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white]
        navigationController?.navigationBar.tintColor = UIColor.white
    }
    
    func didPressDone(with note: String) {
        let testNews = News(name: nameLabel.text!, surname: surnameLabel.text!,
                            date: newsTestDateArray[Int(arc4random_uniform(UInt32(newsTestDateArray.count)))],
                            text: note,
                            image: newsTestImageArray[Int(arc4random_uniform(UInt32(newsTestImageArray.count)))],
                            numberOfLikes: newsTestLikesArray[Int(arc4random_uniform(UInt32(newsTestLikesArray.count)))],
                            numberOfComments: newsTestCommentsArray[Int(arc4random_uniform(UInt32(newsTestCommentsArray.count)))],
                            numberOfReposts: newsTestRepostsArray[Int(arc4random_uniform(UInt32(newsTestRepostsArray.count)))],
                            avatar: user.avatar)
        news.append(testNews)
        tableView.reloadData()
    }
    
    //MARK: - Collection View Methods

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: imageCollectionCellIdentifier, for: indexPath) as! ImageCollectionViewCell
        
        cell.photoImageView.image = imagesArray[indexPath.row]
        return cell
    }
  
    // MARK: - Prepare methods
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == followersSegueIdentifier {
            let followersVC = segue.destination as! FollowersTableViewController
            followersVC.followers = user.followers
        }
        if segue.identifier == ownInfoSegueIdentifier {
            let ownInfoVC = segue.destination as! OwnInfoTableViewController
            ownInfoVC.nameUser = user.name
            ownInfoVC.surnameUser = user.surname
            ownInfoVC.avatarUser = user.avatar
            ownInfoVC.ageUser = String(user.age) + years
            ownInfoVC.cityUser = user.city
        }
        if segue.identifier == newsSequeIdentifier {
            let controller = segue.destination as! CreateNewsViewController
            controller.dataTransferDelagete = self
        }
    }
    
    
}
