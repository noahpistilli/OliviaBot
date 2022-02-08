//
//  MessageLogging.swift
//  
//
//  Created by Noah Pistilli on 2022-01-13.
//

import Foundation
import Swiftcord

class MessageLogger: ListenerAdapter {
    let bot: Swiftcord
    var messageCache = [Snowflake:Message]()
    
    init(bot: Swiftcord) {
        self.bot = bot
    }
    
    override func onMessageCreate(event: Message) async {
        if event.guild!.id != 931383071461240853 {
            return
        }
        
        if event.author?.username == nil {
            return
        }
        
        self.messageCache[event.id] = event
    }

    override func onMessageDelete(messageId: Snowflake, channel: Channel) async {
        // The message may have been created when the bot was down. As such, check for nil
        guard let messageStruct = self.messageCache[messageId] else { return }
        
        var message = messageStruct.content + "\n"
        let _ = messageStruct.attachments.map{ message += $0.url + "\n" }
        
        var embed = Embed()
        embed.color = 0xff0000
        embed.description = message
        
        let topMessage = "`\(self.timeStamp())` :x: **\(messageStruct.author!.username!)**#\(messageStruct.author!.discriminator!) (ID: \(messageStruct.author!.id.rawValue))'s message was deleted from <#\(channel.id.rawValue)>:"
        
        let _ = try! await self.bot.send(["content": topMessage, "embeds": [embed.encode()]], to: 931401024571318293)
    }
    
    override func onGuildMemberJoin(guild: Guild, member: Member) async {
        if guild.id != 931383071461240853 {
            return
        }
        
        // TODO: Add creation time
        let message = "`\(self.timeStamp())` :inbox_tray: **\(member.user!.username!)**#\(member.user!.discriminator!) (ID: \(member.user!.id)) joined the server."
        
        let _ = try! await self.bot.send(message, to: 931401024571318293)
    }
    
    override func onGuildMemberLeave(guild: Guild, user: User) async {
        if guild.id != 931383071461240853 {
            return
        }
        
        // TODO: Add creation time
        let message = "`\(self.timeStamp())` :outbox_tray: **\(user.username!)**#\(user.discriminator!) (ID: \(user.id)) has left the server."
        
        let _ = try! await self.bot.send(message, to: 931401024571318293)
    }
    
    func timeStamp() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        dateFormatter.timeZone = TimeZone(identifier: "UTC")!
        
        return dateFormatter.string(from: Date())
    }
}
