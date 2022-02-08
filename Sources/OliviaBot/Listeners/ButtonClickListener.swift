//
//  ButtonClickListener.swift
//  
//
//  Created by Noah Pistilli on 2022-01-15.
//

import Foundation
import Swiftcord


class ButtonClickListener: ListenerAdapter {
    override func onButtonClickEvent(event: ButtonEvent) async {
        var button = event
        button.setEphemeral(true)

        // MARK: Ping Updates
        if button.selectedButton.customId == "server_updates" {
            // Check if the member has the role
            for role in button.member!.roles {
                if role.name == "Server Updates" {
                    let roles = button.member!.roles.filter { $0.id != 931785297216294942 }
                    var rolesArray = [UInt64]()
                    
                    for role in roles {
                        rolesArray.append(role.id.rawValue)
                    }
                    
                    try! await button.guild.modifyMember(button.user.id, with: ["roles": rolesArray])
                    try! await button.reply(message: "Successfully removed the Server Updates role.")
                    return
                }
            }
            
            var rolesArray: [UInt64] = [931785297216294942]
            for role in button.member!.roles {
                rolesArray.append(role.id.rawValue)
            }
            
            try! await button.guild.modifyMember(button.user.id, with: ["roles": rolesArray])
            try! await button.reply(message: "Successfully added the Server Updates role.")
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
                    
                    try! await button.guild.modifyMember(button.user.id, with: ["roles": rolesArray])
                    try! await button.reply(message: "Successfully removed the General Olivia Updates role.")
                    return
                }
            }
            
            var rolesArray: [UInt64] = [931785367567343637]
            for role in button.member!.roles {
                rolesArray.append(role.id.rawValue)
            }
            
            try! await button.guild.modifyMember(button.user.id, with: ["roles": rolesArray])
            try! await button.reply(message: "Successfully added the General Olivia Updates role.")
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
                    
