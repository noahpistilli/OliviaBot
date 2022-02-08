//
//  Clear.swift
//  
//
//  Created by Noah Pistilli on 2022-01-14.
//

import Foundation
import Swiftcord

func clear(event: SlashCommandEvent) async {
    let channel = bot.getChannel(for: event.channelId)! as! GuildText
    let cache = messageLogger.messageCache
        
    let amount = event.getOptionAsInt(optionName: "amount")!
    
    // Clear the messages now
    var messagesToClear = [Snowflake]()
        
    for (i, values) in cache.enumerated() {
        if (i <= cache.count) || (i >= cache.count - amount) {
            messagesToClear.append(values.key)
        }
    }
        
    try! await channel.deleteMessages(messagesToClear)
    sleep(1)
    try! await event.reply(message: "I have cleared \(amount) messages.")
}
