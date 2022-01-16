//
//  ButtonClickListener.swift
//  
//
//  Created by Noah Pistilli on 2022-01-15.
//

import Foundation
import Sword

func buttonClick() {
    bot.on(.buttonEvent) { data in
        var button = data as! ButtonEvent
        button.setEphemeral(isEphermeral: true)

        if button.selectedButton.customId == "server_updates" {
            // Check if the member has the role
            for role in button.member!.roles {
                if role.name == "Server Updates" {
                    let roles = button.member!.roles.filter { $0.id != 931785297216294942 }
                    var rolesArray = [UInt64]()
                    
                    for role in roles {
                        rolesArray.append(role.id.rawValue)
                    }
                    
                    button.guild.modifyMember(button.user.id, with: ["roles": rolesArray])
                    button.reply(message: "Successfully removed the Server Updates role.")
                    return
                }
            }
            
            var rolesArray: [UInt64] = [931785297216294942]
            for role in button.member!.roles {
                rolesArray.append(role.id.rawValue)
            }
            
            button.guild.modifyMember(button.user.id, with: ["roles": rolesArray])
            button.reply(message: "Successfully added the Server Updates role.")
        }
        else if button.selectedButton.customId == "general_liv_updates" {
            // Check if the member has the role
            for role in button.member!.roles {
                if role.name == "General Olivia Updates" {
                    let roles = button.member!.roles.filter { $0.id != 931785367567343637 }
                    var rolesArray = [UInt64]()
                    
                    for role in roles {
                        rolesArray.append(role.id.rawValue)
                    }
                    
                    button.guild.modifyMember(button.user.id, with: ["roles": rolesArray])
                    button.reply(message: "Successfully removed the General Olivia Updates role.")
                    return
                }
            }
            
            var rolesArray: [UInt64] = [931785367567343637]
            for role in button.member!.roles {
                rolesArray.append(role.id.rawValue)
            }
            
            button.guild.modifyMember(button.user.id, with: ["roles": rolesArray])
            button.reply(message: "Successfully added the General Olivia Updates role.")
        }
        else if button.selectedButton.customId == "insta_updates" {
            // Check if the member has the role
            for role in button.member!.roles {
                if role.name == "Instagram Updates" {
                    let roles = button.member!.roles.filter { $0.id != 931785426556026900 }
                    var rolesArray = [UInt64]()
                    
                    for role in roles {
                        rolesArray.append(role.id.rawValue)
                    }
                    
                    button.guild.modifyMember(button.user.id, with: ["roles": rolesArray])
                    button.reply(message: "Successfully removed the Instagram Updates role.")
                    return
                }
            }
            
            var rolesArray: [UInt64] = [931785426556026900]
            for role in button.member!.roles {
                rolesArray.append(role.id.rawValue)
            }
            
            button.guild.modifyMember(button.user.id, with: ["roles": rolesArray])
            button.reply(message: "Successfully added the Instagram Updates role.")
        }
        else if button.selectedButton.customId == "tour_updates" {
            // Check if the member has the role
            for role in button.member!.roles {
                if role.name == "Tour Updates" {
                    let roles = button.member!.roles.filter { $0.id != 931785490003292290 }
                    var rolesArray = [UInt64]()
                    
                    for role in roles {
                        rolesArray.append(role.id.rawValue)
                    }
                    
                    button.guild.modifyMember(button.user.id, with: ["roles": rolesArray])
                    button.reply(message: "Successfully removed the Tour Updates role.")
                    return
                }
            }
            
            var rolesArray: [UInt64] = [931785490003292290]
            for role in button.member!.roles {
                rolesArray.append(role.id.rawValue)
            }
            
            button.guild.modifyMember(button.user.id, with: ["roles": rolesArray])
            button.reply(message: "Successfully added the Tour Updates role.")
        }
    }
}
