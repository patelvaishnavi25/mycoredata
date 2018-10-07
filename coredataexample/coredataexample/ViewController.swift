//
//  ViewController.swift
//  coredataexample
//
//  Created by TOPS on 7/30/18.
//  Copyright © 2018 TOPS. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    
    @IBOutlet weak var txtempmob: UITextField!
    @IBOutlet weak var txtempadd: UITextField!
    @IBOutlet weak var txtempname: UITextField!
    
    
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext;
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func btninsert(_ sender: Any) {
        
        
        let newrecord = NSEntityDescription.insertNewObject(forEntityName: "Employee", into: context);
        
        newrecord.setValue(txtempname.text!, forKey: "emp_name");
        newrecord.setValue(
            txtempadd.text!, forKey: "emp_add");
        newrecord.setValue(txtempmob.text!, forKey: "emp_mob");
        do {
            
            try     context.save()
            
            txtempname.text = "";
            txtempadd.text = "";
            txtempmob.text = "";
            txtempname.becomeFirstResponder();
            
        } catch  {
            
            
        }
        
     
        
        
    }
    
    @IBAction func btnupdate(_ sender: Any) {
        
        
        let enitydesc = NSEntityDescription.entity(forEntityName: "Employee", in: context);
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName :"Employee");
        
        request.entity = enitydesc;
        
        let pred = NSPredicate(format: "(emp_name =%@)", txtempname.text!);
        
        request.predicate = pred;
        
        
        do {
            let result = try context.fetch(request)
            
            
            print(request);
            
            if result.count > 0
            {
                
                let manage = result[0] as! NSManagedObject;
                
                manage.setValue(txtempname.text!, forKey: "emp_name");
                manage.setValue(txtempadd.text!, forKey: "emp_add");
                manage.setValue(txtempmob.text!, forKey: "emp_mob");
                
                do {
                    try   context.save()
                    txtempname.text = "";
                    txtempadd.text = "";
                    txtempmob.text = "";
                    txtempname.becomeFirstResponder();
                } catch  {
                    
                    
                }
              
                
                
                
            }
            else
            {
                
                print("not found");
                
                
            }
            
            
            
            
            
        } catch  {
            
            
            
        }

    }
    
   
    @IBAction func btndelete(_ sender: Any) {
        
        let enitydesc = NSEntityDescription.entity(forEntityName: "Employee", in: context);
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName :"Employee");
        
        request.entity = enitydesc;
        
        let pred = NSPredicate(format: "(emp_name =%@)", txtempname.text!);
        
        request.predicate = pred;
        
        
        do {
            let result = try context.fetch(request)
            
            
            print(request);
            
            if result.count > 0
            {
                
                let manage = result[0] as! NSManagedObject;
                
                context.delete(manage);
                
                
                
                do {
                    try   context.save()
                    txtempname.text = "";
                    txtempadd.text = "";
                    txtempmob.text = "";
                    txtempname.becomeFirstResponder();
                } catch  {
                    
                    
                }
                
                
                
                
            }
            else
            {
                
                print("not found");
                
                
            }
            
            
            
            
            
        } catch  {
            
            
            
        }

    }
    
    @IBAction func btnselect(_ sender: Any) {
        
        let enitydesc = NSEntityDescription.entity(forEntityName: "Employee", in: context);
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName :"Employee");
        
        request.entity = enitydesc;
        
        let pred = NSPredicate(format: "(emp_name =%@)", txtempname.text!);
        
        request.predicate = pred;
        
        
        do {
            let result = try context.fetch(request)
            
            
            print(request);
            
            if result.count > 0
            {
                
                let manage = result[0] as! NSManagedObject;
                
                txtempname.text = manage.value(forKey: "emp_name") as? String;
                
                txtempadd.text = manage.value(forKey: "emp_add") as? String;
                
                txtempmob.text = manage.value(forKey: "emp_mob") as? String;
                
                
                
            }
            else
            {
                
                print("not found");
                
                
            }
            
            
            
            
            
        } catch  {
            
            
            
        }
        
        

        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

