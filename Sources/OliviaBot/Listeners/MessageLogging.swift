//
//  MessageLogging.swift
//  
//
//  Created by Noah Pistilli on 2022-01-13.
//

import Foundation
import Sword

class MessageLogger {
    let bot: Sword
    var messageCache = [Snowflake:Message]()
    
    init(bot: Sword) {
        self.bot = bot
    }
    
    func messageLogger() {
        /// When a message is created
        self.bot.on(.messageCreate) { data in
            let msg = data as! Message
            
            if msg.guild!.id != 931383071461240853 {
                return
            }
            
            if msg.author?.username == nil {
                return
            }
            
            self.messageCache[msg.id] = msg
        }
        
        /// When a message is deleted
        self.bot.on(.messageDelete) { data in
            let (msgId, channel) = data as! (Snowflake, GuildChannel)
            
            // The message may have been created when the bot was down. As such, check for nil
            guard let messageStruct = self.messageCache[msgId] else { return }
            
            var message = messageStruct.content + "\n"
            let _ = messageStruct.attachments.map{ message += $0.url + "\n" }
            
            var embed = Embed()
            embed.color = 0xff0000
            embed.description = message
            
            let topMessage = "`\(self.timeStamp())` :x: **\(messageStruct.author!.username!)**#\(messageStruct.author!.discriminator!) (ID: \(messageStruct.author!.id.rawValue))'s message was deleted from <#\(channel.id.rawValue)>:"
            
            self.bot.send(["content": topMessage, "embeds": [embed.encode()]], to: 931401024571318293)
        }
        
        /// When a message is edited
        self.bot.on(.messageUpdate) { data in
            /* let (msg, channel) = data as! (Message, GuildChannel)
            
            // The message may have been created when the bot was down. As such, check for nil
            guard let messageStruct = self.messageCache[msg.id] else { return }
            
            if messageStruct.author?.username == nil {
                return
            }
            
            var oldMessage = messageStruct.content + "\n"
            let _ = messageStruct.attachments.map{ oldMessage += $0.url + "\n" }
            
            var newMessage = msg.content + "\n"
            let _ = msg.attachments.map{ newMessage += $0.url + "\n" }
            
            var embed = Embed()
            embed.color = 0xffff00
            embed.addField("From: ", value: oldMessage, isInline: false)
            embed.addField("To: ", value: newMessage, isInline: false)
            
            let topMessage = "`\(self.timeStamp())` :warning: **\(messageStruct.author!.username!)**#\(messageStruct.author!.discriminator!) (ID: \(messageStruct.author!.id.rawValue)) edited a message in <#\(channel.id.rawValue)>:"
            
            self.bot.send(["content": topMessage, "embeds": [embed.encode()]], to: 931401024571318293) */
        }
        
        /// When a member joined the server
        self.bot.on(.guildMemberAdd) { data in
            let (guild, member) = data as! (Guild, Member)
            
            if guild.id != 931383071461240853 {
                return
            }
            
            // TODO: Add creation time
            let message = "`\(self.timeStamp())` :inbox_tray: **\(member.user!.username!)**#\(member.user!.discriminator!) (ID: \(member.user!.id)) joined the server."
            
            self.bot.send(message, to: 931401024571318293)
        }
        
        /// When a member left the server
        self.bot.on(.guildMemberRemove) { data in
            let (guild, user) = data as! (Guild, User)
            
            if guild.id != 931383071461240853 {
                return
            }
            
            // TODO: Add creation time
            let message = "`\(self.timeStamp())` :outbox_tray: **\(user.username!)**#\(user.discriminator!) (ID: \(user.id)) has left the server."
            
            self.bot.send(message, to: 931401024571318293)
        }
    }
    
    func timeStamp() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        dateFormatter.timeZone = TimeZone(identifier: "UTC")!
        
        return dateFormatter.string(from: Date())
    }
}
