//
//  JoinLogger.swift
//  
//
//  Created by Noah Pistilli on 2022-01-16.
//

import Foundation
import Sword

struct JoinLogger {
    func joinLogger() {
        bot.on(.guildMemberAdd) { data in
            let (guild, member) = data as! (Guild, Member)
            
            if guild.id == 931383071461240853 {
                var embed = Embed()
                embed.title = "Welcome to LiviesHQ!"
                embed.author = Embed.Author(iconUrl: "https://cdn.discordapp.com/avatars/\(member.user!.id)/\(member.user!.avatar!)", name: "\(member.user!.username!)#\(member.user!.discriminator!)")
                embed.description = "Hi there! Welcome to Livies HQ!\nBe sure to read the rules to ensure you have a good time!\nAfter you read the rules, go to <#931784923285708830> then <#932422482705674340>."
                embed.image = Embed.Image(height: 100, proxyUrl: "https://tenor.com/view/olivia-rodrigo-good4u-good-for-you-dove-cameron-lazy-baby-gif-23504459", url: "https://tenor.com/view/olivia-rodrigo-good4u-good-for-you-dove-cameron-lazy-baby-gif-23504459", width: 100)
                
                bot.send(embed, to: 931385001336008705)
            }
        }
    }
}
