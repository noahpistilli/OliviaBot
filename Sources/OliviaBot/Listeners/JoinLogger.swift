//
//  JoinLogger.swift
//  
//
//  Created by Noah Pistilli on 2022-01-16.
//

import Foundation
import Swiftcord

class JoinLogger: ListenerAdapter {
    override func onGuildMemberJoin(guild: Guild, member: Member) async {
        if guild.id == 931383071461240853 {
            let embed = EmbedBuilder()
                .setTitle(title: "Welcome to LiviesHQ!")
                .setAuthor(name: "\(member.user!.username!)#\(member.user!.discriminator!)", iconUrl: "https://cdn.discordapp.com/avatars/\(member.user!.id)/\(member.user!.avatar!)")
                .setDescription(description: "Hi there! Welcome to Livies HQ!\nBe sure to read the rules to ensure you have a good time!\nAfter you read the rules, go to <#931784923285708830> then <#932422482705674340>.")
                .setImage(url: "https://tenor.com/view/olivia-rodrigo-good4u-good-for-you-dove-cameron-lazy-baby-gif-23504459", height: 100, width: 100)
                .setTimestamp()
            
            
            let _ = try! await bot.send(embed, to: 931385001336008705)
        }
    }
}