                    try! await button.guild.modifyMember(button.user.id, with: ["roles": rolesArray])
                    try! await button.reply(message: "Successfully removed the Instagram Updates role.")
                    return
                }
            }
            
            var rolesArray: [UInt64] = [931785426556026900]
            for role in button.member!.roles {
                rolesArray.append(role.id.rawValue)
            }
            
            try! await button.guild.modifyMember(button.user.id, with: ["roles": rolesArray])
            try! await button.reply(message: "Successfully added the Instagram Updates role.")
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
                    
                    try! await button.guild.modifyMember(button.user.id, with: ["roles": rolesArray])
                    try! await button.reply(message: "Successfully removed the Tour Updates role.")
                    return
                }
            }
            
            var rolesArray: [UInt64] = [931785490003292290]
            for role in button.member!.roles {
                rolesArray.append(role.id.rawValue)
            }
            
            try! await button.guild.modifyMember(button.user.id, with: ["roles": rolesArray])
            try! await button.reply(message: "Successfully added the Tour Updates role.")
        }
        else if button.selectedButton.customId == "hsmtmts" {
            // Check if the member has the role
            for role in button.member!.roles {
                if role.name == "Wildcats" {
                    let roles = button.member!.roles.filter { $0.id != 933765820285329428 }
                    var rolesArray = [UInt64]()
                    
                    for role in roles {
                        rolesArray.append(role.id.rawValue)
                    }
                    
                    try! await button.guild.modifyMember(button.user.id, with: ["roles": rolesArray])
                    try! await button.reply(message: "Successfully removed the Wildcats role.")
                    return
                }
            }
            
            var rolesArray: [UInt64] = [933765820285329428]
            for role in button.member!.roles {
                rolesArray.append(role.id.rawValue)
            }
            
            try! await button.guild.modifyMember(button.user.id, with: ["roles": rolesArray])
            try! await button.reply(message: "Successfully added the Wildcats role.")
        }
        
        // MARK: General Roles
        else if button.selectedButton.customId == "female" {
            // Check if the member has the role
            for role in button.member!.roles {
                if role.name == "she/her" {
                    let roles = button.member!.roles.filter { $0.id != 932448143348490310 }
                    var rolesArray = [UInt64]()
                    
                    for role in roles {
                        rolesArray.append(role.id.rawValue)
                    }
                    
                    try! await button.guild.modifyMember(button.user.id, with: ["roles": rolesArray])
                    try! await button.reply(message: "Successfully removed the She/Her role.")
                    return
                }
            }
            
            var rolesArray: [UInt64] = [932448143348490310]
            for role in button.member!.roles {
                rolesArray.append(role.id.rawValue)
            }
            
            try! await button.guild.modifyMember(button.user.id, with: ["roles": rolesArray])
            try! await button.reply(message: "Successfully added the She/Her role.")
        }
        else if button.selectedButton.customId == "male" {
            // Check if the member has the role
            for role in button.member!.roles {
                if role.name == "he/him" {
                    let roles = button.member!.roles.filter { $0.id != 932448420722008115 }
                    var rolesArray = [UInt64]()
                    
                    for role in roles {
                        rolesArray.append(role.id.rawValue)
                    }
                    
                    try! await button.guild.modifyMember(button.user.id, with: ["roles": rolesArray])
                    try! await button.reply(message: "Successfully removed the He/Him role.")
                    return
                }
            }
            
            var rolesArray: [UInt64] = [932448420722008115]
            for role in button.member!.roles {
                rolesArray.append(role.id.rawValue)
            }
            
            try! await button.guild.modifyMember(button.user.id, with: ["roles": rolesArray])
            try! await button.reply(message: "Successfully added the He/Him role.")
        }
        else if button.selectedButton.customId == "she_they" {
            // Check if the member has the role
            for role in button.member!.roles {
                if role.name == "she/they" {
                    let roles = button.member!.roles.filter { $0.id != 932448836419461150 }
                    var rolesArray = [UInt64]()
                    
                    for role in roles {
                        rolesArray.append(role.id.rawValue)
                    }
                    
                    try! await button.guild.modifyMember(button.user.id, with: ["roles": rolesArray])
                    try! await button.reply(message: "Successfully removed the She/They role.")
                    return
                }
            }
            
            var rolesArray: [UInt64] = [932448836419461150]
            for role in button.member!.roles {
                rolesArray.append(role.id.rawValue)
            }
            
            try! await button.guild.modifyMember(button.user.id, with: ["roles": rolesArray])
            try! await button.reply(message: "Successfully added the She/They role.")
        }
        else if button.selectedButton.customId == "he_they" {
            // Check if the member has the role
            for role in button.member!.roles {
                if role.name == "he/they" {
                    let roles = button.member!.roles.filter { $0.id != 932449018695520296 }
                    var rolesArray = [UInt64]()
                    
                    for role in roles {
                        rolesArray.append(role.id.rawValue)
                    }
                    
                    try! await button.guild.modifyMember(button.user.id, with: ["roles": rolesArray])
                    try! await button.reply(message: "Successfully removed the He/They role.")
                    return
                }
            }
            
            var rolesArray: [UInt64] = [932449018695520296]
            for role in button.member!.roles {
                rolesArray.append(role.id.rawValue)
            }
            
            try! await button.guild.modifyMember(button.user.id, with: ["roles": rolesArray])
            try! await button.reply(message: "Successfully added the He/They role.")
        }
        else if button.selectedButton.customId == "they" {
            // Check if the member has the role
            for role in button.member!.roles {
                if role.name == "they/them" {
                    let roles = button.member!.roles.filter { $0.id != 932449220441542747 }
                    var rolesArray = [UInt64]()
                    
                    for role in roles {
                        rolesArray.append(role.id.rawValue)
                    }
                    
                    try! await button.guild.modifyMember(button.user.id, with: ["roles": rolesArray])
                    try! await button.reply(message: "Successfully removed the They/Them role.")
                    return
                }
            }
            
            var rolesArray: [UInt64] = [932449220441542747]
            for role in button.member!.roles {
                rolesArray.append(role.id.rawValue)
            }
            
            try! await button.guild.modifyMember(button.user.id, with: ["roles": rolesArray])
            try! await button.reply(message: "Successfully added the They/Them role.")
        }
        else if button.selectedButton.customId == "brutal" {
            // Check if the member has the role
            for role in button.member!.roles {
                if role.name == "brutal" {
                    let roles = button.member!.roles.filter { $0.id != 932442263114633277 }
                    var rolesArray = [UInt64]()
                    
                    for role in roles {
                        rolesArray.append(role.id.rawValue)
                    }
                    
                    try! await button.guild.modifyMember(button.user.id, with: ["roles": rolesArray])
                    try! await button.reply(message: "Successfully removed the brutal role.")
                    return
                }
            }
            
            var rolesArray: [UInt64] = [932442263114633277]
            for role in button.member!.roles {
                rolesArray.append(role.id.rawValue)
            }
            
            try! await button.guild.modifyMember(button.user.id, with: ["roles": rolesArray])
            try! await button.reply(message: "Successfully added the brutal role.")
        }
        else if button.selectedButton.customId == "good_for_u" {
            // Check if the member has the role
            for role in button.member!.roles {
                if role.name == "good 4 u" {
                    let roles = button.member!.roles.filter { $0.id != 932441982003994625 }
                    var rolesArray = [UInt64]()
                    
                    for role in roles {
                        rolesArray.append(role.id.rawValue)
                    }
                    
                    try! await button.guild.modifyMember(button.user.id, with: ["roles": rolesArray])
                    try! await button.reply(message: "Successfully removed the good 4 u role.")
                    return
                }
            }
            
            var rolesArray: [UInt64] = [932441982003994625]
            for role in button.member!.roles {
                rolesArray.append(role.id.rawValue)
            }
            
            try! await button.guild.modifyMember(button.user.id, with: ["roles": rolesArray])
            try! await button.reply(message: "Successfully added the good 4 u role.")
        }
        else if button.selectedButton.customId == "drivers_license" {
            // Check if the member has the role
            for role in button.member!.roles {
                if role.name == "drivers license" {
                    let roles = button.member!.roles.filter { $0.id != 932444143492411393 }
                    var rolesArray = [UInt64]()
                    
                    for role in roles {
                        rolesArray.append(role.id.rawValue)
                    }
                    
                    try! await button.guild.modifyMember(button.user.id, with: ["roles": rolesArray])
                    try! await button.reply(message: "Successfully removed the drivers license role.")
                    return
                }
            }
            
            var rolesArray: [UInt64] = [932444143492411393]
            for role in button.member!.roles {
                rolesArray.append(role.id.rawValue)
            }
            
            try! await button.guild.modifyMember(button.user.id, with: ["roles": rolesArray])
            try! await button.reply(message: "Successfully added the drivers license role.")
        }
        else if button.selectedButton.customId == "deja_vu" {
            // Check if the member has the role
            for role in button.member!.roles {
                if role.name == "deja vu" {
                    let roles = button.member!.roles.filter { $0.id != 932442323156078633 }
                    var rolesArray = [UInt64]()
                    
                    for role in roles {
                        rolesArray.append(role.id.rawValue)
                    }
                    
                    try! await button.guild.modifyMember(button.user.id, with: ["roles": rolesArray])
                    try! await button.reply(message: "Successfully removed the deja vu role.")
                    return
                }
            }
            
            var rolesArray: [UInt64] = [932442323156078633]
            for role in button.member!.roles {
                rolesArray.append(role.id.rawValue)
            }
            
            try! await button.guild.modifyMember(button.user.id, with: ["roles": rolesArray])
            try! await button.reply(message: "Successfully added the deja vu role.")
        }
        else if button.selectedButton.customId == "hope_ur_ok" {
            // Check if the member has the role
            for role in button.member!.roles {
                if role.name == "hope ur ok" {
                    let roles = button.member!.roles.filter { $0.id != 932442887663280168 }
                    var rolesArray = [UInt64]()
                    
                    for role in roles {
                        rolesArray.append(role.id.rawValue)
                    }
                    
                    try! await button.guild.modifyMember(button.user.id, with: ["roles": rolesArray])
                    try! await button.reply(message: "Successfully removed the hope ur ok role.")
                    return
                }
            }
            
            var rolesArray: [UInt64] = [932442887663280168]
            for role in button.member!.roles {
                rolesArray.append(role.id.rawValue)
            }
            
            try! await button.guild.modifyMember(button.user.id, with: ["roles": rolesArray])
            try! await button.reply(message: "Successfully added the hope ur ok role.")
        }
        else if button.selectedButton.customId == "traitor" {
            // Check if the member has the role
            for role in button.member!.roles {
                if role.name == "traitor" {
                    let roles = button.member!.roles.filter { $0.id != 932442776178683904 }
                    var rolesArray = [UInt64]()
                    
                    for role in roles {
                        rolesArray.append(role.id.rawValue)
                    }
                    
                    try! await button.guild.modifyMember(button.user.id, with: ["roles": rolesArray])
                    try! await button.reply(message: "Successfully removed the traitor role.")
                    return
                }
            }
            
            var rolesArray: [UInt64] = [932442776178683904]
            for role in button.member!.roles {
                rolesArray.append(role.id.rawValue)
            }
            
            try! await button.guild.modifyMember(button.user.id, with: ["roles": rolesArray])
            try! await button.reply(message: "Successfully added the traitor role.")
        }
    }
}
