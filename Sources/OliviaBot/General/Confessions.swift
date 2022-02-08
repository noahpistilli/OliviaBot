//
//  Confessions.swift
//  
//
//  Created by Noah Pistilli on 2022-01-16.
//

import Foundation
import Swiftcord

struct Confessions {
    func sendSuccess(event: SlashCommandEvent) async {
        var event = event
        
        event.setEphemeral(true)
        await self.sendToChannel(event: event)
        await self.logToChannel(event: event)
        try! await event.reply(message: "Your confession has been recorded!")
    }
    
    func sendToChannel(event: SlashCommandEvent) async {
        let embed = EmbedBuilder()
            .setTitle(title: "Confession")
            .setDescription(description: event.getOptionAsString(optionName: "confession")!)
            .setColor(color: 0xb19cd9)
            .setTimestamp()
        
        let _ = try! await event.swiftcord.send(embed, to: 932331114608095272)
    }
    
    func logToChannel(event: SlashCommandEvent) async {
        let embed = EmbedBuilder()
            .setTitle(title: "A new confession was sent by \(event.user.username!) ID: (\(event.user.id))")
            .setDescription(description: event.getOptionAsString(optionName: "confession")!)
            .setColor(color: 0xb19cd9)
            .setTimestamp()
        
        let _ = try! await event.swiftcord.send(embed, to: 932328333478334517)
    }
    
    func timeStamp() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        dateFormatter.timeZone = TimeZone(identifier: "UTC")!
        
        return dateFormatter.string(from: Date())
    }
}
