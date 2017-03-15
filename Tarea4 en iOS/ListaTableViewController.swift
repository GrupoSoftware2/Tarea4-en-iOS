//
//  ListaTableViewController.swift
//  Tarea4 en iOS
//
//  Created by alumno on 3/14/17.
//  Copyright © 2017 Jorge Luis Limo. All rights reserved.
//

import UIKit

public var seleccionado = Array<Item>()

class ListaTableViewController: UITableViewController {

    var items = Array<Item>()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        for i in 1...9{
            
            let item = Item()
            item.nombre = "item\(i)"
            item.precio = Double(i)*10.0
            items.append(item)
            
        }
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath)

        // Configure the cell...
        let item = items[indexPath.row]
        cell.textLabel?.text = item.nombre
        cell.detailTextLabel?.text = "$ \(item.precio!)"
        
        let longPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(longPress))
        longPressGestureRecognizer.minimumPressDuration = 1
        cell.addGestureRecognizer(longPressGestureRecognizer)
        
        return cell
    }
    

    func longPress(sender: UILongPressGestureRecognizer){
        
        let cell = sender.view as! UITableViewCell
        let indexPath = tableView.indexPath(for: cell)
        let item = items[(indexPath?.row)!]
        
        var alerta:UIAlertController
        
        if !seleccionado.contains(item) {
            
            alerta = UIAlertController(title: "Mensaje", message: "!Favorito Agregado!", preferredStyle: UIAlertControllerStyle.alert)
            let accionOk = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
            
            alerta.addAction(accionOk)
            self.present(alerta, animated: true, completion: nil)
            
            seleccionado.append(item)
            
        }else{
            alerta = UIAlertController(title: "Mensaje", message: "!Ya se agrego este Item!", preferredStyle: UIAlertControllerStyle.alert)
            let accionOk = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
            
            alerta.addAction(accionOk)
            self.present(alerta, animated: true, completion: nil)
            
        }
        
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
