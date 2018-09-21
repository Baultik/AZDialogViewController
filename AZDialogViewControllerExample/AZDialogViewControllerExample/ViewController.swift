//
//  ViewController.swift
//  AZDialogViewControllerExample
//
//  Created by Antonio Zaitoun on 26/02/2017.
//  Copyright © 2017 Antonio Zaitoun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let primaryColor = #colorLiteral(red: 0.6271930337, green: 0.3653797209, blue: 0.8019730449, alpha: 1)
    let primaryColorDark = #colorLiteral(red: 0.5373370051, green: 0.2116269171, blue: 0.7118118405, alpha: 1)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func click(_ sender: UIButton) {
        switch sender.tag{
        case 0:
            //ignDialog()
            loadingIndicator()
            //tableViewDialog()
        case 1:
            editUserDialog()
        case 2:
            reportUserDialog(controller: self)
        case 3:
            reportDialog()
        case 4:
            imagePreviewDialog()
        default:
            break
        }
    }
    
    
    func imagePreviewDialog(){
        let dialog = AZDialogViewController(title: "Image",message: "Image Description")
        let container = dialog.container
        let imageView = UIImageView(image: #imageLiteral(resourceName: "image"))
        imageView.contentMode = .scaleAspectFit
        container.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: container.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: container.bottomAnchor).isActive = true
        imageView.leftAnchor.constraint(equalTo: container.leftAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: container.rightAnchor).isActive = true
        
        dialog.customViewSizeRatio = imageView.image!.size.height / imageView.image!.size.width
        dialog.addAction(AZDialogAction(title: "Done") { (dialog) -> (Void) in
            dialog.image = #imageLiteral(resourceName: "ign")
        })
        
        dialog.show(in: self)
    }
    
    func loadingIndicator(){
        let dialog = AZDialogViewController(title: "Loading...", message: "Logging you in, please wait")
        
        let container = dialog.container
        let indicator = UIActivityIndicatorView(style: .gray)
        dialog.container.addSubview(indicator)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
        indicator.centerYAnchor.constraint(equalTo: container.centerYAnchor).isActive = true
        indicator.startAnimating()
        
        
        dialog.buttonStyle = { (button,height,position) in
            button.setBackgroundImage(UIImage.imageWithColor(self.primaryColorDark), for: .highlighted)
            button.setTitleColor(UIColor.white, for: .highlighted)
            button.setTitleColor(self.primaryColor, for: .normal)
            button.layer.masksToBounds = true
            button.layer.borderColor = self.primaryColor.cgColor
        }
        
        //dialog.animationDuration = 5.0
        dialog.customViewSizeRatio = 0.2
        dialog.dismissDirection = .none
        dialog.allowDragGesture = false
        dialog.dismissWithOutsideTouch = true
        dialog.show(in: self)
        
        let when = DispatchTime.now() + 3  // change 2 to desired number of seconds
        DispatchQueue.main.asyncAfter(deadline: when) {
            dialog.message = "Preparing..."
        }
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 4) {
            dialog.message = "Syncing accounts..."
        }
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5) {
            dialog.title = "Ready"
            dialog.message = "Let's get started"
            dialog.image = #imageLiteral(resourceName: "image")
            dialog.customViewSizeRatio = 0
            dialog.addAction(AZDialogAction(title: "Go", handler: { (dialog) -> (Void) in
               dialog.cancelEnabled = !dialog.cancelEnabled
            }))
            dialog.dismissDirection = .bottom
            dialog.allowDragGesture = true
        }
        
        dialog.cancelButtonStyle = { (button,height) in
            button.tintColor = self.primaryColor
            button.setTitle("CANCEL", for: [])
            return false
        }
        
        
        
        
    }
    
    func ignDialog(){
        let dialogController = AZDialogViewController(title: "IGN",
                                                      message: "IGN is your destination for gaming, movies, comics and everything you're into. Find the latest reviews, news, videos, and more more.")
        
        dialogController.showSeparator = true
        
        dialogController.dismissDirection = .bottom
        
        dialogController.imageHandler = { (imageView) in
            imageView.image = UIImage(named: "ign")
            imageView.contentMode = .scaleAspectFill
            return true
        }
        
        dialogController.addAction(AZDialogAction(title: "Subscribe", handler: { [weak self] (dialog) -> (Void) in
            //dialog.title = "title"
            //dialog.message = "new message"
            //dialog.image = dialog.image == nil ? #imageLiteral(resourceName: "ign") : nil
            //dialog.title = ""
            //dialog.message = ""
            //dialog.customViewSizeRatio = 0.2
            
            
        }))
        
        //let container = dialogController.container
        //let button = UIButton(type: .system)
        //button.setTitle("MY BUTTON", for: [])
        //dialogController.container.addSubview(button)
        //button.translatesAutoresizingMaskIntoConstraints = false
        //button.centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
        //button.centerYAnchor.constraint(equalTo: container.centerYAnchor).isActive = true
        
        
        dialogController.buttonStyle = { (button,height,position) in
            button.setBackgroundImage(UIImage.imageWithColor(self.primaryColor) , for: .normal)
            button.setBackgroundImage(UIImage.imageWithColor(self.primaryColorDark), for: .highlighted)
            button.setTitleColor(UIColor.white, for: [])
            button.layer.masksToBounds = true
            button.layer.borderColor = self.primaryColor.cgColor
            button.tintColor = .white
            if position == 0 {
                let image = #imageLiteral(resourceName: "ic_bookmark").withRenderingMode(.alwaysTemplate)
                button.setImage(image, for: [])
                button.imageView?.contentMode = .scaleAspectFit
            }
        }

        dialogController.blurBackground = true
        dialogController.blurEffectStyle = .dark

        dialogController.rightToolStyle = { (button) in
            button.setImage(#imageLiteral(resourceName: "share"), for: [])
            button.tintColor = .lightGray
            return true
        }
        
        dialogController.rightToolAction = { (button) in
            print("Share function")
        }
        
        dialogController.dismissWithOutsideTouch = true
        
        dialogController.show(in: self)
    }
    
    func editUserDialog(){
        let dialogController = AZDialogViewController(title: "Antonio Zaitoun", message: "minitour")

        dialogController.addAction(AZDialogAction(title: "Edit Name", handler: { (dialog) -> (Void) in
            //dialog.removeAction(at: 0)
            dialog.addAction(AZDialogAction(title: "action"))
            dialog.contentOffset = self.view.frame.height / 2.0 - dialog.estimatedHeight / 2.0 - 16
            
        }))
        
        dialogController.addAction(AZDialogAction(title: "Remove Friend", handler: { (dialog) -> (Void) in
            dialog.removeAction(at: 1)
        }))
        
        dialogController.addAction(AZDialogAction(title: "Block", handler: { (dialog) -> (Void) in
            //dialog.spacing = 20
            dialog.removeAction(at: 2)
            dialog.contentOffset = self.view.frame.height / 2.0 - dialog.estimatedHeight / 2.0 - 16
        }))

        dialogController.setStyle(EditUserStyle())
        dialogController.contentOffset = self.view.frame.height / 2.0 - dialogController.estimatedHeight / 2.0 - 16
        
        dialogController.show(in: self)
    }
    
    func reportUserDialog(controller: UIViewController){
        let dialogController = AZDialogViewController(title: "Minitour has been blocked.", message: "Let us know your reason for blocking them?")
        dialogController.dismissDirection = .none
        dialogController.dismissWithOutsideTouch = false
        
        dialogController.addAction(AZDialogAction(title: "Annoying"))
        dialogController.addAction(AZDialogAction(title: "I don't know them"))
        dialogController.addAction(AZDialogAction(title: "Inappropriate Snaps"))
        dialogController.addAction(AZDialogAction(title: "Harassing me"))
        dialogController.addAction(AZDialogAction(title: "Other"))
        
        dialogController.buttonStyle = { (button,height,position) in
            button.setBackgroundImage(UIImage.imageWithColor(self.primaryColorDark), for: .highlighted)
            button.setTitleColor(UIColor.white, for: .highlighted)
            button.setTitleColor(self.primaryColor, for: .normal)
            button.layer.masksToBounds = true
            button.layer.borderColor = self.primaryColor.cgColor
        }
        
        dialogController.show(in: controller)
    }

    func reportDialog(){
        let dialogController = AZDialogViewController(title: nil, message: nil)

        dialogController.addAction(AZDialogAction(title: "Mute"))
        dialogController.addAction(AZDialogAction(title: "Group Info"))
        dialogController.addAction(AZDialogAction(title: "Export Chat"))
        dialogController.addAction(AZDialogAction(title: "Clear Chat"))
        dialogController.addAction(AZDialogAction(title: "Exit Chat"))
        dialogController.setStyle(ReportStyle())
        
        dialogController.show(in: self)
    }
    
    func tableViewDialog(){
        let dialog = AZDialogViewController(title: "Switch Account", message: nil)
        
        dialog.showSeparator = false
        
        let container = dialog.container
        
        dialog.customViewSizeRatio = 1.0
        
        let tableView = UITableView(frame: .zero, style: .plain)
        
        container.addSubview(tableView)
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorColor = .clear
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: container.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: container.bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: container.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: container.rightAnchor).isActive = true
        
        
        dialog.show(in: self)
        
    }
    
    var items: [String] = ["Account 1","Account 2","Account 3","Account 4","Account 5"]
    
    func handlerForIndex(_ index: Int)->ActionHandler{
        switch index{
        case 0:
            return { dialog in
                print("action for index 0")
            }
        case 1:
            return { dialog in
                print("action for index 1")
            }
        default:
            return {dialog in
                print("default action")
            }
        }
        
    }
    
}



extension ViewController: UITableViewDelegate{
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        dismiss(animated: true, completion: nil)
    }
}



extension ViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell"){
            cell.textLabel?.text = items[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }
}


extension UIImage {
    class func imageWithColor(_ color: UIColor) -> UIImage {
        let rect: CGRect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 1, height: 1), false, 0)
        color.setFill()
        UIRectFill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
}

class HighlightableButton: UIButton{

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    func setup() {
        backgroundColor = #colorLiteral(red: 0.1019607843, green: 0.737254902, blue: 0.6117647059, alpha: 1)
        layer.cornerRadius = 5
        layer.masksToBounds = true
    }

    override var isHighlighted: Bool{
        set{
            UIView.animate(withDuration: 0.1) { [weak self] in
                self?.alpha = newValue ? 0.5 : 1
                self?.transform = newValue ? CGAffineTransform(scaleX: 0.95, y: 0.95) : .identity
            }
            super.isHighlighted = newValue
        }get{
            return super.isHighlighted
        }
    }
}


