//
//  GameViewController.swift
//  GameCollector
//
//  Created by Ariel Nelson on 2/11/17.
//  Copyright © 2017 Ariel Nelson. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var gameImageView: UIImageView!
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        imagePicker.delegate = self
        
        // Do any additional setup after loading the view.
    }

    @IBAction func photosTapped(_ sender: Any) {
        
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        gameImageView.image = image
        
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cameraTapped(_ sender: Any) {
    
    }
    
    
    @IBAction func addTapped(_ sender: Any) {
    
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let game = Game(context: context)
        game.title = titleTextField.text
        game.image = UIImagePNGRepresentation(gameImageView.image!) as NSData?
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController!.popViewController(animated: true)
        
    }
    

}
