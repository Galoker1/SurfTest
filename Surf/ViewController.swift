//
//  ViewController.swift
//  Surf
//
//  Created by Егор  Хлямов on 01.08.2023.
//

import UIKit

class ViewController:  UIViewController {
    
    let scrollView = UIScrollView()
    let topBarView = UIView()
    let avatarView = UIImageView()
    let nameLabel = UILabel()
    let statusLabel = UILabel()
    let cityLabel = UIStackView()
    let skillsStack = UIStackView()
    let skillsHeader = UIStackView()
    let aboutStack = UIStackView()
    var skillsCollection:UICollectionView!
    let singletone = Singletone.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(scrollView)
        self.configureScrollView()
        
        self.scrollView.addSubview(topBarView)
        self.configureNavBar()
        
        self.scrollView.addSubview(avatarView)
        self.configureAvatar()
        
        self.scrollView.addSubview(nameLabel)
        self.configureNameLabel()
        
        self.scrollView.addSubview(statusLabel)
        self.configureStatusLabel()
        
        self.scrollView.addSubview(cityLabel)
        self.configureCityLabel()
       
        

        
        self.setColors()
    }
    override func viewDidAppear(_ animated: Bool) {
        
        
        self.scrollView.addSubview(skillsStack)

        self.configureSkillsStack()
        
        self.configureSkillsCollection()
        
    }
    
    func configureScrollView(){
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = UIColor(hex: "#F3F3F5")
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        let height = 800.0
        scrollView.contentSize = CGSize(width: view.bounds.width, height: height  )
    }
    
    func configureNavBar(){
        topBarView.frame = CGRect(x: 0, y: 0 , width: view.frame.width, height: 56)
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 20))
        titleLabel.text = "Профиль"
        titleLabel.textAlignment = .center
        titleLabel.center = topBarView.center
        titleLabel.font = .systemFont(ofSize: 16, weight: .bold)
        topBarView.addSubview(titleLabel)
    }
    
    override func viewDidLayoutSubviews() {
        avatarView.layer.cornerRadius = 60
        avatarView.clipsToBounds = true
    }
    
    func configureNameLabel(){
        nameLabel.text = "Хлямов Егор \n Сергеевич"
        nameLabel.numberOfLines = 2
        nameLabel.font = .systemFont(ofSize: 24, weight: .bold)
        nameLabel.textAlignment = .center
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.widthAnchor.constraint(equalToConstant: view.bounds.width),
            nameLabel.topAnchor.constraint(equalTo: self.avatarView.bottomAnchor , constant: 16)
        ])
    }
    
    func configureAvatar(){
        avatarView.translatesAutoresizingMaskIntoConstraints = false
        avatarView.image = UIImage(named: "scale_1200")
        NSLayoutConstraint.activate([
            avatarView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: (view.bounds.width - 120)/2),
            avatarView.widthAnchor.constraint(equalToConstant: 120),
            avatarView.heightAnchor.constraint(equalToConstant: 120),
            avatarView.topAnchor.constraint(equalTo: self.topBarView.bottomAnchor , constant: 24)
        ])
    }
    
    func configureStatusLabel(){
        statusLabel.text = "IT-Раздолбай, опыт более 3-х лет"
        statusLabel.font = .systemFont(ofSize: 14, weight: .regular)
        statusLabel.textColor = UIColor(hex: "#96959B")
        statusLabel.textAlignment = .center
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            statusLabel.widthAnchor.constraint(equalToConstant: view.bounds.width),
            statusLabel.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor , constant: 4)
        ])
    }
    
    func configureCityLabel(){
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        cityLabel.alignment = .center
        NSLayoutConstraint.activate([
            cityLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cityLabel.topAnchor.constraint(equalTo: self.statusLabel.bottomAnchor , constant: 0)
        ])
        cityLabel.axis = .horizontal // Используйте .vertical для вертикального расположения элементов
        cityLabel.spacing = 0
        
        let label = UILabel()
        label.text = "Ярославль"
        label.font =  .systemFont(ofSize: 14, weight: .regular)
        label.textColor = UIColor(hex: "#96959B")
        label.textAlignment = .center

        let imageView = UIImageView(image: UIImage(named: "map"))
        
        cityLabel.addArrangedSubview(imageView)
        cityLabel.addArrangedSubview(label)
        imageView.widthAnchor.constraint(equalToConstant:  12).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 16).isActive = true
        imageView.rightAnchor.constraint(equalTo: label.leftAnchor,constant: 0).isActive = true
    }
    
    func configureSkillsStack(){
        skillsStack.translatesAutoresizingMaskIntoConstraints = false
        skillsStack.backgroundColor = .white
        skillsStack.spacing = 20
        NSLayoutConstraint.activate([
            skillsStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            skillsStack.topAnchor.constraint(equalTo: self.cityLabel.bottomAnchor , constant: 20),
            skillsStack.widthAnchor.constraint(equalToConstant: view.bounds.width),
        ])
        skillsStack.axis = .vertical
        
        skillsStack.addArrangedSubview(skillsHeader)
        configureSkillHeader()
        configureAboutStack()
        
    }
    func configureSkillHeader(){
        skillsHeader.axis = .horizontal
        skillsHeader.layoutMargins = UIEdgeInsets(top: 20, left: 16, bottom: 0, right: 16)
        skillsHeader.isLayoutMarginsRelativeArrangement = true
        let label = UILabel()
        label.text = "Мои навыки"
        label.font =  .systemFont(ofSize: 16, weight: .medium)
        label.textAlignment = .left
        skillsStack.translatesAutoresizingMaskIntoConstraints = false
        let button = UIButton()
        if singletone.isEditing{
            button.setImage(UIImage(named: "succes"), for: .normal)
        }
        else{
            button.setImage(UIImage(named: "pencil"), for: .normal)
        }
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: 24),
            button.heightAnchor.constraint(equalTo: button.widthAnchor),
        ])
        
        skillsHeader.addArrangedSubview(label)
        skillsHeader.addArrangedSubview(button)
    }
    func configureSkillsCollection() {
        skillsCollection = UICollectionView(frame: .zero, collectionViewLayout: setupFlowLayout())
        skillsStack.addArrangedSubview(skillsCollection)
        skillsStack.addArrangedSubview(aboutStack)
        skillsCollection.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            skillsCollection.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            skillsCollection.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            skillsCollection.heightAnchor.constraint(equalToConstant: CGFloat(((singletone.getSkills().count - 1 )/3 + 1))*55.0)
        ])
        skillsCollection.delegate = self
        skillsCollection.dataSource = self
        skillsCollection.register(SkillCell.self, forCellWithReuseIdentifier: "skillCell")
        }
    func setupFlowLayout() -> UICollectionViewFlowLayout{
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        return layout
    }
    
    func configureAboutStack(){
        
        aboutStack.axis = .vertical
        aboutStack.layoutMargins = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        aboutStack.isLayoutMarginsRelativeArrangement = true
        aboutStack.spacing = 10
        let label = UILabel()
        label.text = "О себе"
        label.font =  .systemFont(ofSize: 16, weight: .medium)
        label.textAlignment = .left
        
        let info = UILabel()
        info.text = "Меня зовут Егор. Учусь на третьем курсе Ярославского политеха. Изучаю ios разработку. До этого писал на python и php. Считаю, что в написании костылей мне нет равных"
        info.font =  .systemFont(ofSize: 14, weight: .regular)
        info.textAlignment = .left
        info.numberOfLines = 0
        info.textAlignment = .left
        aboutStack.addArrangedSubview(label)
        aboutStack.addArrangedSubview(info)
    }
    
    func setColors(){
        view.overrideUserInterfaceStyle = .light
        view.backgroundColor = UIColor(hex: "#F3F3F5")
    }
    @objc func buttonTapped(){
        singletone.isEditing = !singletone.isEditing
        skillsStack.removeAllSubviews()
        skillsCollection.removeFromSuperview()
        self.scrollView.addSubview(skillsStack)
        self.configureSkillsStack()
        self.configureSkillsCollection()
        let height = topBarView.bounds.height + 110 + skillsStack.bounds.height + avatarView.bounds.height + nameLabel.bounds.height + cityLabel.bounds.height
        scrollView.contentSize = CGSize(width: view.bounds.width, height: height  )
    }
    @objc func deleteItem(){
        skillsStack.removeAllSubviews()
        skillsCollection.removeFromSuperview()
        
        
        self.scrollView.addSubview(skillsStack)
        self.configureSkillsStack()
        self.configureSkillsCollection()
        let height = topBarView.bounds.height + 110 + skillsStack.bounds.height + avatarView.bounds.height + nameLabel.bounds.height + cityLabel.bounds.height
        scrollView.contentSize = CGSize(width: view.bounds.width, height: height  )
    }
}


extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {

    // Обязательные методы UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // Верните количество элементов в вашем UICollectionView
        return singletone.getSkills().count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Создайте и настройте вашу ячейку в этом методе
        guard let cell = skillsCollection.dequeueReusableCell(withReuseIdentifier: "skillCell", for: indexPath) as? SkillCell else{
            return SkillCell()
        }
        if indexPath.row == singletone.getSkills().count - 1 && singletone.isEditing{
            cell.deleteImage.isHidden = true
            cell.titleLabel.removeConstraints(cell.titleLabel.constraints)
            cell.titleLabel.textAlignment = .center
            NSLayoutConstraint.activate([
                cell.titleLabel.widthAnchor.constraint(equalToConstant: 111),
                cell.titleLabel.heightAnchor.constraint(equalToConstant: 44),
                cell.titleLabel.leadingAnchor.constraint(equalTo:  cell.contentView.leadingAnchor),
                cell.titleLabel.topAnchor.constraint(equalTo: cell.contentView.topAnchor),
            ])
            
            
        }
        cell.titleLabel.text = singletone.getSkills()[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if singletone.isEditing{
            if indexPath.row == singletone.getSkills().count - 1{
                let alert = UIAlertController(title: "Add Folder", message: "Enter a name", preferredStyle: .alert)
                alert.addTextField { (textField) in
                    textField.text = ""
                }
                alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: { [weak alert] (_) in
                }))
                
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                    guard let textField = alert?.textFields![0] else {return}
                    if textField.text != ""{
                        self.singletone.skills.append(textField.text ?? "New Skill")
                        self.deleteItem()
                    }
                }))
                
                self.present(alert, animated: true, completion: nil)
            }
            else{
                singletone.skills.remove(at: indexPath.row)
            }
            print(skillsStack.bounds.height)
            deleteItem()
        }
        
        
    }
    
}


extension UIView {
    func removeAllSubviews() {
        for subview in subviews {
            subview.removeAllSubviews()
            subview.removeFromSuperview()
        }
    }
}
