//
//  ViewController.swift
//  VK
//
//  Created by Elina on 11/09/2017.
//  Copyright © 2017 Elina. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource, DataTransferProtocol, ThreePointsButtonProtocol {
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var usersStatus: UILabel!
    
    @IBOutlet weak var ageAndCity: UILabel!
    
    @IBOutlet weak var userNameInToolBar: UINavigationItem!
    
    @IBOutlet weak var usersAvatar: UIImageView!
   
    @IBOutlet weak var informationButton: UIButton!

    @IBOutlet weak var photosCollectionView: UICollectionView!
    
    @IBOutlet weak var descriptionCollectionView: UICollectionView!
    
    @IBOutlet weak var photoArrow: UIButton!
    
    @IBOutlet weak var newsTableView: UITableView!
    
    var users: [User] = [User(name: "Элина", surname: "Батырова", avatar: UIImage.init(named: "Elina")!, photos: [UIImage.init(named: "heart")!], status: "online (моб.)", profile: [Information(sectionName: "Изменить статус", rowsNames: [], rowsImages: [], rowsFilling: []), Information(sectionName: "", rowsNames: ["День рождения", "Семейное положение", "Языки", "Братья, сестры" ], rowsImages: [], rowsFilling: ["17 октября 1998", "не замужем", "русский, english", "Эльвира Батырова"]), Information(sectionName: "Контакты", rowsNames: [], rowsImages: [
        UIImage(named: "phone icon")!, UIImage(named: "home icon")!, UIImage(named: "vk icon")!], rowsFilling: ["89667845699", "Kazan, Nab.Chelny", "vk.com/id8888"]), Information(sectionName: "Карьера", rowsNames: ["iOS lab"], rowsImages: [UIImage(named:"ios icon")!], rowsFilling: ["iOS Developer"]), Information(sectionName: "Образование", rowsNames: ["Вуз", "Школа"], rowsImages: [], rowsFilling: ["КФУ (бывш. КГУ им. Ульянова-Ленина)", "Лицей 78 им.А.С.Пушкина"]), Information(sectionName: "Подарки", rowsNames: [], rowsImages: [], rowsFilling: []), Information(sectionName: "", rowsNames: ["Интересные страницы", "Заметки", "Документы"], rowsImages: [], rowsFilling: ["12", "3","56"])] ), User(name: "Эльвира", surname: "Батырова", avatar: UIImage.init(named: "Elvira")!, photos: [UIImage.init(named: "heart")!], status: "online", profile: [] ), User(name: "Айгуль", surname: "Ризатдинова", avatar: UIImage.init(named: "Information")!, photos: [UIImage.init(named: "heart")!], status: "offline", profile: [] )]
    
    var news = ["Река Замбези! Четвертая по протяженности река в Африке. Имеет длину 2574 км.", "Доброе утро :)", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", ""]
    var newsPictures = [UIImage(assetName: .zambezi), UIImage(assetName: .nature), nil, UIImage(assetName: .zambezi) ]
    var photos = [UIImage(assetName: .heart), UIImage(assetName: .heart), UIImage(assetName: .iosIcon), UIImage(assetName: .heart)]
    var buttonsTitles = ["195 друзей", "248 подписчиков", "39 групп", "18 фото", "9 видео"]
    
    var arrowButtonLabel = "фотографий"
    var space = " "
    
    var index = 0
    let newsRowHeight: CGFloat = 300
    let newsRowHeightWithioutPicture: CGFloat = 150
    let estimatedRowHeight: CGFloat = 100
    let followersButton = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        randomFilling()
        setupNavigationBar()
        
        informationButton.addTarget(self, action: #selector(informationButtonPressed), for: .touchDragEnter)
        
        cellsRegister()
        setupTableViewSize()
    }
    
    func setupTableViewSize() {
        newsTableView.estimatedRowHeight = estimatedRowHeight
        newsTableView.rowHeight = UITableViewAutomaticDimension
    }
    
    func cellsRegister() {
        let tableNib = UINib(nibName: .newsCellNibName)
        newsTableView.register(tableNib, forCellReuseIdentifier: Identifiers.newsCellIdentifier.rawValue)
        
        let collectionPhotoNib = UINib(nibName: .photosCellNibName)
        photosCollectionView.register(collectionPhotoNib, forCellWithReuseIdentifier: Identifiers.photosCellIdentifier.rawValue)
        
        let collectionDescriptionNib = UINib(nibName: .descriptionCellNibName)
        descriptionCollectionView.register(collectionDescriptionNib, forCellWithReuseIdentifier: Identifiers.descriptionCellIdentifier.rawValue)
    }
    
    func informationButtonPressed() {
        performSegue(withIdentifier: Identifiers.informationButtonIdentifier.rawValue, sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Identifiers.informationButtonIdentifier.rawValue && sender != nil {
            
            let destinationTVC = segue.destination as! ProfileTableViewController
            
            if let nameAndSurname = name.text {
                destinationTVC.nameAndSurname = nameAndSurname
            }
            
            if let ageAndCity = ageAndCity.text {
                destinationTVC.ageAndCity = ageAndCity
            }
            
            if let status = usersStatus.text {
                destinationTVC.status = status
            }
            
            destinationTVC.usersPhoto = usersAvatar.image
            
            destinationTVC.usersNameForToolBar = users[index].name
            
            // Уберем текст backitem следующего контроллера

            let backItem = UIBarButtonItem()
            backItem.title = ""
            navigationItem.backBarButtonItem = backItem
            
        }
        
        if segue.identifier == Identifiers.notesIdentifier.rawValue && sender != nil {
            
            let destinationVC = segue.destination as! NotesViewController
            destinationVC.dataTransferDelegate = self
        }
        
        if segue.identifier == Identifiers.followersButtonIdentifier.rawValue && sender != nil {
            let destinationVC = segue.destination as! FollowersTableViewController
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setupNavigationBar() {
        let navigationBarAppearace = UINavigationBar.appearance()
        
        navigationBarAppearace.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
    }
    
    func randomFilling() {
        index = Int(arc4random_uniform(UInt32(users.count)))
        
        name.text = users[index].name + space + users[index].surname
        
        userNameInToolBar.title = users[index].name
        
        usersAvatar.image = users[index].avatar
        
    }
    
    //MARK: UITableViewDelegate & Datasource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
            let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.newsCellIdentifier.rawValue, for: indexPath as IndexPath) as! NewsTableViewCell
        
        if newsPictures[indexPath.row] != nil {
            
        cell.prepare(with: news[indexPath.row], picture: newsPictures[indexPath.row]!, userName: users[index].name + space + users[index].surname, usersAvatar: users[index].avatar)
        }
        else {
            cell.prepare(with: news[indexPath.row], userName: users[index].name + space + users[index].surname, usersAvatar: users[index].avatar)
        }
            return cell
    }
    
    //MARK: DataTransferProtocol
    
    func didPressReturn(with text: String) {
        news.append(text)
        newsPictures.append(nil)
        newsTableView.reloadData()
    }
    
    //MARK: Buttons actions
    
    @IBAction func ThreePointsButtonAction(_ sender: Any) {
        
        let actionSheetController = self.didPressThreePointsButton()
        present(actionSheetController, animated: true, completion: nil)
    }
    
    // MARK: UICollectionViewDelegate & Datasource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let descriptionButtonsCount = 5
        
        if collectionView == photosCollectionView {
        return photos.count
        }
        if collectionView == descriptionCollectionView {
            return descriptionButtonsCount
        }
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == photosCollectionView {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifiers.photosCellIdentifier.rawValue, for: indexPath) as! PhotosCollectionViewCell
        
        if let image = photos[indexPath.row] {
            cell.prepareCell(with: image)
        }
        return cell
        }
        if collectionView == descriptionCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifiers.descriptionCellIdentifier.rawValue, for: indexPath) as! DescriptionCollectionViewCell
            
            cell.prepareButton(title: buttonsTitles[indexPath.row])
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == descriptionCollectionView {
        
        if indexPath.row == followersButton {
            performSegue(withIdentifier: Identifiers.followersButtonIdentifier.rawValue, sender: nil)
        }
        }
    }
}

