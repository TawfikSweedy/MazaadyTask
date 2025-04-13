//
//  ViewController.swift
//  MazaadyTask
//
//  Created by sameh mohammed on 10/04/2025.
//

import UIKit
import Combine

class ProfileViewController: UIViewController {
    //MARK:- @IBOutlets
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var followingCountLabel: UILabel!
    @IBOutlet weak var followersCountLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var userAccountLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userImg: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var followersBtn: UnderlineButton!
    @IBOutlet weak var reviewsBtn: UnderlineButton!
    @IBOutlet weak var productsBtn: UnderlineButton!
    //MARK:- Variables
    let viewModel: ProfileViewModel
    //MARK:- private Variables
    private var cancellables = Set<AnyCancellable>()
    //MARK:- init
    required init?(coder: NSCoder) {
        self.viewModel = ProfileViewModel()
        super.init(coder: coder)
    }
    
    init(viewModel: ProfileViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    //MARK:- override funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        SetupBtns()
        SetupTableView()
        bindViewModel()
        viewModel.GetUserData()
        viewModel.GetProducts(name: "")
        viewModel.GetAds()
        viewModel.GetTags()
    }
    //MARK:- SetupTableView func
    func SetupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ProductsTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductsTableViewCell")
        tableView.register(UINib(nibName: "AdTableViewCell", bundle: nil), forCellReuseIdentifier: "AdTableViewCell")
        tableView.register(UINib(nibName: "TagsTableViewCell", bundle: nil), forCellReuseIdentifier: "TagsTableViewCell")
        tableView.layoutIfNeeded()
        tableView.reloadData()
    }
    //MARK:- bindViewModel func
    func bindViewModel(){
        viewModel.$dataStatus
            .receive(on: DispatchQueue.main)
            .sink { [weak self] state in
                guard let self = self, let state = state else {return}
                switch state{
                case .loading:
                    self.startLoading()
                case .finished(let outcome):
                    self.stopLoading()
                    switch outcome{
                    case .success:
                        break
                    case .failure(let error):
                        self.alertError(message: error.localizedDescription)
                    }
                }
            }
            .store(in: &cancellables)
        
        viewModel.$userData
            .receive(on: DispatchQueue.main)
            .sink { [weak self] user in
                guard let self = self, let user = user else {return}
                self.userImg.SDImage(URL(string: user.image ?? ""))
                self.userNameLabel.text = user.name
                self.userAccountLabel.text = user.user_name
                self.followersCountLabel.text = "\(user.followers_count ?? 0)"
                self.followingCountLabel.text = "\(user.following_count ?? 0)"
                self.locationLabel.text = "\(user.country_name ?? ""), \(user.city_name ?? "")"
            }
            .store(in: &cancellables)
        
        viewModel.$productsData
            .receive(on: DispatchQueue.main)
            .sink { [weak self] products in
                guard let self = self, let products = products else {return}
                print(products)
                tableView.layoutIfNeeded()
                tableView.reloadData()
            }
            .store(in: &cancellables)
    }
    //MARK:- SetupBtns func
    func SetupBtns() {
        searchTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        productsBtn.setUnderlineActive(true)
        [reviewsBtn, followersBtn].forEach { button in
            button?.setUnderlineActive(false)
        }
    }
    //MARK:- @objc func
    @objc func textFieldDidChange(_ textField: UITextField) {
        if textField.text?.isEmpty == true {
            view.endEditing(true)
            viewModel.GetProducts(name: "")
        }
    }
    //MARK:- @IBAction func
    @IBAction func productsBtnAction(_ sender: Any) {
        productsBtn.setUnderlineActive(true)
        [reviewsBtn, followersBtn].forEach { button in
            button?.setUnderlineActive(false)
        }
    }
    
    @IBAction func reviewsBtnAction(_ sender: Any) {
        reviewsBtn.setUnderlineActive(true)
        [productsBtn, followersBtn].forEach { button in
            button?.setUnderlineActive(false)
        }
    }
    
    @IBAction func FollowersBtnAction(_ sender: Any) {
        followersBtn.setUnderlineActive(true)
        [productsBtn, reviewsBtn].forEach { button in
            button?.setUnderlineActive(false)
        }
    }
    
    @IBAction func searchBtnAction(_ sender: Any) {
        view.endEditing(true)
        viewModel.GetProducts(name: searchTextField.text ?? "")
    }
}

