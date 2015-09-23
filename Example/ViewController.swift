//
//  ViewController.swift
//  Example
//
//  Copyright © 2015 cienet. All rights reserved.
//

import UIKit
import MagicVision

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
  @IBOutlet weak var faceImageView: UIImageView!
  @IBOutlet weak var faceRectView: UIView!
  
  @IBOutlet weak var faceImageWidthCons: NSLayoutConstraint!
  @IBOutlet weak var faceImageHeightCons: NSLayoutConstraint!
  
  @IBOutlet weak var faceRectTopCons: NSLayoutConstraint!
  @IBOutlet weak var faceRectLeftCons: NSLayoutConstraint!
  
  @IBOutlet weak var faceRectWidthCons: NSLayoutConstraint!
  @IBOutlet weak var faceRectHeightCons: NSLayoutConstraint!
  
  var imagePicker: UIImagePickerController?
  
  // MARK: Overrides
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func detectFace(image: UIImage) {
    
    faceRectView.layer.borderColor = UIColor.greenColor().CGColor
    faceRectView.layer.borderWidth = 2
    
//    let faceImagePath = NSBundle.mainBundle().pathForResource("face_example_1", ofType: "png")
//    let faceImage = UIImage(contentsOfFile: faceImagePath!)
    
    faceImageWidthCons.constant = 300
    faceImageHeightCons.constant = 300 * (image.size.height / image.size.width)
    
    faceImageView.image = image
    
    let face = MVFaceDetector.detectFace(image)
    print("face x \(face.origin.x) y \(face.origin.y) width \(face.width) height \(face.height)")
    
    let ratio = (300 / image.size.width)
    
    faceRectLeftCons.constant = face.origin.x * ratio
    faceRectTopCons.constant = face.origin.y * ratio
    faceRectWidthCons.constant = face.width * ratio
    faceRectHeightCons.constant = face.height * ratio
  }
  
  @IBAction func onSelectImageBtnClicked(sender: AnyObject) {
    
    imagePicker = UIImagePickerController()
    
    imagePicker!.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
    imagePicker!.delegate = self
    
    self.presentViewController(imagePicker!, animated: true, completion: nil)
  }
}

extension ViewController {
  
  func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
    self.dismissViewControllerAnimated(true, completion: nil)
    
    if let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
      
      self.detectFace(selectedImage)
    }
  }
  
  
  func imagePickerControllerDidCancel(picker: UIImagePickerController) {
    self.dismissViewControllerAnimated(true, completion: nil)
    
  }
  
  
}

