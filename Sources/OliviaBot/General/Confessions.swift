//
//  Confessions.swift
//  
//
//  Created by Noah Pistilli on 2022-01-16.
//

import Foundation
import Sword

struct Confessions {
    func sendSuccess(event: SlashCommandEvent) {
        var event = event
        
        event.setEphemeral(isEphermeral: true)
        self.sendToChannel(event: event)
        self.logToChannel(event: event)
        event.reply(message: "Your confession has been recorded!")
    }
    
    func sendToChannel(event: SlashCommandEvent) {
        var embed = Embed()
        embed.title = "Confession"
        embed.description = event.getOptionAsString(optionName: "confession")!
        embed.footer = Embed.Footer(text: "Sent at \(self.timeStamp()) UTC")
        embed.color = 0xb19cd9
        
        event.sword.send(embed, to: 932331114608095272)
    }
    
    func logToChannel(event: SlashCommandEvent) {
        var embed = Embed()
        embed.title = "A new confession was sent by \(event.user.username!) ID: (\(event.user.id))"
        embed.description = event.getOptionAsString(optionName: "confession")!
        embed.footer = Embed.Footer(text: "Sent at \(self.timeStamp()) UTC")
        embed.color = 0xb19cd9
        
        event.sword.send(embed, to: 932328333478334517)
    }
    
    func timeStamp() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        dateFormatter.timeZone = TimeZone(identifier: "UTC")!
        
        return dateFormatter.string(from: Date())
    }
}
