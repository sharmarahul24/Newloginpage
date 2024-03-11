//
//  File.swift
//  Newloginpage
//
//  Created by R92 on 12/02/24.
//

import Foundation
import UIKit
import SQLite3

struct userData {
    var email : String
    var password : String
}
class sqlitehelper {
    
    static var array = [userData]()
    static var file : OpaquePointer?
    
    
    static func creatfile(){
        var a = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        a.appendPathComponent("Loginpage.db")
        sqlite3_open(a.path, &file)
        print("Creat A File")
        print(a.path)
        creatTabel()
        
    }
    static func creatTabel(){
        let q = "Create Table if not exists Loginpage (Email text, Password text)"
        var table: OpaquePointer?
        sqlite3_prepare(file, q, -1, &table, nil)
        sqlite3_step(table)
        print("Create Table")
        
        
    }
    static func addData(Email: String , password: String ){
        
        let q = "insert into Loginpage values ('\(Email)','\(password)')"
        var add: OpaquePointer?
        sqlite3_prepare(file, q, -1, &add, nil)
        sqlite3_step(add)
        print("add data")
        
    }
    static func GetData(){
        let q = "SELECT * FROM Loginpage"
        var read: OpaquePointer?
        sqlite3_prepare(file, q, -1, &read, nil)
        while sqlite3_step(read) == SQLITE_ROW {
            
            if let emailPointer = sqlite3_column_text(read, 0),
               let passwordPointer = sqlite3_column_text(read, 1) {
                let email = String(cString: emailPointer)
                let password = String(cString: passwordPointer)
                
                
                let userData = userData(email: email, password: password)
                array.append(userData)
            }
        }
        
    }
    static func DeleteData(Email:String){
        let q = "DELETE FROM Loginpage WHERE Email ='\(Email)'"
        var delete: OpaquePointer?
        sqlite3_prepare(file, q, -1, &delete, nil)
        sqlite3_step(delete)
        print("Delete data")
        
        
    }
    static func UpdateData(Email: String,password: String){
        let q = "UPDATE Loginpage SET email = '\(Email)', password = '\(password)' "
        var update: OpaquePointer?
        sqlite3_prepare(file, q, -1, &update, nil)
        sqlite3_step(update)
        print("Update data")
        
        
    }
    
}
